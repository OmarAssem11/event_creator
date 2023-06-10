import 'package:event_creator/features/halls/domain/usecases/get_all_halls.dart';
import 'package:event_creator/features/halls/domain/usecases/get_offers_halls.dart';
import 'package:event_creator/features/halls/presentation/cubit/halls_state.dart';
import 'package:event_creator/utils/exception/app_exception.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HallsCubit extends Cubit<HallsState> {
  final GetAllHalls _getAllHalls;
  final GetOffersHalls _getOffersHalls;

  HallsCubit(
    this._getAllHalls,
    this._getOffersHalls,
  ) : super(HallsInitial());

  Future<void> getAllHalls() async {
    emit(HallsLoading());
    try {
      final halls = await _getAllHalls();
      emit(GetAllHallsSuccess(halls));
    } on RemoteException catch (exception) {
      emit(HallsError(exception.message));
    }
  }

  Future<void> getOffersHalls() async {
    emit(HallsLoading());
    try {
      final halls = await _getOffersHalls();
      emit(GetOffersHallsSuccess(halls));
    } on RemoteException catch (exception) {
      emit(HallsError(exception.message));
    }
  }
}