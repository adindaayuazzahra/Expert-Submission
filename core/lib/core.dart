library core;

export 'utils/constants.dart';
export 'utils/exception.dart';
export 'utils/failure.dart';
export 'utils/state_enum.dart';
export 'utils/utils.dart';

//data
//datasource
export 'data/datasources/db/database_helper.dart';
export 'data/datasources/db/database_helper_tv.dart';
export 'data/datasources/movie_local_data_source.dart';
export 'data/datasources/movie_remote_data_source.dart';
export 'data/datasources/tv_local_data_source.dart';
export 'data/datasources/tv_remote_data_source.dart';
//models
export 'data/models/tv_model/season_model.dart';
export 'data/models/tv_model/tv_detail_model.dart';
export 'data/models/tv_model/tv_model.dart';
export 'data/models/tv_model/tv_response.dart';
export 'data/models/tv_model/tv_table.dart';
export 'data/models/movie_model/genre_model.dart';
export 'data/models/movie_model/movie_detail_model.dart';
export 'data/models/movie_model/movie_model.dart';
export 'data/models/movie_model/movie_response.dart';
export 'data/models/movie_model/movie_table.dart';
//repositories
export 'data/repositories/movie_repository_impl.dart';
export 'data/repositories/tv_repository_impl.dart';

//domain
//entities
export 'domain/entities/movie_entities/genre.dart';
export 'domain/entities/movie_entities/movie.dart';
export 'domain/entities/movie_entities/movie_detail.dart';
export 'domain/entities/tv_entities/season.dart';
export 'domain/entities/tv_entities/tv.dart';
export 'domain/entities/tv_entities/tv_detail.dart';
//repossitories
export 'domain/repositories/movie_repository.dart';
export 'domain/repositories/tv_repository.dart';

//presentation
//widgets
export 'presentation/widgets/movie_card_list.dart';
export 'presentation/widgets/tv_card_list.dart';
