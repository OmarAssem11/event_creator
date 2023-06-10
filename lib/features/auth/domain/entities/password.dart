import 'package:equatable/equatable.dart';
import 'package:event_creator/utils/exception/app_exception.dart';

class Password extends Equatable {
  final String value;

  Password(this.value) {
    _validate();
  }

  void _validate() {
    if (value.length < 8) {
      throw InvalidPasswordException();
    }
  }

  @override
  List<Object?> get props => [value];
}
