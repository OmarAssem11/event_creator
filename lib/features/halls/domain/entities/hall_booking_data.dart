import 'package:event_creator/features/halls/domain/entities/event_type.dart';

class HallBookingData {
  final String hallId;
  final DateTime date;
  final EventType eventType;
  final String photographerId;
  final String hairdresserId;

  const HallBookingData({
    required this.hallId,
    required this.date,
    required this.eventType,
    required this.photographerId,
    required this.hairdresserId,
  });
}