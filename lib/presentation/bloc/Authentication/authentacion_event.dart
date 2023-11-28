part of 'authentacion_bloc.dart';

@immutable
sealed class AuthenticationEvent {
  const AuthenticationEvent();
}

final class _AuthenticationEventChanged extends AuthenticationEvent {
  final AuthenticationStatus status;

  const _AuthenticationEventChanged({required this.status});
}

final class AuthenticationEventLogIn extends AuthenticationEvent {
  final String email;
  final String password;

  const AuthenticationEventLogIn({
    required this.email,
    required this.password,
  });
}

final class AuthenticationLogoutRequested extends AuthenticationEvent {}
