import 'package:event_creator/features/auth/domain/entities/login_data.dart';
import 'package:event_creator/features/auth/domain/entities/register_data.dart';
import 'package:event_creator/features/auth/domain/usecases/get_auth_status.dart';
import 'package:event_creator/features/auth/domain/usecases/login_with_email_and_password.dart';
import 'package:event_creator/features/auth/domain/usecases/logout.dart';
import 'package:event_creator/features/auth/domain/usecases/register_with_email_and_password.dart';
import 'package:event_creator/features/auth/presentation/cubit/auth_state.dart';
import 'package:event_creator/utils/exception/app_exception.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  final RegisterWithEmailAndPassword _registerWithEmailAndPassword;
  final LoginWithEmailAndPassword _loginWithEmailAndPassword;
  final Logout _logout;
  final GetAuthStatus _getAuthStatus;

  AuthCubit(
    this._registerWithEmailAndPassword,
    this._loginWithEmailAndPassword,
    this._logout,
    this._getAuthStatus,
  ) : super(AuthInitial());

  Future<void> registerWithEmailAndPassword(RegisterData registerData) async {
    emit(AuthLoading());
    try {
      await _registerWithEmailAndPassword(registerData);
      emit(AuthSuccess());
    } on AppException catch (exception) {
      emit(AuthError(exception.message));
    }
  }

  Future<void> loginWithEmailAndPassword(LoginData loginData) async {
    emit(AuthLoading());
    try {
      await _loginWithEmailAndPassword(loginData);
      emit(AuthSuccess());
    } on AppException catch (exception) {
      emit(AuthError(exception.message));
    }
  }

  Future<void> logout() async {
    emit(AuthLoading());
    try {
      await _logout();
      emit(LoggedOut());
    } on AppException catch (exception) {
      emit(AuthError(exception.message));
    }
  }

  Future<void> getAuthStatus() async {
    emit(AuthLoading());
    try {
      await _getAuthStatus();
      emit(IsLoggedIn());
    } on CacheException {
      emit(NotLoggedIn());
    }
  }
}
