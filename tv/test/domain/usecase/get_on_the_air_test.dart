import 'package:dartz/dartz.dart';
import 'package:tv/tv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:core/core.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetTVOnTheAir usecase;
  late MockTVRepository mockTVRepository;

  setUp(() {
    mockTVRepository = MockTVRepository();
    usecase = GetTVOnTheAir(mockTVRepository);
  });

  final tTV = <TV>[];

  test('should get list of TV from the repository', () async {
    // arrange
    when(mockTVRepository.getTVOnTheAir()).thenAnswer((_) async => Right(tTV));
    // act
    final result = await usecase.execute();
    // assert
    expect(result, Right(tTV));
  });
}
