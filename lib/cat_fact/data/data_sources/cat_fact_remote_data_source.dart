import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_basics/cat_fact/data/models/fact_model.dart';

part 'cat_fact_remote_data_source.g.dart';

@RestApi(baseUrl: "https://catfact.ninja")
abstract class ICatFactRemoteDataSource {
  factory ICatFactRemoteDataSource(Dio _dio) {
    return _ICatFactRemoteDataSource(_dio);
  }
  @GET("/fact")
  Future<FactModel> getFact();
}
