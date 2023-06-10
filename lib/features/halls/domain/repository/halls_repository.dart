import 'package:event_creator/features/halls/domain/entities/hall.dart';

abstract class HallsRepository {
  Future<List<Hall>> getAllHalls();
}
