import 'package:ecommerceapp/common/utils/app_color.dart';
import 'package:ecommerceapp/pages/home_page/bloc/home_page_bloc.dart';
import 'package:ecommerceapp/pages/home_page/bloc/home_page_state.dart';
import 'package:ecommerceapp/pages/home_page/widgets/home_page_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: BlocBuilder<HomePageBlocs, HomePageStates>(
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 0, horizontal: 25.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                homePageText(
                  "HELLO",
                  color: AppColors.primaryThreeElementText,
                  top: 20,
                ),
                homePageText("Vishal", top: 5),
                SizedBox(
                  height: 20.h,
                ),
                searchView(),
                sliderView(context, state),
              ],
            ),
          );
        },
      ),
    );
  }
}
