// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'explorer_remote_datasource.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _ExplorerRemoteDataSourceImpl implements ExplorerRemoteDataSourceImpl {
  _ExplorerRemoteDataSourceImpl(this._dio, {this.baseUrl});

  final Dio _dio;

  String? baseUrl;

  @override
  Future<List<int>> getImageIdsByCategoryIds(
      {required categoryIds, required querytype}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {'category_ids': categoryIds, 'querytype': querytype};
    final _result = await _dio.fetch<List<dynamic>>(_setStreamType<List<int>>(
        Options(method: 'POST', headers: _headers, extra: _extra)
            .compose(_dio.options, '/coco-dataset-bigquery',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data!.cast<int>();
    return value;
  }

  @override
  Future<List<CoCoImageModel>> getImagesDetailsByIds(
      {required imageIds, required querytype}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {'image_ids': imageIds, 'querytype': querytype};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<CoCoImageModel>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/coco-dataset-bigquery',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => CoCoImageModel.fromJson(i as Map<String, dynamic>))
        .toList();
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
