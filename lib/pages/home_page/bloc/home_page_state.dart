import 'package:ecommerceapp/common/entities/course.dart';

class HomePageStates {
  final int index;
  final List<CourseItem> courseItem;
  HomePageStates({
    this.index = 0,
    this.courseItem = const <CourseItem>[],
  });

  HomePageStates copyWith({
    int? index,
    List<CourseItem>? courseItem,
  }) {
    return HomePageStates(
      courseItem: courseItem ?? this.courseItem,
      index: index ?? this.index,
    );
  }
}
