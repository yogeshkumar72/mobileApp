import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    // on<HomeEvent>((event, emit) {
    //   // TODO: implement event handler
    // });// // on this event pass the state
    on<HomeNavigateEvent>(homeNavigateEvent);
  }

  FutureOr<void> homeNavigateEvent(HomeNavigateEvent event, Emitter<HomeState> emit) {
  print("Notification Clicked");
  

  }
}
