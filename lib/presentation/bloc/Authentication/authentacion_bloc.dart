import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dicoding_project/services/auth/login_services/login_services.dart';
import 'package:meta/meta.dart';

part 'authentacion_event.dart';
part 'authentacion_state.dart';

class AuthentacionBloc extends Bloc<AuthenticationEvent, AuthentacionState> {
  AuthentacionBloc({required LoginServices loginServices})
      : _loginServices = loginServices,
        super(const AuthentacionState.unknow()) {
    on<_AuthenticationEventChanged>(_onStatusChanged);
    on<AuthenticationEventLogIn>(_onLogIn);
    on<AuthenticationLogoutRequested>(_onAuthennticatedLogOut);
    _authenticationStatus =
        _loginServices.getStatusAuthenticated.listen((event) {
      add(_AuthenticationEventChanged(status: event));
    });
    print(state.status);
  }
  final LoginServices _loginServices;
  late StreamSubscription<AuthenticationStatus> _authenticationStatus;
  @override
  Future<void> close() {
    _authenticationStatus.cancel();
    return super.close();
  }

  FutureOr<void> _onStatusChanged(_AuthenticationEventChanged event,
      Emitter<AuthentacionState> emit) async {
    switch (event.status) {
      case AuthenticationStatus.unauthenticated:
        return emit(const AuthentacionState.unauthenticated());
      case AuthenticationStatus.authenticated:
        return emit(const AuthentacionState.authenticated());
      case AuthenticationStatus.unknown:
        return emit(const AuthentacionState.unknow());
    }
  }

  FutureOr<void> _onAuthennticatedLogOut(
      AuthenticationLogoutRequested event, Emitter<AuthentacionState> emit) {
    _loginServices.logOut();
  }

  FutureOr<void> _onLogIn(
      AuthenticationEventLogIn event, Emitter<AuthentacionState> emit) {
    _loginServices.loginWithEmail(event.email, event.password);
    emit(const AuthentacionState.authenticated());
    print(state.status);
  }
}
