import 'package:ecommerceapp/common/values/app_color.dart';
import 'package:ecommerceapp/pages/home_page/bloc/home_page_bloc.dart';
import 'package:ecommerceapp/pages/home_page/bloc/home_page_state.dart';
import 'package:ecommerceapp/pages/home_page/home_controller.dart';
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
  late HomeController _homeController;

  @override
  void initState() {
    super.initState();
    _homeController = HomeController(context: context);
    _homeController.init();
  }

  @override
  Widget build(BuildContext context) {
    // This things checks if userProfile is null , and then builds the app
    // according to it .

    return _homeController.userProfile != null
        ? Scaffold(
            backgroundColor: Colors.white,
            appBar: buildAppBar(_homeController.userProfile!.avatar!),
            body: BlocBuilder<HomePageBlocs, HomePageStates>(
              builder: (context, state) {
                //print(state.courseItem[0].name);
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
                      SliverToBoxAdapter(
                        child: homePageText(
                          _homeController.userProfile!.name!,
                          top: 5,
                        ),
                      ),
                      SliverPadding(
                        padding: EdgeInsets.only(top: 20.h),
                      ),
                      SliverToBoxAdapter(child: searchView()),
                      SliverToBoxAdapter(child: sliderView(context, state)),
                      SliverToBoxAdapter(child: menuView()),
                      SliverPadding(
                        padding: EdgeInsets.symmetric(
                            vertical: 18.h, horizontal: 0.w),
                        sliver: SliverGrid(
                          delegate: SliverChildBuilderDelegate(
                            childCount: 4,
                            (BuildContext context, int index) {
                              return GestureDetector(
                                  onTap: () {}, child: courseGrid());
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
          )
        : Container();
  }
}
