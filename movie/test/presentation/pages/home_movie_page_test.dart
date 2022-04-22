import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie/movie.dart';
import 'package:search/search.dart';

import '../../dummy_data/dummy_objects.dart';
import 'app_helper.dart';
import 'helper/fake_pages_helper.dart';

void main() {
  late FakeMovieListBloc fakeMovieListBloc;
  late FakePopularMovieBloc fakePopularMovieBloc;
  late FakeTopRatedMovieBloc fakeTopRatedMovieBloc;

  setUp(() {
    registerFallbackValue(FakeMovieListEvent());
    registerFallbackValue(FakeMovieListState());
    fakeMovieListBloc = FakeMovieListBloc();

    registerFallbackValue(FakePopularMovieEvent());
    registerFallbackValue(FakePopularMovieState());
    fakePopularMovieBloc = FakePopularMovieBloc();

    registerFallbackValue(FakeTopRatedMovieEvent());
    registerFallbackValue(FakeTopRatedMovieState());
    fakeTopRatedMovieBloc = FakeTopRatedMovieBloc();

    TestWidgetsFlutterBinding.ensureInitialized();
  });

  Widget _createTestableWidget(Widget body) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MovieListBloc>(
          create: (context) => fakeMovieListBloc,
        ),
        BlocProvider<MoviePopularBloc>(
          create: (context) => fakePopularMovieBloc,
        ),
        BlocProvider<MovieTopRatedBloc>(
          create: (context) => fakeTopRatedMovieBloc,
        ),
      ],
      child: MaterialApp(
        home: body,
      ),
    );
  }

  Widget _createAnotherTestableWidget(Widget body) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MovieListBloc>(
          create: (context) => fakeMovieListBloc,
        ),
        BlocProvider<MoviePopularBloc>(
          create: (context) => fakePopularMovieBloc,
        ),
        BlocProvider<MovieTopRatedBloc>(
          create: (context) => fakeTopRatedMovieBloc,
        ),
      ],
      child: body,
    );
  }

  final routes = <String, WidgetBuilder>{
    '/': (context) => const FakeHome(),
    '/next': (context) => _createAnotherTestableWidget(HomeMoviePage()),
    MovieDetailPage.ROUTE_NAME: (context) => const FakeDestination(),
    TopRatedMoviesPage.ROUTE_NAME: (context) => const FakeDestination(),
    PopularMoviesPage.ROUTE_NAME: (context) => const FakeDestination(),
    SearchPage.ROUTE_NAME: (context) => const FakeDestination(),
  };

  testWidgets('Page should display center progress bar when loading',
      (tester) async {
    when(() => fakeMovieListBloc.state).thenReturn(MovieListLoading());
    when(() => fakePopularMovieBloc.state).thenReturn(MoviePopularLoading());
    when(() => fakeTopRatedMovieBloc.state).thenReturn(MovieTopRatedLoading());

    final progressBarFinder = find.byType(CircularProgressIndicator);

    await tester.pumpWidget(_createTestableWidget(HomeMoviePage()));

    expect(progressBarFinder, findsNWidgets(3));
  });

  testWidgets('Page should display listview movielist when hasdata',
      (tester) async {
    when(() => fakeMovieListBloc.state)
        .thenReturn(MovieListHasData(testMovieList));
    when(() => fakePopularMovieBloc.state)
        .thenReturn(MoviePopularHasData(testMovieList));
    when(() => fakeTopRatedMovieBloc.state)
        .thenReturn(MovieTopRatedHasData(testMovieList));

    final listViewFinder = find.byType(ListView);
    final movieListFinder = find.byType(MovieList);

    await tester.pumpWidget(_createTestableWidget(HomeMoviePage()));

    expect(listViewFinder, findsNWidgets(3));
    expect(movieListFinder, findsNWidgets(3));
  });

  testWidgets('Page should display error text when error', (tester) async {
    when(() => fakeMovieListBloc.state).thenReturn(MovieListError('error'));
    when(() => fakePopularMovieBloc.state)
        .thenReturn(MoviePopularError('error'));
    when(() => fakeTopRatedMovieBloc.state)
        .thenReturn(MovieTopRatedError('error'));

    await tester.pumpWidget(_createTestableWidget(HomeMoviePage()));

    expect(find.byKey(const Key('error_message')), findsNWidgets(3));
  });

  testWidgets('Page should display empty text when empty', (tester) async {
    when(() => fakeMovieListBloc.state).thenReturn(MovieListEmpty());
    when(() => fakePopularMovieBloc.state).thenReturn(MoviePopularEmpty());
    when(() => fakeTopRatedMovieBloc.state).thenReturn(MovieTopRatedEmpty());

    await tester.pumpWidget(_createTestableWidget(HomeMoviePage()));

    expect(find.byKey(const Key('empty_message')), findsNWidgets(3));
  });
}
