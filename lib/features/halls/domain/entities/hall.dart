import 'package:equatable/equatable.dart';

class Hall extends Equatable {
  final String id;
  final String description;
  final String imageUrl;
  final double price;
  final int numOfPeople;
  final double? rating;

  const Hall({
    required this.id,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.numOfPeople,
    this.rating,
  });

  @override
  List<Object?> get props => [id];
}
