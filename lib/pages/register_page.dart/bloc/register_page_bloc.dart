import 'package:ecommerceapp/pages/register_page.dart/bloc/register_page_event.dart';
import 'package:ecommerceapp/pages/register_page.dart/bloc/register_page_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBlocs extends Bloc<RegisterEvent, RegisterStates> {
  RegisterBlocs() : super(const RegisterStates()) {
    on<UserNameEvent>(
      (event, emit) {
        // print("${event.userName}");
        emit(state.copyWith(userName: event.userName));
      },
    );

    on<UserEmailEvent>(
      (event, emit) => emit(state.copyWith(email: event.email)),
    );
    on<UserPasswordEvent>(
      (event, emit) => emit(state.copyWith(password: event.passsword)),
    );

    on<UserRePassowrdEvent>(
      (event, emit) => emit(state.copyWith(rePassword: event.rePassword)),
    );
  }
}
