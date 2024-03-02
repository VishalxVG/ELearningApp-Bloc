import 'package:ecommerceapp/pages/application/bloc/app_event.dart';
import 'package:ecommerceapp/pages/application/bloc/app_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocs extends Bloc<AppEvent, AppState> {
  AppBlocs() : super(AppState()) {
    on<TriggerAppEvent>(
      (event, emit) {
        emit(AppState(index: event.index));
      },
    );
  }
}
