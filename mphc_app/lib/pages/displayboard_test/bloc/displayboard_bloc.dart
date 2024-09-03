import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'displayboard_event.dart';
part 'displayboard_state.dart';

class DisplayboardBloc extends Bloc<DisplayboardEvent, DisplayboardState> {
  DisplayboardBloc() : super(DisplayboardInitial()) {
    // on<DisplayboardEvent>((event, emit) {
    //   // TODO: implement event handler
    // });
    on<SubmitFormEvent>(submitFormEvent);
  }

  FutureOr<void> submitFormEvent(SubmitFormEvent event, Emitter<DisplayboardState> emit){
    print("Requesting Data From API Display Board");
  }
}
