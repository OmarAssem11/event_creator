// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:event_creator/di/app_module.dart' as _i42;
import 'package:event_creator/features/auth/data/repository/auth_repository_impl.dart'
    as _i21;
import 'package:event_creator/features/auth/data/services/auth_http_service.dart'
    as _i10;
import 'package:event_creator/features/auth/domain/repository/auth_repository.dart'
    as _i20;
import 'package:event_creator/features/auth/domain/services/auth_service.dart'
    as _i9;
import 'package:event_creator/features/auth/domain/usecases/get_auth_status.dart'
    as _i28;
import 'package:event_creator/features/auth/domain/usecases/login_with_email_and_password.dart'
    as _i33;
import 'package:event_creator/features/auth/domain/usecases/logout.dart'
    as _i34;
import 'package:event_creator/features/auth/domain/usecases/register_with_email_and_password.dart'
    as _i37;
import 'package:event_creator/features/auth/presentation/cubit/auth_cubit.dart'
    as _i39;
import 'package:event_creator/features/cars/data/repository/cars_repository_impl.dart'
    as _i24;
import 'package:event_creator/features/cars/data/services/cars_http_service.dart'
    as _i14;
import 'package:event_creator/features/cars/domain/repository/cars_repository.dart'
    as _i23;
import 'package:event_creator/features/cars/domain/services/cars_service.dart'
    as _i13;
import 'package:event_creator/features/cars/domain/usecases/book_car.dart'
    as _i40;
import 'package:event_creator/features/cars/domain/usecases/get_all_cars.dart'
    as _i26;
import 'package:event_creator/features/cars/domain/usecases/rate_car.dart'
    as _i36;
import 'package:event_creator/features/cars/domain/usecases/search_cars.dart'
    as _i38;
import 'package:event_creator/features/cars/presentation/cubit/cars_cubit.dart'
    as _i41;
import 'package:event_creator/features/halls/data/repository/halls_repository_impl.dart'
    as _i16;
import 'package:event_creator/features/halls/data/services/halls_http_service.dart'
    as _i5;
import 'package:event_creator/features/halls/domain/repository/halls_repository.dart'
    as _i15;
import 'package:event_creator/features/halls/domain/services/halls_service.dart'
    as _i4;
import 'package:event_creator/features/halls/domain/usecases/book_hall.dart'
    as _i22;
import 'package:event_creator/features/halls/domain/usecases/get_all_halls.dart'
    as _i27;
import 'package:event_creator/features/halls/domain/usecases/get_hairdresser.dart'
    as _i29;
import 'package:event_creator/features/halls/domain/usecases/get_offers_halls.dart'
    as _i30;
import 'package:event_creator/features/halls/domain/usecases/get_photographers.dart'
    as _i31;
import 'package:event_creator/features/halls/domain/usecases/rate_hall.dart'
    as _i19;
import 'package:event_creator/features/halls/presentation/cubit/halls_cubit.dart'
    as _i32;
import 'package:event_creator/features/more/data/repository/more_repository_impl.dart'
    as _i18;
import 'package:event_creator/features/more/data/services/more_http_service.dart'
    as _i7;
import 'package:event_creator/features/more/domain/repository/more_repository.dart'
    as _i17;
import 'package:event_creator/features/more/domain/services/more_service.dart'
    as _i6;
import 'package:event_creator/features/more/domain/usecases/contact_us.dart'
    as _i25;
import 'package:event_creator/features/more/presentation/cubit/more_cubit.dart'
    as _i35;
import 'package:event_creator/utils/cache/cache_service.dart' as _i11;
import 'package:event_creator/utils/cache/shared_pref_cache_service.dart'
    as _i12;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i8;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.lazySingleton<_i3.Dio>(() => appModule.dio);
    gh.lazySingleton<_i4.HallsService>(
        () => _i5.HallsHTTPService(gh<_i3.Dio>()));
    gh.lazySingleton<_i6.MoreService>(() => _i7.MoreHTTPService());
    await gh.factoryAsync<_i8.SharedPreferences>(
      () => appModule.sharedPreferences,
      preResolve: true,
    );
    gh.lazySingleton<_i9.AuthService>(
        () => _i10.AuthHTTPService(gh<_i3.Dio>()));
    gh.lazySingleton<_i11.CacheService>(
        () => _i12.SharedPrefCacheService(gh<_i8.SharedPreferences>()));
    gh.lazySingleton<_i13.CarsService>(
        () => _i14.CarsHTTPService(gh<_i3.Dio>()));
    gh.lazySingleton<_i15.HallsRepository>(
        () => _i16.HallsRepositoryImpl(gh<_i4.HallsService>()));
    gh.lazySingleton<_i17.MoreRepository>(
        () => _i18.MoreRepositoryImpl(gh<_i6.MoreService>()));
    gh.lazySingleton<_i19.RateHall>(
        () => _i19.RateHall(gh<_i15.HallsRepository>()));
    gh.lazySingleton<_i20.AuthRepository>(() => _i21.AuthRepositoryImpl(
          gh<_i9.AuthService>(),
          gh<_i11.CacheService>(),
        ));
    gh.lazySingleton<_i22.BookHall>(
        () => _i22.BookHall(gh<_i15.HallsRepository>()));
    gh.lazySingleton<_i23.CarsRepository>(
        () => _i24.CarsRepositoryImpl(gh<_i13.CarsService>()));
    gh.lazySingleton<_i25.ContactUs>(
        () => _i25.ContactUs(gh<_i17.MoreRepository>()));
    gh.lazySingleton<_i26.GetAllCars>(
        () => _i26.GetAllCars(gh<_i23.CarsRepository>()));
    gh.lazySingleton<_i27.GetAllHalls>(
        () => _i27.GetAllHalls(gh<_i15.HallsRepository>()));
    gh.lazySingleton<_i28.GetAuthStatus>(
        () => _i28.GetAuthStatus(gh<_i20.AuthRepository>()));
    gh.lazySingleton<_i29.GetHairdressers>(
        () => _i29.GetHairdressers(gh<_i15.HallsRepository>()));
    gh.lazySingleton<_i30.GetOffersHalls>(
        () => _i30.GetOffersHalls(gh<_i15.HallsRepository>()));
    gh.lazySingleton<_i31.GetPhotographers>(
        () => _i31.GetPhotographers(gh<_i15.HallsRepository>()));
    gh.lazySingleton<_i32.HallsCubit>(() => _i32.HallsCubit(
          gh<_i27.GetAllHalls>(),
          gh<_i30.GetOffersHalls>(),
          gh<_i29.GetHairdressers>(),
          gh<_i31.GetPhotographers>(),
          gh<_i19.RateHall>(),
          gh<_i22.BookHall>(),
        ));
    gh.lazySingleton<_i33.LoginWithEmailAndPassword>(
        () => _i33.LoginWithEmailAndPassword(gh<_i20.AuthRepository>()));
    gh.lazySingleton<_i34.Logout>(() => _i34.Logout(gh<_i20.AuthRepository>()));
    gh.factory<_i35.MoreCubit>(() => _i35.MoreCubit(gh<_i25.ContactUs>()));
    gh.lazySingleton<_i36.RateCar>(
        () => _i36.RateCar(gh<_i23.CarsRepository>()));
    gh.lazySingleton<_i37.RegisterWithEmailAndPassword>(
        () => _i37.RegisterWithEmailAndPassword(gh<_i20.AuthRepository>()));
    gh.lazySingleton<_i38.SearchCars>(
        () => _i38.SearchCars(gh<_i23.CarsRepository>()));
    gh.factory<_i39.AuthCubit>(() => _i39.AuthCubit(
          gh<_i37.RegisterWithEmailAndPassword>(),
          gh<_i33.LoginWithEmailAndPassword>(),
          gh<_i34.Logout>(),
          gh<_i28.GetAuthStatus>(),
        ));
    gh.lazySingleton<_i40.BookCar>(
        () => _i40.BookCar(gh<_i23.CarsRepository>()));
    gh.lazySingleton<_i41.CarsCubit>(() => _i41.CarsCubit(
          gh<_i26.GetAllCars>(),
          gh<_i38.SearchCars>(),
          gh<_i36.RateCar>(),
          gh<_i40.BookCar>(),
        ));
    return this;
  }
}

class _$AppModule extends _i42.AppModule {}
