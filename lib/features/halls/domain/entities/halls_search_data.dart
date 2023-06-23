import 'package:event_creator/features/halls/domain/entities/hall_place.dart';

class HallsSearchData {
  final HallPlace place;
  final DateTime date;
  final int numOfPeoples;
  final double minPrice;
  final double maxPrice;

  const HallsSearchData({
    required this.place,
    required this.date,
    required this.numOfPeoples,
    required this.minPrice,
    required this.maxPrice,
  });
}
