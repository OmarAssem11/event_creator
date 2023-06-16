import 'package:event_creator/features/cars/domain/services/cars_service.dart';
import 'package:event_creator/features/cars/domain/usecases/get_all_cars.dart';
import 'package:event_creator/features/cars/presentation/cubit/cars_state.dart';
import 'package:event_creator/utils/exception/app_exception.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class CarsCubit extends Cubit<CarsState> {
  final GetAllCars _getAllCars;
  final CarsService _carsService;

  CarsCubit(
    this._getAllCars,
    this._carsService,
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

  Future<void> rateCar(double rating) async {
    emit(CarsLoading());
    try {
      await _carsService.rateCar(rating);
      emit(RateCarSuccess());
    } on RemoteException catch (exception) {
      emit(CarsError(exception.message));
    }
  }
}
