import 'package:equatable/equatable.dart';

class Hall extends Equatable {
  final String id;
  final String description;
  final String imageUrl;
  final int numOfPeople;
  final double price;

  const Hall({
    required this.id,
    required this.description,
    required this.imageUrl,
    required this.numOfPeople,
    required this.price,
  });

  @override
  List<Object?> get props => [id];
}
