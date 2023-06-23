import 'package:event_creator/features/halls/domain/entities/event_type.dart';
import 'package:event_creator/features/halls/domain/entities/hall.dart';
import 'package:event_creator/features/halls/domain/entities/hall_booking_data.dart';
import 'package:event_creator/features/halls/domain/entities/hall_rating_data.dart';
import 'package:event_creator/features/halls/domain/entities/halls_search_data.dart';
import 'package:event_creator/features/halls/domain/usecases/book_hall.dart';
import 'package:event_creator/features/halls/domain/usecases/get_all_halls.dart';
import 'package:event_creator/features/halls/domain/usecases/get_hairdresser.dart';
import 'package:event_creator/features/halls/domain/usecases/get_offers_halls.dart';
import 'package:event_creator/features/halls/domain/usecases/get_photographers.dart';
import 'package:event_creator/features/halls/domain/usecases/rate_hall.dart';
import 'package:event_creator/features/halls/domain/usecases/search_halls.dart';
import 'package:event_creator/features/halls/presentation/cubit/halls_state.dart';
import 'package:event_creator/utils/exception/app_exception.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class HallsCubit extends Cubit<HallsState> {
  final GetAllHalls _getAllHalls;
  final GetOffersHalls _getOffersHalls;
  final SearchHalls _searchHalls;
  final GetHairdressers _getHairdressers;
  final GetPhotographers _getPhotographers;
  final RateHall _rateHall;
  final BookHall _bookHall;
  List<Hall> allHalls = [];
  List<Hall> searchHallsResults = [];
  final pageController = PageController();
  final hallBookingData = HallBookingData(
    hallId: '',
    date: DateTime.now(),
    eventType: EventType.wedding,
  );

  HallsCubit(
    this._getAllHalls,
    this._getOffersHalls,
    this._searchHalls,
    this._getHairdressers,
    this._getPhotographers,
    this._rateHall,
    this._bookHall,
  ) : super(HallsInitial());

  Future<void> getAllHalls() async {
    emit(HallsLoading());
    try {
      allHalls = await _getAllHalls();
      emit(GetAllHallsSuccess());
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

  Future<void> getHairdressers() async {
    emit(HallsLoading());
    try {
      final hairdressers = await _getHairdressers();
      emit(GetHairdressersSuccess(hairdressers));
    } on RemoteException catch (exception) {
      emit(HallsError(exception.message));
    }
  }

  Future<void> getPhotographers() async {
    emit(HallsLoading());
    try {
      final photographers = await _getPhotographers();
      emit(GetPhotographersSuccess(photographers));
    } on RemoteException catch (exception) {
      emit(HallsError(exception.message));
    }
  }

  Future<void> rateHall(HallRatingData hallRatingData) async {
    emit(HallsLoading());
    try {
      await _rateHall(hallRatingData);
      emit(RateHallSuccess());
    } on RemoteException catch (exception) {
      emit(HallsError(exception.message));
    }
  }

  Future<void> bookHall() async {
    emit(HallsLoading());
    try {
      await _bookHall(hallBookingData);
      emit(BookHallSuccess());
    } on RemoteException catch (exception) {
      emit(HallsError(exception.message));
    }
  }

  Future<void> searchHalls(HallsSearchData hallsSearchData) async {
    emit(HallsLoading());
    try {
      searchHallsResults = await _searchHalls(hallsSearchData);
      emit(SearchHallsSuccess());
    } on RemoteException catch (exception) {
      emit(HallsError(exception.message));
    }
  }

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}
