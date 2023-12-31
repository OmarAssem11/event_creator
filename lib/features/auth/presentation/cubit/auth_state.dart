abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {}

class AuthError extends AuthState {
  final String message;

  AuthError(this.message);
}

class LoggedOut extends AuthState {}

class IsLoggedIn extends AuthState {}

class NotLoggedIn extends AuthState {}
