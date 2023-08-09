import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:mortalheart_mall/services/base_response.dart';
import 'package:mortalheart_mall/services/code.dart';

class ErrorInterceptors extends InterceptorsWrapper {
  @override
  onRequest(RequestOptions options, handler) async {
    //没有网络
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return handler.reject(
          DioException(
          requestOptions: options,
          type:  DioExceptionType.unknown,
          response: Response(
              requestOptions: options,
              data: BaseResponse(
                  code: Code.NETWORK_ERROR.toString(),
                  msg: Code.errorHandleFunction(Code.NETWORK_ERROR, "", false),
                  data: null
              )
          )
      )
      );
    }
    return super.onRequest(options, handler);
  }
}
