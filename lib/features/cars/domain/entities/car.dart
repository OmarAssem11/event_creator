import 'package:equatable/equatable.dart';
import 'package:event_creator/features/cars/domain/entities/car_brand.dart';

class Car extends Equatable {
  final String id;
  final String description;
  final String imageUrl;
  final double price;
  final double rating;
  final CarBrand brand;
  final String model;

  const Car({
    required this.id,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.rating,
    required this.brand,
    required this.model,
  });

  @override
  List<Object?> get props => [id];
}
