import 'package:dartz/dartz.dart';
import 'package:watchlist/watchlist.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_objects.dart';
import '../../../helpers/test_helper_tv.mocks.dart';

void main() {
  late GetWatchlistTVShows usecase;
  late MockTVRepository mockTVRepository;

  setUp(() {
    mockTVRepository = MockTVRepository();
    usecase = GetWatchlistTVShows(mockTVRepository);
  });

  test('should get list of movies from the repository', () async {
    // arrange
    when(mockTVRepository.getWatchListTVShow())
        .thenAnswer((_) async => Right(testTVList));
    // act
    final result = await usecase.execute();
    // assert
    expect(result, Right(testTVList));
  });
}
