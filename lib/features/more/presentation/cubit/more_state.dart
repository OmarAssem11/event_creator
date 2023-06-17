abstract class MoreState {}

class MoreInitial extends MoreState {}

class MoreLoading extends MoreState {}

class MoreError extends MoreState {
  final String message;

  MoreError(this.message);
}

class ContactUsSuccess extends MoreState {}
