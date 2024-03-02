import 'package:ecommerceapp/common/utils/app_color.dart';
import 'package:ecommerceapp/pages/application/bloc/app_bloc.dart';
import 'package:ecommerceapp/pages/application/bloc/app_event.dart';
import 'package:ecommerceapp/pages/application/bloc/app_state.dart';
import 'package:ecommerceapp/pages/application/widgets/applicaiton_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBlocs, AppState>(
      builder: (context, state) {
        int index = state.index;
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              body: buildPage(index),
              bottomNavigationBar: Container(
                width: 375.w,
                height: 58.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.h),
                    topRight: Radius.circular(20.h),
                  ),
                  color: AppColors.primaryElement,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      blurRadius: 1,
                      spreadRadius: 1,
                    )
                  ],
                ),
                child: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  currentIndex: index,
                  onTap: (value) {
                    context.read<AppBlocs>().add(TriggerAppEvent(value));
                  },
                  elevation: 0,
                  items: bottomTabs,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
