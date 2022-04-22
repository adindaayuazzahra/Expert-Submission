library watchlist;

export 'presentation/pages/watchlist_movies_page.dart';
//bloc
export 'presentation/bloc/movies/movie_watchlist_bloc.dart';
export 'presentation/bloc/tvShow/tv_watchlist_bloc.dart';

//usecase
export 'domain/usecases/movie_usecase/get_watchlist_movies.dart';
export 'domain/usecases/movie_usecase/get_watchlist_status.dart';
export 'domain/usecases/movie_usecase/remove_watchlist.dart';
export 'domain/usecases/movie_usecase/save_watchlist.dart';

export 'domain/usecases/tv_usecase/get_watchlist_Tvshows.dart';
export 'domain/usecases/tv_usecase/get_watchlist_tv_status.dart';
export 'domain/usecases/tv_usecase/remove_tv_watchlist.dart';
export 'domain/usecases/tv_usecase/save_tv_watchlist.dart';
