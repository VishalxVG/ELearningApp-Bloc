import 'package:ecommerceapp/common/widgets/buttons_widgets.dart';
import 'package:ecommerceapp/common/widgets/custom_appBar.dart';
import 'package:ecommerceapp/common/widgets/text_Widget.dart';
import 'package:ecommerceapp/pages/sign_in_Screen/bloc/sing_in_bloc.dart';
import 'package:ecommerceapp/pages/sign_in_Screen/bloc/sing_in_event.dart';
import 'package:ecommerceapp/pages/sign_in_Screen/bloc/sing_in_state.dart';
import 'package:ecommerceapp/pages/sign_in_Screen/sign_in_controller.dart';
import 'package:ecommerceapp/pages/sign_in_Screen/widgets/sign_in_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              appBar: customAppBar(),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //* 3rd Party Login Options
                    thirdPartyLogin(),
                    //* more login option text
                    Center(
                      child: text14Normal(
                          text: "Or use your email account to login"),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    //* Email TextFiled
                    appTextField(
                      func: (value) {
                        context.read<SignInBloc>().add(EmailEvent(value));
                      },
                      text: "Email",
                      icon: "assets/icons/user.png",
                      hintText: "Enter your Email",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    //* Password TextField
                    appTextField(
                      func: (value) {
                        context.read<SignInBloc>().add(PasswordEvent(value));
                      },
                      text: "Password",
                      icon: "assets/icons/lock.png",
                      hintText: "Enter your Password",
                      isObscure: true,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 25),
                      child: textUnderLine(text: "Forgot Password?"),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    //* Login Button
                    Center(child: appButton(
                      func: () {
                        // print(
                        //     "email after state changin: ${context.read<SignInBloc>().state.email}");
                        SignInController(context: context)
                            .handleSignIn("email");
                      },
                    )),
                    const SizedBox(
                      height: 15,
                    ),
                    //* SignUp Button
                    Center(
                      child: appButton(
                        text: "Register",
                        isLogin: false,
                        border: Border.all(color: Colors.grey.shade400),
                        func: () {
                          Navigator.pushNamed(context, "/register_page");
                        },
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
