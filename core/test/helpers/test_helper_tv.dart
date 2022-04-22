import 'package:core/core.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;

@GenerateMocks([
  TVRepository,
  TVRemoteDataSource,
  TVLocalDataSource,
  DatabaseHelperTv,
], customMocks: [
  MockSpec<http.Client>(as: #MockHttpClientTV),
  MockSpec<ApiIOClient>(as: #MockApiIOClient)
])
void main() {}
