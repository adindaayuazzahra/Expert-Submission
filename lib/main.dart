import 'package:core/core.dart';
import 'package:about/about.dart';
import 'package:movie/movie.dart';
import 'package:watchlist/watchlist.dart';
import 'package:search/search.dart';
import 'package:tv/tv.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ditonton/injection.dart' as di;

void main() {
  di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        //bloc
        // search bloc
        BlocProvider(
          create: (context) => di.locator<SearchMoviesBloc>(),
        ),
        BlocProvider(
          create: (context) => di.locator<SearchTvBloc>(),
        ),

        //watchlist
        BlocProvider(
          create: (context) => di.locator<MovieWatchlistBloc>(),
        ),
        BlocProvider(
          create: (context) => di.locator<TvWatchlistBloc>(),
        ),

        //tv bloc
        BlocProvider(
          create: (context) => di.locator<TvListBloc>(),
        ),
        BlocProvider(
          create: (context) => di.locator<TvDetailBloc>(),
        ),
        BlocProvider(
          create: (context) => di.locator<TvPopularBloc>(),
        ),
        BlocProvider(
          create: (context) => di.locator<TvRecommendationBloc>(),
        ),
        BlocProvider(
          create: (context) => di.locator<TvTopRatedBloc>(),
        ),

        //moviebloc
        BlocProvider(
          create: (context) => di.locator<MovieListBloc>(),
        ),
        BlocProvider(
          create: (context) => di.locator<MoviePopularBloc>(),
        ),
        BlocProvider(
          create: (context) => di.locator<MovieRecommendationBloc>(),
        ),
        BlocProvider(
          create: (context) => di.locator<MovieTopRatedBloc>(),
        ),
        BlocProvider(
          create: (context) => di.locator<MovieDetailBloc>(),
        ),

        // ChangeNotifierProvider(
        //   create: (_) => di.locator<MovieListNotifier>(),
        // ),
        // ChangeNotifierProvider(
        //   create: (_) => di.locator<MovieDetailNotifier>(),
        // ),
        // ChangeNotifierProvider(
        //   create: (_) => di.locator<MovieSearchNotifier>(),
        // ),
        // ChangeNotifierProvider(
        //   create: (_) => di.locator<TopRatedMoviesNotifier>(),
        // ),
        // ChangeNotifierProvider(
        //   create: (_) => di.locator<PopularMoviesNotifier>(),
        // ),
        // ChangeNotifierProvider(
        //   create: (_) => di.locator<WatchlistMovieNotifier>(),
        // ),
        // ChangeNotifierProvider(
        //   create: (_) => di.locator<TVListNotifier>(),
        // ),
        // ChangeNotifierProvider(
        //   create: (_) => di.locator<TVDetailNotifier>(),
        // ),
        // ChangeNotifierProvider(
        //   create: (_) => di.locator<PopularTVNotifier>(),
        // ),
        // ChangeNotifierProvider(
        //   create: (_) => di.locator<TopRatedTVNotifier>(),
        // ),
        // ChangeNotifierProvider(
        //   create: (_) => di.locator<TVSearchNotifier>(),
        // ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
          colorScheme: kColorScheme,
          primaryColor: kRichBlack,
          scaffoldBackgroundColor: kRichBlack,
          textTheme: kTextTheme,
        ),
        home: HomeMoviePage(),
        navigatorObservers: [routeObserver],
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case '/home':
              return MaterialPageRoute(builder: (_) => HomeMoviePage());
            case PopularMoviesPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => PopularMoviesPage());
            case PopularTVPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => PopularTVPage());
            case TopRatedMoviesPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => TopRatedMoviesPage());
            case TopRatedTVPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => TopRatedTVPage());
            case MovieDetailPage.ROUTE_NAME:
              final id = settings.arguments as int;
              return MaterialPageRoute(
                builder: (_) => MovieDetailPage(id: id),
                settings: settings,
              );
            case TVDetailPage.ROUTE_NAME:
              final id = settings.arguments as int;
              return MaterialPageRoute(
                builder: (_) => TVDetailPage(id: id),
                settings: settings,
              );
            case SearchPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => SearchPage());

            case WatchlistMoviesPage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => WatchlistMoviesPage());
            case AboutPage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => AboutPage());
            default:
              return MaterialPageRoute(builder: (_) {
                return Scaffold(
                  body: Center(
                    child: Text('Page not found :('),
                  ),
                );
              });
          }
        },
      ),
    );
  }
}
