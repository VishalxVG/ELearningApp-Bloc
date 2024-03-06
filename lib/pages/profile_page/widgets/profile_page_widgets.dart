import 'package:ecommerceapp/common/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar buildAppBar() {
  return AppBar(
    title: Container(
      margin: EdgeInsets.only(left: 7.w, right: 7.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 15.w,
            height: 12.h,
            child: Image.asset("assets/icons/menu.png"),
          ),
          Text(
            "Profile",
            style: TextStyle(
              color: AppColors.primaryText,
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
            ),
          ),
          GestureDetector(
            child: Container(
              width: 24.w,
              height: 24.h,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/icons/more-vertical.png"))),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget profileIconAndEditButton() {
  return Container(
    alignment: Alignment.bottomRight,
    padding: EdgeInsets.only(right: 6.w, bottom: 3.w),
    width: 80.w,
    height: 80.h,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.w),
        image: const DecorationImage(
            image: AssetImage("assets/icons/headpic.png"))),
    child: Image(
      image: const AssetImage("assets/icons/edit_3.png"),
      height: 20.h,
      width: 20.w,
    ),
  );
}

var imageInfo = <String, String>{
  "Settings": "settings.png",
  "Payments details": "credit-card.png",
  "Achievement": "award.png",
  "Love": "heart(1).png",
  "Remainders": "cube.png"
};

Widget buildListView() {
  return Column(
    children: [
      ...List.generate(
        imageInfo.length,
        (index) => GestureDetector(
          child: Container(
            margin: EdgeInsets.only(bottom: 15.h),
            child: Row(
              children: [
                Container(
                  width: 40.w,
                  height: 40.h,
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.w),
                    color: AppColors.primaryElement,
                  ),
                  child: Image.asset(
                      "assets/icons/${imageInfo.values.elementAt(index)}"),
                ),
                SizedBox(
                  width: 15.w,
                ),
                Text(
                  imageInfo.keys.elementAt(index),
                  style: TextStyle(
                    color: AppColors.primaryText,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    ],
  );
}
