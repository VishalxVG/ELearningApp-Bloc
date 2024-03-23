import 'package:dio/dio.dart';
import 'package:ecommerceapp/common/utils/constant.dart';
import 'package:ecommerceapp/global.dart';

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
    // options allow us to pass headers which we use here to pass the
    // access token from the local storage to the server to get authorization
    // to use call the required api , that is wrapped around sanctum malwire protection

    Options? options,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};
    Map<String, dynamic>? authorization = getAuthorizationHeader();
    if (authorization != null) {
      requestOptions.headers!.addAll(authorization);
    }
    var response = await dio.post(path,
        data: mydata,
        queryParameters: queryParameters,
        options: requestOptions);
    print("My response data is ${response.toString()}");
    return response.data;
  }

  Map<String, dynamic>? getAuthorizationHeader() {
    var header = <String, dynamic>{};
    var accessToken = Global.storageService.getUserToken();
    if (accessToken.isNotEmpty) {
      //* This authorization is similar to Authorization in postman
      // and how we use bearer token to get access to use the courseList api
      // The authorization speeling should be same as that of the postman
      header['Authorization'] = 'Bearer $accessToken';
    }
    // Then we return the header which is in the form of <string , dynamic>
    return header;
  }
}
