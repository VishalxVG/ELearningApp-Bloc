import 'package:ecommerceapp/common/widgets/text_Widget.dart';

import 'package:flutter/material.dart';

AppBar customAppBar({
  String text = "Login",
}) {
  return AppBar(
    backgroundColor: Colors.white,
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1),
      child: Container(
        color: Colors.grey.withOpacity(0.3),
        height: 1,
      ),
    ),
    title: text16Normal(
      text: text,
    ),
  );
}
