import 'package:event_creator/features/cars/domain/entities/car_booking_data.dart';
import 'package:event_creator/features/cars/domain/entities/car_rating_data.dart';
import 'package:event_creator/features/cars/domain/usecases/book_car.dart';
import 'package:event_creator/features/cars/domain/usecases/get_all_cars.dart';
import 'package:event_creator/features/cars/domain/usecases/rate_car.dart';
import 'package:event_creator/features/cars/presentation/cubit/cars_state.dart';
import 'package:event_creator/utils/exception/app_exception.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CarsCubit extends Cubit<CarsState> {
  final GetAllCars _getAllCars;
  final RateCar _rateCar;
  final BookCar _bookCar;

  CarsCubit(
    this._getAllCars,
    this._rateCar,
    this._bookCar,
  ) : super(CarsInitial());

  Future<void> getAllCars() async {
    emit(CarsLoading());
    try {
      final cars = await _getAllCars();
      emit(GetAllCarsSuccess(cars));
    } on RemoteException catch (exception) {
      emit(CarsError(exception.message));
    }
  }

  Future<void> rateCar(CarRatingData carRatingData) async {
    emit(CarsLoading());
    try {
      await _rateCar(carRatingData);
      emit(RateCarSuccess());
    } on RemoteException catch (exception) {
      emit(CarsError(exception.message));
    }
  }

  Future<void> bookCar(CarBookingData carBookingData) async {
    emit(CarsLoading());
    try {
      await _bookCar(carBookingData);
      emit(BookCarSuccess());
    } on RemoteException catch (exception) {
      emit(CarsError(exception.message));
    }
  }
}
