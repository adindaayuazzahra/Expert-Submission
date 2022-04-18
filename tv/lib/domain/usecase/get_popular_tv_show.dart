import 'package:dartz/dartz.dart';
import 'package:core/core.dart';

class GetPopularTVShows {
  final TVRepository repository;

  GetPopularTVShows(this.repository);

  Future<Either<Failure, List<TV>>> execute() {
    return repository.getPopularTVShows();
  }
}
