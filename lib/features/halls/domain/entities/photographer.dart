import 'package:equatable/equatable.dart';
import 'package:event_creator/features/auth/domain/entities/phone_number.dart';

class Photographer extends Equatable {
  final String id;
  final String description;
  final String imageUrl;
  final double price;
  final PhoneNumber phoneNumber;

  const Photographer({
    required this.id,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.phoneNumber,
  });

  @override
  List<Object?> get props => [id];
}
