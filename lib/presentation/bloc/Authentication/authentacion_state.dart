part of 'authentacion_bloc.dart';

class AuthentacionState {
  const AuthentacionState._({this.status = AuthenticationStatus.unknown});

  const AuthentacionState.unknow() : this._();

  const AuthentacionState.authenticated()
      : this._(status: AuthenticationStatus.authenticated);

  const AuthentacionState.unauthenticated()
      : this._(status: AuthenticationStatus.unauthenticated);

  final AuthenticationStatus status;
}


// final class AuthentacionInitial extends AuthentacionState {}
