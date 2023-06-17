class HallBookingDataModel {
  final String hallId;
  final String date;
  final String eventType;
  final String hairdresserId;
  final String photographerId;

  const HallBookingDataModel({
    required this.hallId,
    required this.date,
    required this.eventType,
    required this.hairdresserId,
    required this.photographerId,
  });

  Map<String, dynamic> toJson() => {
        'hall_id': hallId,
        'booking_date': date,
        'event_type': eventType,
        'hairdresser_id': hairdresserId,
        'photographer_id': photographerId,
      };
}
