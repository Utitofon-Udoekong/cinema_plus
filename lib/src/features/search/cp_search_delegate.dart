import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinema_plus/src/constants/constants.dart';
import 'package:cinema_plus/src/models/models.dart';
import 'package:cinema_plus/src/style/style.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class DebouncedSearchDelegate extends SearchDelegate<String> {
  Timer? _debounceTimer;
  List<Movie> _currentResults = [];

  final BuildContext context;
  final Duration debounceDuration;
  final Future<List<Movie>> Function(String) searchFunction;
  final void Function(Movie) showMovieDetails;

  DebouncedSearchDelegate({
    required this.context,
    this.debounceDuration = const Duration(milliseconds: 300),
    required this.searchFunction,
    required this.showMovieDetails,
  });

  

  @override
  TextStyle? get searchFieldStyle => CPTextStyle.subTitle(context);

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context);
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
          close(context, '');
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildSearchResults();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    _debounceSearch();
    return _buildSearchResults();
  }

  Widget _buildSearchResults() {
    return FutureBuilder<List<Movie>>(
      future: _currentResults.isEmpty
          ? searchFunction(query)
          : Future.value(_currentResults),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          final results = snapshot.data!;
          return ListView.builder(
            itemCount: results.length,
            itemBuilder: (context, index) {
              final movie = results[index];
              return ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(defaultRadiusSm),
                  child: CachedNetworkImage(
                    imageUrl: '${AppStrings.imageUrl}${movie.backdropPath}',
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) {
                      return Container(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        child: Icon(Icons.error, color: Theme.of(context).colorScheme.error,),
                      );
                    },
                    width: 50,
                    height: 40,
                  ),
                ),
                title: Text(movie.title),
                onTap: () {
                  query = movie.title;
                  showMovieDetails(movie);
                  // showResults(context);
                },
              );
            },
          );
        } else {
          return const Center(child: Text('No results found'));
        }
      },
    );
  }

  void _debounceSearch() {
    if (_debounceTimer?.isActive ?? false) _debounceTimer!.cancel();
    _debounceTimer = Timer(debounceDuration, () async {
      _currentResults = await searchFunction(query);
    });
  }
}
