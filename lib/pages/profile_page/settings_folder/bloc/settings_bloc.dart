import 'package:ecommerceapp/pages/profile_page/settings_folder/bloc/settings_event.dart';
import 'package:ecommerceapp/pages/profile_page/settings_folder/bloc/settings_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsBlocs extends Bloc<SettingsEvent, SettingsStates> {
  SettingsBlocs() : super(const SettingsStates()) {
    on<TriggerSettings>(
      (event, emit) {
        emit(const SettingsStates());
      },
    );
  }
}
