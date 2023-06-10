import 'package:event_creator/features/halls/domain/entities/hall.dart';

abstract class HallsState {}

class HallsInitial extends HallsState {}

class HallsLoading extends HallsState {}

class HallsError extends HallsState {
  final String message;

  HallsError(this.message);
}

class GetAllHallsSuccess extends HallsState {
  final List<Hall> halls;

  GetAllHallsSuccess(this.halls);
}

class GetOffersHallsSuccess extends HallsState {
  final List<Hall> halls;

  GetOffersHallsSuccess(this.halls);
}
