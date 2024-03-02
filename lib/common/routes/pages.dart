// ignore_for_file: non_constant_identifier_names

import 'package:ecommerceapp/common/routes/names.dart';
import 'package:ecommerceapp/global.dart';

import 'package:ecommerceapp/pages/application/applicaiton.dart';
import 'package:ecommerceapp/pages/application/bloc/app_bloc.dart';
import 'package:ecommerceapp/pages/register_page.dart/bloc/register_page_bloc.dart';
import 'package:ecommerceapp/pages/register_page.dart/register_page.dart';
import 'package:ecommerceapp/pages/sign_in_Screen/bloc/sing_in_bloc.dart';
import 'package:ecommerceapp/pages/sign_in_Screen/sign_in_page.dart';
import 'package:ecommerceapp/pages/welcome_page/bloc/welcome_bloc.dart';
import 'package:ecommerceapp/pages/welcome_page/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
        route: AppRoutes.INITIAL,
        page: const WelcomePage(),
        bloc: BlocProvider(
          create: (_) => WelcomeBloc(),
        ),
      ),
      PageEntity(
        route: AppRoutes.SIGN_IN,
        page: const SignInPage(),
        bloc: BlocProvider(
          create: (_) => SignInBloc(),
        ),
      ),
      PageEntity(
        route: AppRoutes.REGISTER,
        page: const RegisterPage(),
        bloc: BlocProvider(
          create: (_) => RegisterBlocs(),
        ),
      ),
      PageEntity(
        route: AppRoutes.APPLICATION,
        page: const ApplicationPage(),
        bloc: BlocProvider(
          create: (_) => AppBlocs(),
        ),
      ),
    ];
  }

  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];
    for (var bloc in routes()) {
      blocProviders.add(bloc.bloc);
    }
    return blocProviders;
  }

  // a model that covers entire screen as we click on navigator object

  static MaterialPageRoute GenerateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      // check for route name maching when navigator widget gets called
      var result = routes().where(
        (element) => element.route == settings.name,
      );
      if (result.isNotEmpty) {
        //* Checks the value , if the device is opening for first time
        bool deviceFirstOpen = Global.storageService.getDeviceFirstOpen();
        //* if result=>route == "/"=>initial route and deviceFirstOpen is true
        // meaning the onboarding screen is seen by the use once already ,
        // push the user to signIn page and everytime he logs in push
        //him to signIn page not onboarding page . But if he uninstall the app, everything gets reset
        if (result.first.route == AppRoutes.INITIAL && deviceFirstOpen) {
          //* To check if user is loged in already
          bool isLogedIn = Global.storageService.getIsLogedIn();
          // If user already exits , directly push to application page
          if (isLogedIn) {
            return MaterialPageRoute(
                builder: (_) => const ApplicationPage(), settings: settings);
          }
          return MaterialPageRoute(
              builder: (_) => const SignInPage(), settings: settings);
        }
        return MaterialPageRoute(
          builder: (_) => result.first.page,
          settings: settings,
        );
      }
    }
    print("invalid route : ${settings.name}");
    return MaterialPageRoute(
      builder: (_) => const SignInPage(),
      settings: settings,
    );
  }
}

// unify blocProvider and routes and pages
class PageEntity {
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({
    required this.route,
    required this.page,
    this.bloc,
  });
}
