import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../navigation/auth_notifier.dart';
import '../../../services/session_service.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginSubmitted>((event, emit) async {
      emit(LoginLoading());

      // Simulasi delay login
      await Future.delayed(const Duration(seconds: 1));

      if (event.email == 'a@a.com' && event.password == '1234') {
        await SessionService().setLogin(true);
        authNotifier.update(true);
        emit(LoginSuccess());
      } else {
        emit(const LoginFailure('Email atau password salah'));
      }
    });
  }
}
