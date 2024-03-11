import 'package:ecommerceapp/common/values/app_color.dart';
import 'package:ecommerceapp/common/widgets/app_shadow.dart';
import 'package:ecommerceapp/common/widgets/text_Widget.dart';

import 'package:flutter/material.dart';

Widget appButton({
  String text = "Login",
  Color color = AppColors.primaryBackground,
  double width = 325,
  double height = 50,
  bool isLogin = true,
  BoxBorder? border,
  BuildContext? context,
  void Function()? func,
}) {
  return GestureDetector(
    onTap: func,
    child: Container(
      width: 325,
      height: 50,
      decoration: appBoxShadow(
        color: isLogin ? AppColors.primaryElement : Colors.white,
        border: border,
      ),
      child: Center(
        child: text16Normal(
          text: text,
          color: isLogin ? color : AppColors.primaryText,
        ),
      ),
    ),
  );
}
