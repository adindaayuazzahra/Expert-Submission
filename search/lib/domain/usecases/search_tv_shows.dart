import 'package:dartz/dartz.dart';
import 'package:core/core.dart';

class SearchTVShows {
  final TVRepository repository;

  SearchTVShows(this.repository);

  Future<Either<Failure, List<TV>>> execute(String query) {
    return repository.searchTVShows(query);
  }
}
