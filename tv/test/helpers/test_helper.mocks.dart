// Mocks generated by Mockito 5.1.0 from annotations
// in tv/test/helpers/test_helper_tv.dart.
// Do not manually edit this file.

import 'dart:async' as _i5;
import 'dart:convert' as _i7;
import 'dart:typed_data' as _i8;

import 'package:core/core.dart' as _i3;
import 'package:dartz/dartz.dart' as _i2;
import 'package:http/http.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;
import 'package:sqflite/sqflite.dart' as _i6;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeEither_0<L, R> extends _i1.Fake implements _i2.Either<L, R> {}

class _FakeTvDetailResponse_1 extends _i1.Fake implements _i3.TvDetailResponse {
}

class _FakeResponse_2 extends _i1.Fake implements _i4.Response {}

class _FakeStreamedResponse_3 extends _i1.Fake implements _i4.StreamedResponse {
}

/// A class which mocks [TVRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockTVRepository extends _i1.Mock implements _i3.TVRepository {
  MockTVRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i2.Either<_i3.Failure, List<_i3.TV>>> getTVOnTheAir() =>
      (super.noSuchMethod(Invocation.method(#getTVOnTheAir, []),
              returnValue: Future<_i2.Either<_i3.Failure, List<_i3.TV>>>.value(
                  _FakeEither_0<_i3.Failure, List<_i3.TV>>()))
          as _i5.Future<_i2.Either<_i3.Failure, List<_i3.TV>>>);
  @override
  _i5.Future<_i2.Either<_i3.Failure, _i3.TVDetail>> getTVShowDetail(int? id) =>
      (super.noSuchMethod(Invocation.method(#getTVShowDetail, [id]),
              returnValue: Future<_i2.Either<_i3.Failure, _i3.TVDetail>>.value(
                  _FakeEither_0<_i3.Failure, _i3.TVDetail>()))
          as _i5.Future<_i2.Either<_i3.Failure, _i3.TVDetail>>);
  @override
  _i5.Future<_i2.Either<_i3.Failure, List<_i3.TV>>> getPopularTVShows() =>
      (super.noSuchMethod(Invocation.method(#getPopularTVShows, []),
              returnValue: Future<_i2.Either<_i3.Failure, List<_i3.TV>>>.value(
                  _FakeEither_0<_i3.Failure, List<_i3.TV>>()))
          as _i5.Future<_i2.Either<_i3.Failure, List<_i3.TV>>>);
  @override
  _i5.Future<_i2.Either<_i3.Failure, List<_i3.TV>>> getTopRatedTVShows() =>
      (super.noSuchMethod(Invocation.method(#getTopRatedTVShows, []),
              returnValue: Future<_i2.Either<_i3.Failure, List<_i3.TV>>>.value(
                  _FakeEither_0<_i3.Failure, List<_i3.TV>>()))
          as _i5.Future<_i2.Either<_i3.Failure, List<_i3.TV>>>);
  @override
  _i5.Future<_i2.Either<_i3.Failure, List<_i3.TV>>> getTvRecommendations(
          int? id) =>
      (super.noSuchMethod(Invocation.method(#getTvRecommendations, [id]),
              returnValue: Future<_i2.Either<_i3.Failure, List<_i3.TV>>>.value(
                  _FakeEither_0<_i3.Failure, List<_i3.TV>>()))
          as _i5.Future<_i2.Either<_i3.Failure, List<_i3.TV>>>);
  @override
  _i5.Future<_i2.Either<_i3.Failure, List<_i3.TV>>> searchTVShows(
          String? query) =>
      (super.noSuchMethod(Invocation.method(#searchTVShows, [query]),
              returnValue: Future<_i2.Either<_i3.Failure, List<_i3.TV>>>.value(
                  _FakeEither_0<_i3.Failure, List<_i3.TV>>()))
          as _i5.Future<_i2.Either<_i3.Failure, List<_i3.TV>>>);
  @override
  _i5.Future<_i2.Either<_i3.Failure, String>> saveWatchlist(_i3.TVDetail? tv) =>
      (super.noSuchMethod(Invocation.method(#saveWatchlist, [tv]),
              returnValue: Future<_i2.Either<_i3.Failure, String>>.value(
                  _FakeEither_0<_i3.Failure, String>()))
          as _i5.Future<_i2.Either<_i3.Failure, String>>);
  @override
  _i5.Future<_i2.Either<_i3.Failure, String>> removeWatchlist(
          _i3.TVDetail? tv) =>
      (super.noSuchMethod(Invocation.method(#removeWatchlist, [tv]),
              returnValue: Future<_i2.Either<_i3.Failure, String>>.value(
                  _FakeEither_0<_i3.Failure, String>()))
          as _i5.Future<_i2.Either<_i3.Failure, String>>);
  @override
  _i5.Future<bool> isAddedToWatchlist(int? id) =>
      (super.noSuchMethod(Invocation.method(#isAddedToWatchlist, [id]),
          returnValue: Future<bool>.value(false)) as _i5.Future<bool>);
  @override
  _i5.Future<_i2.Either<_i3.Failure, List<_i3.TV>>> getWatchListTVShow() =>
      (super.noSuchMethod(Invocation.method(#getWatchListTVShow, []),
              returnValue: Future<_i2.Either<_i3.Failure, List<_i3.TV>>>.value(
                  _FakeEither_0<_i3.Failure, List<_i3.TV>>()))
          as _i5.Future<_i2.Either<_i3.Failure, List<_i3.TV>>>);
}

/// A class which mocks [TVRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockTVRemoteDataSource extends _i1.Mock
    implements _i3.TVRemoteDataSource {
  MockTVRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<List<_i3.TVModel>> getTVOnTheAir() =>
      (super.noSuchMethod(Invocation.method(#getTVOnTheAir, []),
              returnValue: Future<List<_i3.TVModel>>.value(<_i3.TVModel>[]))
          as _i5.Future<List<_i3.TVModel>>);
  @override
  _i5.Future<_i3.TvDetailResponse> getTVDetail(int? id) =>
      (super.noSuchMethod(Invocation.method(#getTVDetail, [id]),
              returnValue:
                  Future<_i3.TvDetailResponse>.value(_FakeTvDetailResponse_1()))
          as _i5.Future<_i3.TvDetailResponse>);
  @override
  _i5.Future<List<_i3.TVModel>> getPopularTVShows() =>
      (super.noSuchMethod(Invocation.method(#getPopularTVShows, []),
              returnValue: Future<List<_i3.TVModel>>.value(<_i3.TVModel>[]))
          as _i5.Future<List<_i3.TVModel>>);
  @override
  _i5.Future<List<_i3.TVModel>> getTopRatedTVShows() =>
      (super.noSuchMethod(Invocation.method(#getTopRatedTVShows, []),
              returnValue: Future<List<_i3.TVModel>>.value(<_i3.TVModel>[]))
          as _i5.Future<List<_i3.TVModel>>);
  @override
  _i5.Future<List<_i3.TVModel>> getTvRecommendations(int? id) =>
      (super.noSuchMethod(Invocation.method(#getTvRecommendations, [id]),
              returnValue: Future<List<_i3.TVModel>>.value(<_i3.TVModel>[]))
          as _i5.Future<List<_i3.TVModel>>);
  @override
  _i5.Future<List<_i3.TVModel>> searchTVShows(String? query) =>
      (super.noSuchMethod(Invocation.method(#searchTVShows, [query]),
              returnValue: Future<List<_i3.TVModel>>.value(<_i3.TVModel>[]))
          as _i5.Future<List<_i3.TVModel>>);
}

/// A class which mocks [TVLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockTVLocalDataSource extends _i1.Mock implements _i3.TVLocalDataSource {
  MockTVLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<String> insertTVWatchlist(_i3.TVTable? tv) =>
      (super.noSuchMethod(Invocation.method(#insertTVWatchlist, [tv]),
          returnValue: Future<String>.value('')) as _i5.Future<String>);
  @override
  _i5.Future<String> removeTVWatchlist(_i3.TVTable? tv) =>
      (super.noSuchMethod(Invocation.method(#removeTVWatchlist, [tv]),
          returnValue: Future<String>.value('')) as _i5.Future<String>);
  @override
  _i5.Future<_i3.TVTable?> getTVShowById(int? id) => (super.noSuchMethod(
      Invocation.method(#getTVShowById, [id]),
      returnValue: Future<_i3.TVTable?>.value()) as _i5.Future<_i3.TVTable?>);
  @override
  _i5.Future<List<_i3.TVTable>> getWatchlistTVShow() =>
      (super.noSuchMethod(Invocation.method(#getWatchlistTVShow, []),
              returnValue: Future<List<_i3.TVTable>>.value(<_i3.TVTable>[]))
          as _i5.Future<List<_i3.TVTable>>);
}

/// A class which mocks [DatabaseHelper].
///
/// See the documentation for Mockito's code generation for more information.
class MockDatabaseHelper extends _i1.Mock implements _i3.DatabaseHelper {
  MockDatabaseHelper() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i6.Database?> get database => (super.noSuchMethod(
      Invocation.getter(#database),
      returnValue: Future<_i6.Database?>.value()) as _i5.Future<_i6.Database?>);
  @override
  dynamic setDatabase(_i6.Database? database) =>
      super.noSuchMethod(Invocation.method(#setDatabase, [database]));
  @override
  _i5.Future<int> insertWatchlist(_i3.MovieTable? movie) =>
      (super.noSuchMethod(Invocation.method(#insertWatchlist, [movie]),
          returnValue: Future<int>.value(0)) as _i5.Future<int>);
  @override
  _i5.Future<int> removeWatchlist(_i3.MovieTable? movie) =>
      (super.noSuchMethod(Invocation.method(#removeWatchlist, [movie]),
          returnValue: Future<int>.value(0)) as _i5.Future<int>);
  @override
  _i5.Future<Map<String, dynamic>?> getMovieById(int? id) =>
      (super.noSuchMethod(Invocation.method(#getMovieById, [id]),
              returnValue: Future<Map<String, dynamic>?>.value())
          as _i5.Future<Map<String, dynamic>?>);
  @override
  _i5.Future<List<Map<String, dynamic>>> getWatchlistMovies() =>
      (super.noSuchMethod(Invocation.method(#getWatchlistMovies, []),
              returnValue: Future<List<Map<String, dynamic>>>.value(
                  <Map<String, dynamic>>[]))
          as _i5.Future<List<Map<String, dynamic>>>);
}

/// A class which mocks [Client].
///
/// See the documentation for Mockito's code generation for more information.
class MockHttpClient extends _i1.Mock implements _i4.Client {
  @override
  _i5.Future<_i4.Response> head(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#head, [url], {#headers: headers}),
              returnValue: Future<_i4.Response>.value(_FakeResponse_2()))
          as _i5.Future<_i4.Response>);
  @override
  _i5.Future<_i4.Response> get(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#get, [url], {#headers: headers}),
              returnValue: Future<_i4.Response>.value(_FakeResponse_2()))
          as _i5.Future<_i4.Response>);
  @override
  _i5.Future<_i4.Response> post(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i7.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#post, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i4.Response>.value(_FakeResponse_2()))
          as _i5.Future<_i4.Response>);
  @override
  _i5.Future<_i4.Response> put(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i7.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#put, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i4.Response>.value(_FakeResponse_2()))
          as _i5.Future<_i4.Response>);
  @override
  _i5.Future<_i4.Response> patch(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i7.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#patch, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i4.Response>.value(_FakeResponse_2()))
          as _i5.Future<_i4.Response>);
  @override
  _i5.Future<_i4.Response> delete(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i7.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#delete, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i4.Response>.value(_FakeResponse_2()))
          as _i5.Future<_i4.Response>);
  @override
  _i5.Future<String> read(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#read, [url], {#headers: headers}),
          returnValue: Future<String>.value('')) as _i5.Future<String>);
  @override
  _i5.Future<_i8.Uint8List> readBytes(Uri? url,
          {Map<String, String>? headers}) =>
      (super.noSuchMethod(
              Invocation.method(#readBytes, [url], {#headers: headers}),
              returnValue: Future<_i8.Uint8List>.value(_i8.Uint8List(0)))
          as _i5.Future<_i8.Uint8List>);
  @override
  _i5.Future<_i4.StreamedResponse> send(_i4.BaseRequest? request) =>
      (super.noSuchMethod(Invocation.method(#send, [request]),
              returnValue:
                  Future<_i4.StreamedResponse>.value(_FakeStreamedResponse_3()))
          as _i5.Future<_i4.StreamedResponse>);
  @override
  void close() => super.noSuchMethod(Invocation.method(#close, []),
      returnValueForMissingStub: null);
}
