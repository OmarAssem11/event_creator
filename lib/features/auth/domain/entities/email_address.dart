import 'package:equatable/equatable.dart';
import 'package:event_creator/utils/exception/app_exception.dart';

class EmailAddress extends Equatable {
  final String _value;

  EmailAddress(this._value) {
    _validate();
  }

  void _validate() {
    final emailAddressPattern = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );
    if (!emailAddressPattern.hasMatch(_value)) {
      throw InvalidEmailAddressException();
    }
  }

  String get value => _value.toLowerCase();

  @override
  List<Object?> get props => [_value];
}
