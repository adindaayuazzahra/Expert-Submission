import 'package:ditonton/data/models/tv_model/tv_model.dart';
import 'package:ditonton/domain/entities/tv_entities/tv.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final tTVModel = TVModel(
    backdropPath: 'backdropPath',
    firstAirDate: 'firstAirDate',
    genreIds: [1, 2, 3],
    id: 1,
    overview: 'overview',
    originalName: 'originalName',
    popularity: 1,
    posterPath: 'posterPath',
    name: 'name',
    voteAverage: 1,
    voteCount: 1,
    originalLanguage: '',
    originCountry: [],
  );

  final tTV = TV(
    backdropPath: 'backdropPath',
    firstAirDate: 'firstAirDate',
    genreIds: [1, 2, 3],
    id: 1,
    overview: 'overview',
    originalName: 'originalName',
    popularity: 1,
    posterPath: 'posterPath',
    name: 'name',
    voteAverage: 1,
    voteCount: 1,
    originalLanguage: '',
    originCountry: [],
  );

  test('should be a subclass of Movie entity', () async {
    final result = tTVModel.toEntity();
    expect(result, tTV);
  });
}
