import 'package:event_creator/features/cars/domain/usecases/get_all_cars.dart';
import 'package:event_creator/features/cars/presentation/cubit/cars_state.dart';
import 'package:event_creator/utils/exception/app_exception.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class CarsCubit extends Cubit<CarsState> {
  final GetAllCars _getAllCars;

  CarsCubit(
    this._getAllCars,
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
}
