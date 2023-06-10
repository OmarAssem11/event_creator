import 'package:equatable/equatable.dart';

class Car extends Equatable {
  final String id;
  final String description;
  final String imageUrl;
  final String brand;
  final String model;
  final double price;

  const Car({
    required this.id,
    required this.description,
    required this.imageUrl,
    required this.brand,
    required this.model,
    required this.price,
  });

  @override
  List<Object?> get props => [id];
}
