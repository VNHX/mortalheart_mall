import 'package:dio/dio.dart';
import 'package:mortalheart_mall/services/base_response.dart';
import 'package:mortalheart_mall/services/code.dart';

class ResponseInterceptors extends InterceptorsWrapper {
  @override
  onResponse(Response response, handler) async {
    RequestOptions option = response.requestOptions;
    var value;
    try {
      var header = response.headers[Headers.contentTypeHeader];
      if ((header != null && header.toString().contains("text"))) {
        value = BaseResponse(code: Code.SUCCESS.toString(), msg: '', data: response.data);
      } else if (response.statusCode! >= 200 && response.statusCode! < 300) {
        value = BaseResponse(code: Code.SUCCESS.toString(), msg: '', data: response.data);
      }
    } catch (e) {
      print(e.toString() + option.path);
      value = BaseResponse(code: response.statusCode.toString() ?? "", msg: '', data: response.data);
    }
    response.data = value;
    return handler.next(response);
  }
}
