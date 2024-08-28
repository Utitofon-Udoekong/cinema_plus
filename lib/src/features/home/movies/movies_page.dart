import 'package:cinema_plus/src/features/search/cp_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:cinema_plus/src/components/custom_tab_indicator.dart';
import 'package:cinema_plus/src/constants/arb_styles.dart';
import 'package:cinema_plus/src/features/movie_tabs/tabs/discover_movies.dart';
import 'package:cinema_plus/src/features/movie_tabs/tabs/now_playing_movies.dart';
import 'package:cinema_plus/src/features/movie_tabs/tabs/upcoming_movies.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({super.key});

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  int currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CPSearchBar(),
      body: SafeArea(
        child: Padding(
          padding: defaultPadding,
          child: Column(
            children: [
              TabBar(
                controller: tabController,
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: Theme.of(context).colorScheme.onSurface,
                indicator: CustomTabIndicator(
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.primary,
                ),
                dividerHeight: 0,
                tabs: const [
                  Tab(
                    text: 'Discover',
                  ),
                  Tab(
                    text: 'Upcoming',
                  ),
                  Tab(
                    text: 'Now Playing',
                  ),
                ],
              ),
              const Gap(20),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: const [
                    DiscoverMovies(),
                    UpcomingMovies(),
                    NowPlayingMovies(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

