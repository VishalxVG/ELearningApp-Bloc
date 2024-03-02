import 'package:ecommerceapp/common/routes/routes.dart';

import 'package:ecommerceapp/common/utils/app_styles.dart';
import 'package:ecommerceapp/global.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [...AppPages.allBlocProviders(context)],
      child: ScreenUtilInit(
        builder: (context, child) => MaterialApp(
          title: 'Flutter Demo For Ecommerse App',
          theme: AppTheme.appThemeData,
          // home: const ApplicationPage(),
          // routes: {
          //   "/signInPage": (context) => const SignInPage(),
          //   "/registerPage": (context) => const RegisterPage(),
          // },
          onGenerateRoute: AppPages.GenerateRouteSettings,
        ),
      ),
    );
  }
}
