import 'package:ecommerceapp/pages/sign_in_Screen/bloc/sing_in_event.dart';
import 'package:ecommerceapp/pages/sign_in_Screen/bloc/sing_in_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInState()) {
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);
  }

  void _passwordEvent(PasswordEvent event, Emitter<SignInState> emit) {
    // print("my emial is ${event.password}");
    emit(state.copyWith(password: event.password));
  }

  void _emailEvent(EmailEvent event, Emitter<SignInState> emit) {
    // print("email : ${event.email}");
    emit(state.copyWith(email: event.email));
  }
}
