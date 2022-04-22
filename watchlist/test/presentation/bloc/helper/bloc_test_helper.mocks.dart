// Mocks generated by Mockito 5.1.0 from annotations
// in watchlist/test/presentation/bloc/helper/bloc_test_helper.dart.
// Do not manually edit this file.

import 'dart:async' as _i5;

import 'package:core/core.dart' as _i3;
import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:watchlist/domain/usecases/movie_usecase/get_watchlist_movies.dart'
    as _i4;
import 'package:watchlist/domain/usecases/movie_usecase/get_watchlist_status.dart'
    as _i6;
import 'package:watchlist/domain/usecases/movie_usecase/remove_watchlist.dart'
    as _i7;
import 'package:watchlist/domain/usecases/movie_usecase/save_watchlist.dart'
    as _i8;
import 'package:watchlist/domain/usecases/tv_usecase/get_watchlist_tv_status.dart'
    as _i10;
import 'package:watchlist/domain/usecases/tv_usecase/get_watchlist_Tvshows.dart'
    as _i9;
import 'package:watchlist/domain/usecases/tv_usecase/remove_tv_watchlist.dart'
    as _i11;
import 'package:watchlist/domain/usecases/tv_usecase/save_tv_watchlist.dart'
    as _i12;

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

class _FakeMovieRepository_1 extends _i1.Fake implements _i3.MovieRepository {}

class _FakeTVRepository_2 extends _i1.Fake implements _i3.TVRepository {}

/// A class which mocks [GetWatchlistMovies].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetWatchlistMovies extends _i1.Mock
    implements _i4.GetWatchlistMovies {
  MockGetWatchlistMovies() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i2.Either<_i3.Failure, List<_i3.Movie>>> execute() =>
      (super.noSuchMethod(Invocation.method(#execute, []),
          returnValue: Future<_i2.Either<_i3.Failure, List<_i3.Movie>>>.value(
              _FakeEither_0<_i3.Failure, List<_i3.Movie>>())) as _i5
          .Future<_i2.Either<_i3.Failure, List<_i3.Movie>>>);
}

/// A class which mocks [GetWatchListStatus].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetWatchListStatus extends _i1.Mock
    implements _i6.GetWatchListStatus {
  MockGetWatchListStatus() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.MovieRepository get repository =>
      (super.noSuchMethod(Invocation.getter(#repository),
          returnValue: _FakeMovieRepository_1()) as _i3.MovieRepository);
  @override
  _i5.Future<bool> execute(int? id) =>
      (super.noSuchMethod(Invocation.method(#execute, [id]),
          returnValue: Future<bool>.value(false)) as _i5.Future<bool>);
}

/// A class which mocks [RemoveWatchlist].
///
/// See the documentation for Mockito's code generation for more information.
class MockRemoveWatchlist extends _i1.Mock implements _i7.RemoveWatchlist {
  MockRemoveWatchlist() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.MovieRepository get repository =>
      (super.noSuchMethod(Invocation.getter(#repository),
          returnValue: _FakeMovieRepository_1()) as _i3.MovieRepository);
  @override
  _i5.Future<_i2.Either<_i3.Failure, String>> execute(_i3.MovieDetail? movie) =>
      (super.noSuchMethod(Invocation.method(#execute, [movie]),
              returnValue: Future<_i2.Either<_i3.Failure, String>>.value(
                  _FakeEither_0<_i3.Failure, String>()))
          as _i5.Future<_i2.Either<_i3.Failure, String>>);
}

/// A class which mocks [SaveWatchlist].
///
/// See the documentation for Mockito's code generation for more information.
class MockSaveWatchlist extends _i1.Mock implements _i8.SaveWatchlist {
  MockSaveWatchlist() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.MovieRepository get repository =>
      (super.noSuchMethod(Invocation.getter(#repository),
          returnValue: _FakeMovieRepository_1()) as _i3.MovieRepository);
  @override
  _i5.Future<_i2.Either<_i3.Failure, String>> execute(_i3.MovieDetail? movie) =>
      (super.noSuchMethod(Invocation.method(#execute, [movie]),
              returnValue: Future<_i2.Either<_i3.Failure, String>>.value(
                  _FakeEither_0<_i3.Failure, String>()))
          as _i5.Future<_i2.Either<_i3.Failure, String>>);
}

/// A class which mocks [GetWatchlistTVShows].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetWatchlistTVShows extends _i1.Mock
    implements _i9.GetWatchlistTVShows {
  MockGetWatchlistTVShows() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i2.Either<_i3.Failure, List<_i3.TV>>> execute() =>
      (super.noSuchMethod(Invocation.method(#execute, []),
              returnValue: Future<_i2.Either<_i3.Failure, List<_i3.TV>>>.value(
                  _FakeEither_0<_i3.Failure, List<_i3.TV>>()))
          as _i5.Future<_i2.Either<_i3.Failure, List<_i3.TV>>>);
}

/// A class which mocks [GetWatchlistTVStatus].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetWatchlistTVStatus extends _i1.Mock
    implements _i10.GetWatchlistTVStatus {
  MockGetWatchlistTVStatus() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.TVRepository get repository =>
      (super.noSuchMethod(Invocation.getter(#repository),
          returnValue: _FakeTVRepository_2()) as _i3.TVRepository);
  @override
  _i5.Future<bool> execute(int? id) =>
      (super.noSuchMethod(Invocation.method(#execute, [id]),
          returnValue: Future<bool>.value(false)) as _i5.Future<bool>);
}

/// A class which mocks [RemoveTVWatchlist].
///
/// See the documentation for Mockito's code generation for more information.
class MockRemoveTVWatchlist extends _i1.Mock implements _i11.RemoveTVWatchlist {
  MockRemoveTVWatchlist() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.TVRepository get repository =>
      (super.noSuchMethod(Invocation.getter(#repository),
          returnValue: _FakeTVRepository_2()) as _i3.TVRepository);
  @override
  _i5.Future<_i2.Either<_i3.Failure, String>> execute(_i3.TVDetail? tv) =>
      (super.noSuchMethod(Invocation.method(#execute, [tv]),
              returnValue: Future<_i2.Either<_i3.Failure, String>>.value(
                  _FakeEither_0<_i3.Failure, String>()))
          as _i5.Future<_i2.Either<_i3.Failure, String>>);
}

/// A class which mocks [SaveTVWatchList].
///
/// See the documentation for Mockito's code generation for more information.
class MockSaveTVWatchList extends _i1.Mock implements _i12.SaveTVWatchList {
  MockSaveTVWatchList() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.TVRepository get repository =>
      (super.noSuchMethod(Invocation.getter(#repository),
          returnValue: _FakeTVRepository_2()) as _i3.TVRepository);
  @override
  _i5.Future<_i2.Either<_i3.Failure, String>> execute(_i3.TVDetail? tv) =>
      (super.noSuchMethod(Invocation.method(#execute, [tv]),
              returnValue: Future<_i2.Either<_i3.Failure, String>>.value(
                  _FakeEither_0<_i3.Failure, String>()))
          as _i5.Future<_i2.Either<_i3.Failure, String>>);
}
