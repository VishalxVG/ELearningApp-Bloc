import 'package:ecommerceapp/common/apiS/course_api.dart';
import 'package:ecommerceapp/common/entities/user.dart';
import 'package:ecommerceapp/global.dart';
import 'package:ecommerceapp/pages/home_page/bloc/home_page_bloc.dart';
import 'package:ecommerceapp/pages/home_page/bloc/home_page_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeController {
  final BuildContext context;
  HomeController({required this.context});

  UserItem? userProfile = Global.storageService.getUserProfile();

  void init() async {
    //* Keep in mind :
    // each datatype of attributes in backend should be similar to that of the flutter local storage(class object)
    // if not it should be converted to string(which should be the used to datatype for storing in class object)
    var result = await CourseApi.courseList();
    if (result.code == 200) {
      if (result.data != null && result.data!.isNotEmpty) {
        // Update the state using Bloc
        context.read<HomePageBlocs>().add(HomePageCourseItem(result.data!));

        // Access the first item if available
        print(result.data![0].name);
      } else {
        print("Result data is empty or null.");
      }
    } else {
      print(result.code);
    }
  }
}
