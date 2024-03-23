import 'package:ecommerceapp/common/entities/course.dart';

abstract class HomePageEvents {
  const HomePageEvents();
}

class HomePageDots extends HomePageEvents {
  final int index;
  HomePageDots(this.index);
}

class HomePageCourseItem extends HomePageEvents {
  final List<CourseItem> courseItem;
  const HomePageCourseItem(this.courseItem);
}
