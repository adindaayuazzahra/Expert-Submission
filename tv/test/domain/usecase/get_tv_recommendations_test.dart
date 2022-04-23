import 'package:dartz/dartz.dart';
import 'package:tv/tv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:core/core.dart';

import '../../helpers/test_helper_tv.mocks.dart';

void main() {
  late GetTVRecommendations usecase;
  late MockTVRepository mockTVRepository;

  setUp(() {
    mockTVRepository = MockTVRepository();
    usecase = GetTVRecommendations(mockTVRepository);
  });

  final tId = 1;
  final tTV = <TV>[];

  test('should get list of TV recommendations from the repository', () async {
    // arrange
    when(mockTVRepository.getTvRecommendations(tId))
        .thenAnswer((_) async => Right(tTV));
    // act
    final result = await usecase.execute(tId);
    // assert
    expect(result, Right(tTV));
  });
}
