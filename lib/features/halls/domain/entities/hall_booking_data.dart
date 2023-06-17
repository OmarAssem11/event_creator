import 'package:event_creator/features/halls/domain/entities/event_type.dart';

class HallBookingData {
  String hallId;
  DateTime date;
  EventType eventType;
  String? hairdresserId;
  String? photographerId;

  HallBookingData({
    required this.hallId,
    required this.date,
    required this.eventType,
    this.hairdresserId,
    this.photographerId,
  });
}
