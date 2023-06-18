abstract class CarsState {}

class CarsInitial extends CarsState {}

class CarsLoading extends CarsState {}

class CarsError extends CarsState {
  final String message;

  CarsError(this.message);
}

class GetAllCarsSuccess extends CarsState {}

class RateCarSuccess extends CarsState {}

class BookCarSuccess extends CarsState {}

class FilterCarsSuccess extends CarsState {}
