import 'package:ecommerceapp/pages/home_page/bloc/home_page_event.dart';
import 'package:ecommerceapp/pages/home_page/bloc/home_page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageBlocs extends Bloc<HomePageEvents, HomePageStates> {
  HomePageBlocs() : super(HomePageStates()) {
    on<HomePageDots>(
      (event, emit) {
        emit(state.copyWith(event.index));
      },
    );
  }
}
