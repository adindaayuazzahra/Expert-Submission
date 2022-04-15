import '../../../domain/entities/genre.dart';
import '../../../domain/entities/tv_entities/season.dart';

import 'package:equatable/equatable.dart';

class TVDetail extends Equatable {
  const TVDetail({
    this.backdropPath,
    required this.genres,
    required this.id,
    required this.inProduction,
    required this.name,
    required this.numberOfEpisodes,
    required this.numberOfSeasons,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.seasons,
    required this.status,
    required this.tagline,
    required this.type,
    required this.voteAverage,
    required this.voteCount,
  });

  final String? backdropPath;

  final List<Genre> genres;

  final int id;
  final bool inProduction;

  final String name;

  final int numberOfEpisodes;
  final int numberOfSeasons;

  final String overview;
  final double popularity;
  final String posterPath;

  final List<Season> seasons;

  final String status;
  final String tagline;
  final String type;
  final double voteAverage;
  final int voteCount;

  @override
  List<Object?> get props => [
        genres,
        id,
        inProduction,
        name,
        numberOfEpisodes,
        numberOfSeasons,
        overview,
        popularity,
        posterPath,
        seasons,
        status,
        tagline,
        type,
        voteAverage,
        voteCount,
      ];
}
