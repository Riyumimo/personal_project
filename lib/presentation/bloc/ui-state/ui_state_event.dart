part of 'ui_state_bloc.dart';

@immutable
sealed class UiStateEvent {}

class LoginStateEvent implements UiStateEvent {}
