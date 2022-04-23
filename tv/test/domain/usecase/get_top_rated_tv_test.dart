import 'package:dartz/dartz.dart';
import 'package:tv/tv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:core/core.dart';
import '../../helpers/test_helper_tv.mocks.dart';

void main() {
  late GetTopRatedTVShows usecase;
  late MockTVRepository mockTVRepository;

  setUp(() {
    mockTVRepository = MockTVRepository();
    usecase = GetTopRatedTVShows(mockTVRepository);
  });

  final tTV = <TV>[];

  test('should get list of TV from repository', () async {
    // arrange
    when(mockTVRepository.getTopRatedTVShows())
        .thenAnswer((_) async => Right(tTV));
    // act
    final result = await usecase.execute();
    // assert
    expect(result, Right(tTV));
  });
}
