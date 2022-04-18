import 'package:dartz/dartz.dart';
import 'package:core/core.dart';
import 'package:search/search.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helper_tv.mocks.dart';

void main() {
  late SearchTVShows usecase;
  late MockTVRepository mockTVRepository;

  setUp(() {
    mockTVRepository = MockTVRepository();
    usecase = SearchTVShows(mockTVRepository);
  });

  final tTV = <TV>[];
  final tQuery = 'Halo';

  test('should get list of TV from the repository', () async {
    // arrange
    when(mockTVRepository.searchTVShows(tQuery))
        .thenAnswer((_) async => Right(tTV));
    // act
    final result = await usecase.execute(tQuery);
    // assert
    expect(result, Right(tTV));
  });
}
