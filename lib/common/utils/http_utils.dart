import 'package:dio/dio.dart';
import 'package:ecommerceapp/common/utils/constant.dart';

class HttpUtil {
  // Singleton Class - only one instance of class will be created
  static final HttpUtil _instance = HttpUtil._internal();
  factory HttpUtil() {
    return _instance;
  }

  late Dio dio;

  HttpUtil._internal() {
    BaseOptions options = BaseOptions(
      baseUrl: AppConstants.SERVER_API_URL,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
      headers: {},
      contentType: 'applicaiton/json: charset=utf-8',
      responseType: ResponseType.json,
    );

    dio = Dio(options);
  }

  Future post(
    String path, {
    dynamic mydata,
    Map<String, dynamic>? queryParameters,
  }) async {
    var response = await dio.post(
      path,
      data: mydata,
      queryParameters: queryParameters,
    );
    // print("My response data is ${response.toString()}");
    return response.data;
  }
}
