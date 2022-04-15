import 'dart:convert';

import 'package:ditonton/data/models/tv_model/tv_model.dart';
import 'package:ditonton/data/models/tv_model/tv_response.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../json_reader.dart';

void main() {
  final tMovieModel = TVModel(
    backdropPath: '',
    firstAirDate: '',
    genreIds: [1, 2],
    id: 1,
    overview: '',
    originalName: '',
    popularity: 1,
    posterPath: '',
    name: '',
    voteAverage: 1,
    voteCount: 1,
    originalLanguage: '',
    originCountry: [],
  );
  final tMovieResponseModel = TvResponse(tvList: <TVModel>[tMovieModel]);
  group('fromJson', () {
    test('should return a valid model from JSON', () async {
      // arrange
      final Map<String, dynamic> jsonMap =
          json.decode(readJson('dummy_data/on_the_air.json'));
      // act
      final result = TvResponse.fromJson(jsonMap);
      // assert
      expect(result, tMovieResponseModel);
    });
  });

  group('toJson', () {
    test('should return a JSON map containing proper data', () async {
      // act
      final result = tMovieResponseModel.toJson();
      // assert
      final expectedJsonMap = {
        "results": [
          {
            'backdrop_path': '',
            'first_air_date': '',
            'genre_ids': [1, 2],
            'id': 1,
            'name': '',
            'origin_country': [],
            'original_language': '',
            'original_name': '',
            'overview': '',
            'popularity': 1.0,
            'poster_path': '',
            'vote_average': 1.0,
            'vote_count': 1
          }
        ],
      };
      expect(result, expectedJsonMap);
    });
  });
}
