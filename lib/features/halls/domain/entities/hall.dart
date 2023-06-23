import 'package:equatable/equatable.dart';

class Hall extends Equatable {
  final String id;
  final String description;
  final String imageUrl;
  final double price;
  final int numOfPeoples;
  final double? rating;
  final int? numOfRatings;

  const Hall({
    required this.id,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.numOfPeoples,
    this.rating,
    this.numOfRatings,
  });

  @override
  List<Object?> get props => [id];
}
