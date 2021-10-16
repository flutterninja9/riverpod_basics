// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat_fact_remote_data_source.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ICatFactRemoteDataSource implements ICatFactRemoteDataSource {
  _ICatFactRemoteDataSource(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://catfact.ninja';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<FactModel> getFact() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<FactModel>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/fact',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = FactModel.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
