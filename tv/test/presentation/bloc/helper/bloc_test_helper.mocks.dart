// Mocks generated by Mockito 5.1.0 from annotations
// in tv/test/presentation/bloc/helper/bloc_test_helper.dart.
// Do not manually edit this file.

import 'dart:async' as _i5;

import 'package:core/core.dart' as _i2;
import 'package:dartz/dartz.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;
import 'package:tv/domain/usecase/get_popular_tv_show.dart' as _i4;
import 'package:tv/domain/usecase/get_top_rated_tv_show.dart' as _i6;
import 'package:tv/domain/usecase/get_tv_on_the_air.dart' as _i7;
import 'package:tv/domain/usecase/get_tv_recommendations.dart' as _i8;
import 'package:tv/domain/usecase/get_tv_show_detail.dart' as _i9;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeTVRepository_0 extends _i1.Fake implements _i2.TVRepository {}

class _FakeEither_1<L, R> extends _i1.Fake implements _i3.Either<L, R> {}

/// A class which mocks [GetPopularTVShows].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetPopularTVShows extends _i1.Mock implements _i4.GetPopularTVShows {
  MockGetPopularTVShows() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.TVRepository get repository =>
      (super.noSuchMethod(Invocation.getter(#repository),
          returnValue: _FakeTVRepository_0()) as _i2.TVRepository);
  @override
  _i5.Future<_i3.Either<_i2.Failure, List<_i2.TV>>> execute() =>
      (super.noSuchMethod(Invocation.method(#execute, []),
              returnValue: Future<_i3.Either<_i2.Failure, List<_i2.TV>>>.value(
                  _FakeEither_1<_i2.Failure, List<_i2.TV>>()))
          as _i5.Future<_i3.Either<_i2.Failure, List<_i2.TV>>>);
}

/// A class which mocks [GetTopRatedTVShows].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetTopRatedTVShows extends _i1.Mock
    implements _i6.GetTopRatedTVShows {
  MockGetTopRatedTVShows() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.TVRepository get repository =>
      (super.noSuchMethod(Invocation.getter(#repository),
          returnValue: _FakeTVRepository_0()) as _i2.TVRepository);
  @override
  _i5.Future<_i3.Either<_i2.Failure, List<_i2.TV>>> execute() =>
      (super.noSuchMethod(Invocation.method(#execute, []),
              returnValue: Future<_i3.Either<_i2.Failure, List<_i2.TV>>>.value(
                  _FakeEither_1<_i2.Failure, List<_i2.TV>>()))
          as _i5.Future<_i3.Either<_i2.Failure, List<_i2.TV>>>);
}

/// A class which mocks [GetTVOnTheAir].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetTVOnTheAir extends _i1.Mock implements _i7.GetTVOnTheAir {
  MockGetTVOnTheAir() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.TVRepository get repository =>
      (super.noSuchMethod(Invocation.getter(#repository),
          returnValue: _FakeTVRepository_0()) as _i2.TVRepository);
  @override
  _i5.Future<_i3.Either<_i2.Failure, List<_i2.TV>>> execute() =>
      (super.noSuchMethod(Invocation.method(#execute, []),
              returnValue: Future<_i3.Either<_i2.Failure, List<_i2.TV>>>.value(
                  _FakeEither_1<_i2.Failure, List<_i2.TV>>()))
          as _i5.Future<_i3.Either<_i2.Failure, List<_i2.TV>>>);
}

/// A class which mocks [GetTVRecommendations].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetTVRecommendations extends _i1.Mock
    implements _i8.GetTVRecommendations {
  MockGetTVRecommendations() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.TVRepository get repository =>
      (super.noSuchMethod(Invocation.getter(#repository),
          returnValue: _FakeTVRepository_0()) as _i2.TVRepository);
  @override
  _i5.Future<_i3.Either<_i2.Failure, List<_i2.TV>>> execute(int? id) =>
      (super.noSuchMethod(Invocation.method(#execute, [id]),
              returnValue: Future<_i3.Either<_i2.Failure, List<_i2.TV>>>.value(
                  _FakeEither_1<_i2.Failure, List<_i2.TV>>()))
          as _i5.Future<_i3.Either<_i2.Failure, List<_i2.TV>>>);
}

/// A class which mocks [GetTVShowDetail].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetTVShowDetail extends _i1.Mock implements _i9.GetTVShowDetail {
  MockGetTVShowDetail() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.TVRepository get repository =>
      (super.noSuchMethod(Invocation.getter(#repository),
          returnValue: _FakeTVRepository_0()) as _i2.TVRepository);
  @override
  _i5.Future<_i3.Either<_i2.Failure, _i2.TVDetail>> execute(int? id) =>
      (super.noSuchMethod(Invocation.method(#execute, [id]),
              returnValue: Future<_i3.Either<_i2.Failure, _i2.TVDetail>>.value(
                  _FakeEither_1<_i2.Failure, _i2.TVDetail>()))
          as _i5.Future<_i3.Either<_i2.Failure, _i2.TVDetail>>);
}