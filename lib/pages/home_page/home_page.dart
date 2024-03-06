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
            child: CustomScrollView(
              // crossAxisAlignment: CrossAxisAlignment.start,
              slivers: [
                SliverToBoxAdapter(
                  child: homePageText(
                    "HELLO",
                    color: AppColors.primaryThreeElementText,
                    top: 20,
                  ),
                ),
                SliverToBoxAdapter(child: homePageText("Vishal", top: 5)),
                SliverPadding(
                  padding: EdgeInsets.only(top: 20.h),
                ),
                SliverToBoxAdapter(child: searchView()),
                SliverToBoxAdapter(child: sliderView(context, state)),
                SliverToBoxAdapter(child: menuView()),
                SliverPadding(
                  padding:
                      EdgeInsets.symmetric(vertical: 18.h, horizontal: 0.w),
                  sliver: SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      childCount: 4,
                      (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.all(10.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.w),
                              image: const DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage("assets/icons/Image(1).png"),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "best course for IT and Engineering",
                                  maxLines: 1,
                                  overflow: TextOverflow.fade,
                                  textAlign: TextAlign.left,
                                  softWrap: false,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 11.sp,
                                  ),
                                ),
                                Text(
                                  "Flutter best course",
                                  maxLines: 1,
                                  overflow: TextOverflow.fade,
                                  textAlign: TextAlign.left,
                                  softWrap: false,
                                  style: TextStyle(
                                    color: AppColors.primaryFourElementText,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 8.sp,
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                      childAspectRatio: 1.6,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
