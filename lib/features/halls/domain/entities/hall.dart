import 'package:equatable/equatable.dart';

class Hall extends Equatable {
  final String id;
  final String description;
  final String imageUrl;
  final int numOfPeople;
  final double price;
  final double? rating;

  const Hall({
    required this.id,
    required this.description,
    required this.imageUrl,
    required this.numOfPeople,
    required this.price,
    this.rating,
  });

  @override
  List<Object?> get props => [id];
}
