import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'ui_state_event.dart';
part 'ui_state_state.dart';

class UiStateBloc extends Bloc<UiStateEvent, UiStateState> {
  UiStateBloc() : super(UiStateInitial()) {
    on<UiStateEvent>(loginState);
    on<LoginStateEvent>(loginStateUi);
  }
}

FutureOr<void> loginState(UiStateEvent event, Emitter<UiStateState> emit) {}
FutureOr<void> loginStateUi(
    LoginStateEvent event, Emitter<UiStateState> emit) {}
