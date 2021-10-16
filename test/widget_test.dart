import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod_basics/cat_fact/data/data.dart';

main() {
  final restClient = Dio();
  final dataSource = ICatFactRemoteDataSource(restClient);

  test("Generated Code should make a request to pre-defined endpoint",
      () async {
    final result = await dataSource.getFact();
    print(result.fact);
    expect(0, 0);
  });
}
