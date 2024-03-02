import 'package:ecommerceapp/common/widgets/buttons_widgets.dart';
import 'package:ecommerceapp/common/widgets/custom_appBar.dart';
import 'package:ecommerceapp/common/widgets/text_Widget.dart';
import 'package:ecommerceapp/pages/register_page.dart/bloc/register_page_bloc.dart';
import 'package:ecommerceapp/pages/register_page.dart/bloc/register_page_event.dart';
import 'package:ecommerceapp/pages/register_page.dart/bloc/register_page_state.dart';
import 'package:ecommerceapp/pages/register_page.dart/register_controller.dart';
import 'package:ecommerceapp/pages/sign_in_Screen/widgets/sign_in_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBlocs, RegisterStates>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              appBar: customAppBar(text: "Register"),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    //* more login option text
                    Center(
                      child: text14Normal(
                          text: "Enter your details below to singup"),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    //* UserName TextFiled
                    appTextField(
                      text: "Username",
                      icon: "assets/icons/user.png",
                      hintText: "Enter your username",
                      func: (value) {
                        context.read<RegisterBlocs>().add(UserNameEvent(value));
                      },
                    ),

                    const SizedBox(
                      height: 20,
                    ),
                    //* Email TextFiled
                    appTextField(
                        text: "Email",
                        icon: "assets/icons/user.png",
                        hintText: "Enter your Email",
                        func: (value) {
                          context
                              .read<RegisterBlocs>()
                              .add(UserEmailEvent(value));
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                    //* Password TextField
                    appTextField(
                        text: "Password",
                        icon: "assets/icons/lock.png",
                        hintText: "Enter your Password",
                        isObscure: true,
                        func: (value) {
                          context
                              .read<RegisterBlocs>()
                              .add(UserPasswordEvent(value));
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                    //* Confirm Password TextFiled
                    appTextField(
                        text: "Confirm Password",
                        icon: "assets/icons/lock.png",
                        hintText: "Confirm your password",
                        isObscure: true,
                        func: (value) {
                          context
                              .read<RegisterBlocs>()
                              .add(UserRePassowrdEvent(value));
                        }),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 25),
                      child: text14Normal(
                        text:
                            "By creating a account you agree to our terms and \ncondition",
                      ),
                    ),

                    const SizedBox(
                      height: 60,
                    ),

                    const SizedBox(
                      height: 15,
                    ),
                    //* SignUp Button
                    Center(
                      child: appButton(
                        func: () {
                          RegisterController(context).handleEmailRegister();
                          print(context.read<RegisterBlocs>().state.userName);
                        },
                        text: "Register",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
