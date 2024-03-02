import 'package:flutter/material.dart';

Widget appImage({
  String imagePath = "assets/icons/user.png",
  double width = 16,
  double height = 16,
}) {
  return Image.asset(
    imagePath,
    height: height,
    width: width,
  );
}
