// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:ecommerceapp/common/apiS/user_api.dart';
import 'package:ecommerceapp/common/entities/entities.dart';
import 'package:ecommerceapp/common/routes/names.dart';
import 'package:ecommerceapp/common/utils/constant.dart';
import 'package:ecommerceapp/common/widgets/popup_message.dart';
import 'package:ecommerceapp/global.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ecommerceapp/pages/sign_in_Screen/bloc/sing_in_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class SignInController {
  final BuildContext context;
  const SignInController({required this.context});

  void handleSignIn(String type) async {
    try {
      if (type == "email") {
        //* The below code is similar to using BlocProvider to access the context
        // BlocProvider.of<SignInBloc>(context).state;
        final state = context.read<SignInBloc>().state;
        String emailAddress = state.email;
        String password = state.password;

        if (emailAddress.isEmpty) {
          toastInfo("Please enter a email");
        } else {
          if (kDebugMode) {
            print("Email is $emailAddress");
          }
        }
        if (password.isEmpty) {
          toastInfo("Please enter a password");
        } else {
          if (kDebugMode) {
            print("password is : $password");
          }
        }
        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAddress, password: password);

          if (credential.user == null) {
            toastInfo("Your account does not exits");
          }
          if (!credential.user!.emailVerified) {
            toastInfo("You need to verify your email");
          }

          var user = credential.user;
          if (user != null) {
            String? displayName = user.displayName;
            String? email = user.email;
            String? id = user.uid;
            String? photoUrl = user.photoURL;

            LoginRequestEntity loginRequestEntity = LoginRequestEntity();
            loginRequestEntity.avatar = photoUrl;
            loginRequestEntity.name = displayName;
            loginRequestEntity.email = email;
            loginRequestEntity.open_id = id;
            loginRequestEntity.type = 1; //* Type 1 = Email Login
            // we got verified user from firebase
            print("user Exists");
            asyncPostAllData(loginRequestEntity);

            toastInfo("Welcome ${user.displayName}");
            //Navigator.pushNamedAndRemoveUntil(
            //  context, "/application", (route) => false);
          } else {
            // we have error getting verified user from firebase
            toastInfo("Your account does not exits");
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == "user-not-found") {
            print("No user found for the email");
            toastInfo("No user with the email");
            return;
          } else if (e.code == "wrong-password") {
            print("Wrong password provided for the user");

            toastInfo("Password doesnot match with the email");
            return;
          } else if (e.code == "invalid-email") {
            print("your email format is wrong");
            toastInfo("Email does not exits");
            return;
          }
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> asyncPostAllData(LoginRequestEntity loginRequestEntity) async {
    EasyLoading.show(
      indicator: const CircularProgressIndicator(),
      maskType: EasyLoadingMaskType.clear,
      dismissOnTap: true,
    );
    var result = await UserAPI.login(parameters: loginRequestEntity);
    if (result.code == 200) {
      try {
        Global.storageService.setString(
            AppConstants.STORAGE_USER_PROFILE_KEY, jsonEncode(result.data!));
        Global.storageService.setString(
            AppConstants.STORAGE_USER_TOKEN_KEY, result.data!.access_token!);
        EasyLoading.dismiss();
        Navigator.of(context)
            .pushNamedAndRemoveUntil(AppRoutes.APPLICATION, (route) => false);
      } catch (e) {
        print("saving local storage error");
      }
    } else {
      EasyLoading.dismiss();
      toastInfo("unknown error");
    }
  }
}
