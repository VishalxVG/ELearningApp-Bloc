import 'package:dots_indicator/dots_indicator.dart';
import 'package:ecommerceapp/pages/welcome_page/bloc/welcome_bloc.dart';
import 'package:ecommerceapp/pages/welcome_page/bloc/welcome_event.dart';
import 'package:ecommerceapp/pages/welcome_page/bloc/welcome_state.dart';
import 'package:ecommerceapp/pages/welcome_page/widgets/widgets.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// final indexProvider = StateProvider((ref) => 0);

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<WelcomeBloc, WelcomeState>(
          builder: (context, state) {
            return Container(
              margin: const EdgeInsets.only(top: 30),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  //* Showing our three pages
                  PageView(
                    controller: pageController,
                    onPageChanged: (value) {
                      state.page = value;
                      BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvent());
                    },
                    children: [
                      appOnboardingScreen(
                        pageController,
                        context,
                        imagePath: "assets/images/reading.png",
                        title: "First see Learning",
                        subTitle:
                            "Forget about paper all knowledge in one learning",
                        index: 1,
                      ),
                      appOnboardingScreen(
                        pageController,
                        context,
                        imagePath: "assets/images/man.png",
                        title: "Connect With Everyone",
                        index: 2,
                        subTitle:
                            "Always keep in touch with your tutor and friends. Lets get connected",
                      ),
                      appOnboardingScreen(
                        pageController,
                        context,
                        imagePath: "assets/images/boy.png",
                        title: "Always Facinated Learning",
                        index: 3,
                        subTitle:
                            "Anywhre , anytime. The time is at your discreation. So study whenever wherever",
                        buttonTitle: "Get Started",
                      ),
                    ],
                  ),
                  //* For showing dots
                  Positioned(
                    bottom: 50.h,
                    child: DotsIndicator(
                      position: state.page,
                      dotsCount: 3,
                      decorator: DotsDecorator(
                        size: const Size.square(9.0),
                        activeSize: const Size(18, 8),
                        activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
