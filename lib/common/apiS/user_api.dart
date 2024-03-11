import 'package:ecommerceapp/common/entities/entities.dart';
import 'package:ecommerceapp/common/utils/http_utils.dart';

class UserAPI {
  static login({LoginRequestEntity? parameters}) async {
    var response = await HttpUtil().post(
      'api/login',
      queryParameters: parameters?.toJson(),
    );

    return UserLoginResponseEntity.fromJson(response);
  }
}
