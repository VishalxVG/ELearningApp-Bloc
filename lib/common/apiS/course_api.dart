import 'package:ecommerceapp/common/entities/course.dart';
import 'package:ecommerceapp/common/utils/http_utils.dart';

class CourseApi {
  static Future<CourseListResponseEntity> courseList() async {
    var response = await HttpUtil().post(
      'api/courseList',
    );
    //print(response.toString());
    return CourseListResponseEntity.fromJson(response);
  }
}
