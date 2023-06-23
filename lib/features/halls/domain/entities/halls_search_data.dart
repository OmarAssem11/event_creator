import 'package:event_creator/features/halls/domain/entities/hall.dart';

class HallsSearchData {
  final DateTime date;
  final int numOfPeople;
  final double minPrice;
  final double maxPrice;

  const HallsSearchData({
    required this.date,
    required this.numOfPeople,
    required this.minPrice,
    required this.maxPrice,
  });

  bool match(Hall hall) => _matchNumOfPeople(hall) && _matchPrice(hall);

  bool _matchNumOfPeople(Hall hall) => hall.numOfPeoples >= numOfPeople;

  bool _matchPrice(Hall hall) =>
      hall.price >= minPrice && hall.price <= maxPrice;
}
