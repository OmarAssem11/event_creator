import 'package:event_creator/features/halls/domain/entities/hairdresser.dart';
import 'package:event_creator/features/halls/domain/entities/hall.dart';
import 'package:event_creator/features/halls/domain/entities/photographer.dart';

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

class GetHairdressersSuccess extends HallsState {
  final List<Hairdresser> hairdressers;

  GetHairdressersSuccess(this.hairdressers);
}

class GetPhotographersSuccess extends HallsState {
  final List<Photographer> photographers;

  GetPhotographersSuccess(this.photographers);
}

class RateHallSuccess extends HallsState {}

class BookHallSuccess extends HallsState {}
