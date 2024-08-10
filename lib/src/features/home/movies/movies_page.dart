import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

import 'package:cinema_plus/src/components/custom_tab_indicator.dart';
import 'package:cinema_plus/src/constants/arb_styles.dart';
import 'package:cinema_plus/src/features/home/movies/tabs/discover_movies.dart';
import 'package:cinema_plus/src/features/home/movies/tabs/now_playing_movies.dart';
import 'package:cinema_plus/src/features/home/movies/tabs/upcoming_movies.dart';
import 'package:cinema_plus/src/style/color/cp_color.dart';

@RoutePage()
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
    return SafeArea(
      child: Padding(
        padding: defaultPadding,
        child: Column(
          children: [
            TabBar(
              controller: tabController,
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: CPColors.white,
              indicator: CustomTabIndicator(),
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
    );
  }
}
