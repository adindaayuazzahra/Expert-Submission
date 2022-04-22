import 'package:core/core.dart';
import 'package:movie/movie.dart';
import 'package:watchlist/watchlist.dart';
import 'package:tv/tv.dart';
import 'package:search/search.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final locator = GetIt.instance;

void init() {
  //search bloc
  locator.registerFactory(() => SearchMoviesBloc(locator()));
  locator.registerFactory(() => SearchTvBloc(locator()));
  //watchlist bloc
  locator.registerFactory(
    () => MovieWatchlistBloc(
      locator(),
      locator(),
      locator(),
      locator(),
    ),
  );
  locator.registerFactory(
    () => TvWatchlistBloc(
      locator(),
      locator(),
      locator(),
      locator(),
    ),
  );
  // provider
  // locator.registerFactory(
  //   () => MovieListNotifier(
  //     getNowPlayingMovies: locator(),
  //     getPopularMovies: locator(),
  //     getTopRatedMovies: locator(),
  //   ),
  // );
  // locator.registerFactory(
  //   () => MovieDetailNotifier(
  //     getMovieDetail: locator(),
  //     getMovieRecommendations: locator(),
  //     getWatchListStatus: locator(),
  //     saveWatchlist: locator(),
  //     removeWatchlist: locator(),
  //   ),
  // );
  // locator.registerFactory(
  //   () => PopularMoviesNotifier(
  //     locator(),
  //   ),
  // );
  // locator.registerFactory(
  //   () => TopRatedMoviesNotifier(
  //     getTopRatedMovies: locator(),
  //   ),
  // );
  // locator.registerFactory(
  //   () => WatchlistMovieNotifier(
  //     getWatchlistMovies: locator(),
  //     getWatchListTVShow: locator(),
  //   ),
  // );

  // locator.registerFactory(
  //   () => TVListNotifier(
  //     getTVOnTheAir: locator(),
  //     getPopularTVShows: locator(),
  //     getTopRatedTVShows: locator(),
  //   ),
  // );
  // locator.registerFactory(
  //   () => PopularTVNotifier(
  //     locator(),
  //   ),
  // );
  // locator.registerFactory(
  //   () => TVDetailNotifier(
  //     getTVDetail: locator(),
  //     getTVRecommendations: locator(),
  //     getWatchListTVStatus: locator(),
  //     saveTVWatchlist: locator(),
  //     removeTVWatchlist: locator(),
  //   ),
  // );
  // locator.registerFactory(
  //   () => TopRatedTVNotifier(
  //     getTopRatedTVShows: locator(),
  //   ),
  // );

  //tv bloc
  locator.registerFactory(() => TvListBloc(locator()));
  locator.registerFactory(() => TvDetailBloc(locator()));
  locator.registerFactory(() => TvPopularBloc(locator()));
  locator.registerFactory(() => TvRecommendationBloc(locator()));
  locator.registerFactory(() => TvTopRatedBloc(locator()));

  //moviebloc
  locator.registerFactory(() => MovieListBloc(locator()));
  locator.registerFactory(() => MoviePopularBloc(locator()));
  locator.registerFactory(() => MovieRecommendationBloc(locator()));
  locator.registerFactory(() => MovieTopRatedBloc(locator()));
  locator.registerFactory(() => MovieDetailBloc(locator()));

  // use case
  locator.registerLazySingleton(() => GetNowPlayingMovies(locator()));
  locator.registerLazySingleton(() => GetPopularMovies(locator()));
  locator.registerLazySingleton(() => GetTopRatedMovies(locator()));
  locator.registerLazySingleton(() => GetMovieDetail(locator()));
  locator.registerLazySingleton(() => GetMovieRecommendations(locator()));
  locator.registerLazySingleton(() => SearchMovies(locator()));
  locator.registerLazySingleton(() => GetWatchListStatus(locator()));
  locator.registerLazySingleton(() => SaveWatchlist(locator()));
  locator.registerLazySingleton(() => RemoveWatchlist(locator()));
  locator.registerLazySingleton(() => GetWatchlistMovies(locator()));

  locator.registerLazySingleton(() => GetPopularTVShows(locator()));
  locator.registerLazySingleton(() => GetTopRatedTVShows(locator()));
  locator.registerLazySingleton(() => GetTVOnTheAir(locator()));
  locator.registerLazySingleton(() => GetTVRecommendations(locator()));
  locator.registerLazySingleton(() => GetTVShowDetail(locator()));
  locator.registerLazySingleton(() => SearchTVShows(locator()));
  locator.registerLazySingleton(() => GetWatchlistTVShows(locator()));
  locator.registerLazySingleton(() => GetWatchlistTVStatus(locator()));
  locator.registerLazySingleton(() => SaveTVWatchList(locator()));
  locator.registerLazySingleton(() => RemoveTVWatchlist(locator()));

  // repository
  locator.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
    ),
  );

  locator.registerLazySingleton<TVRepository>(
    () => TVRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
    ),
  );

  // data sources
  locator.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<MovieLocalDataSource>(
      () => MovieLocalDataSourceImpl(databaseHelper: locator()));

  locator.registerLazySingleton<TVRemoteDataSource>(
      () => TVRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<TVLocalDataSource>(
      () => TVLocalDataSourceImpl(databaseHelperTV: locator()));

  // helper
  locator.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());
  locator.registerLazySingleton<DatabaseHelperTv>(() => DatabaseHelperTv());

  // external
  locator.registerLazySingleton(() => http.Client());
  locator.registerLazySingleton<ApiIOClient>(() => ApiIOClient());
}
