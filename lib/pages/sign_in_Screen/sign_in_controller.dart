// ignore_for_file: use_build_context_synchronously

import 'package:ecommerceapp/common/utils/constant.dart';
import 'package:ecommerceapp/common/widgets/popup_message.dart';
import 'package:ecommerceapp/global.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ecommerceapp/pages/sign_in_Screen/bloc/sing_in_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            // we got verified user from firebase
            Global.storageService
                .setString(AppConstants.STORAGE_USER_TOKEN_KEY, "123456789");
            toastInfo("Welcome ${user.displayName}");
            Navigator.pushNamedAndRemoveUntil(
                context, "/application", (route) => false);
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
}
