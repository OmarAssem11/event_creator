class HallsSearchDataModel {
  final String place;
  final String date;
  final int numOfPeoples;
  final double minPrice;
  final double maxPrice;

  const HallsSearchDataModel({
    required this.place,
    required this.date,
    required this.numOfPeoples,
    required this.minPrice,
    required this.maxPrice,
  });

  Map<String, dynamic> toJson() => {
        'place': place,
        'date': date,
        'people_num': numOfPeoples,
        'Lprice': minPrice,
        'Hprice': maxPrice,
      };
}
