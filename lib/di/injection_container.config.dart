// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i5;
import 'package:dio/dio.dart' as _i7;
import 'package:event_creator/di/app_module.dart' as _i42;
import 'package:event_creator/features/auth/data/repository/auth_repository_impl.dart'
    as _i22;
import 'package:event_creator/features/auth/data/services/auth_http_service.dart'
    as _i13;
import 'package:event_creator/features/auth/data/services/token_interceptor.dart'
    as _i6;
import 'package:event_creator/features/auth/domain/repository/auth_repository.dart'
    as _i21;
import 'package:event_creator/features/auth/domain/services/auth_service.dart'
    as _i12;
import 'package:event_creator/features/auth/domain/usecases/get_auth_status.dart'
    as _i29;
import 'package:event_creator/features/auth/domain/usecases/login_with_email_and_password.dart'
    as _i34;
import 'package:event_creator/features/auth/domain/usecases/logout.dart'
    as _i35;
import 'package:event_creator/features/auth/domain/usecases/register_with_email_and_password.dart'
    as _i38;
import 'package:event_creator/features/auth/presentation/cubit/auth_cubit.dart'
    as _i39;
import 'package:event_creator/features/cars/data/repository/cars_repository_impl.dart'
    as _i25;
import 'package:event_creator/features/cars/data/services/cars_http_service.dart'
    as _i15;
import 'package:event_creator/features/cars/domain/repository/cars_repository.dart'
    as _i24;
import 'package:event_creator/features/cars/domain/services/cars_service.dart'
    as _i14;
import 'package:event_creator/features/cars/domain/usecases/book_car.dart'
    as _i40;
import 'package:event_creator/features/cars/domain/usecases/get_all_cars.dart'
    as _i27;
import 'package:event_creator/features/cars/domain/usecases/rate_car.dart'
    as _i37;
import 'package:event_creator/features/cars/presentation/cubit/cars_cubit.dart'
    as _i41;
import 'package:event_creator/features/halls/data/repository/halls_repository_impl.dart'
    as _i17;
import 'package:event_creator/features/halls/data/services/halls_http_service.dart'
    as _i9;
import 'package:event_creator/features/halls/domain/repository/halls_repository.dart'
    as _i16;
import 'package:event_creator/features/halls/domain/services/halls_service.dart'
    as _i8;
import 'package:event_creator/features/halls/domain/usecases/book_hall.dart'
    as _i23;
import 'package:event_creator/features/halls/domain/usecases/get_all_halls.dart'
    as _i28;
import 'package:event_creator/features/halls/domain/usecases/get_hairdresser.dart'
    as _i30;
import 'package:event_creator/features/halls/domain/usecases/get_offers_halls.dart'
    as _i31;
import 'package:event_creator/features/halls/domain/usecases/get_photographers.dart'
    as _i32;
import 'package:event_creator/features/halls/domain/usecases/rate_hall.dart'
    as _i20;
import 'package:event_creator/features/halls/presentation/cubit/halls_cubit.dart'
    as _i33;
import 'package:event_creator/features/more/data/repository/more_repository_impl.dart'
    as _i19;
import 'package:event_creator/features/more/data/services/more_http_service.dart'
    as _i11;
import 'package:event_creator/features/more/domain/repository/more_repository.dart'
    as _i18;
import 'package:event_creator/features/more/domain/services/more_service.dart'
    as _i10;
import 'package:event_creator/features/more/domain/usecases/contact_us.dart'
    as _i26;
import 'package:event_creator/features/more/presentation/cubit/more_cubit.dart'
    as _i36;
import 'package:event_creator/utils/cache/cache_service.dart' as _i3;
import 'package:event_creator/utils/cache/shared_pref_cache_service.dart'
    as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.lazySingleton<_i3.CacheService>(() => _i4.SharedPrefCacheService());
    gh.lazySingleton<_i5.Connectivity>(() => appModule.connectivity);
    gh.lazySingleton<_i6.ConnectivityManager>(
        () => _i6.ConnectivityManager(gh<_i5.Connectivity>()));
    gh.lazySingleton<_i7.Dio>(() => appModule.dio);
    gh.lazySingleton<_i8.HallsService>(
        () => _i9.HallsHTTPService(gh<_i7.Dio>()));
    gh.lazySingleton<_i10.MoreService>(
        () => _i11.MoreHTTPService(gh<_i7.Dio>()));
    gh.singleton<_i6.TokenInterceptor>(_i6.TokenInterceptor(
      gh<_i3.CacheService>(),
      gh<_i6.ConnectivityManager>(),
    ));
    gh.lazySingleton<_i12.AuthService>(
        () => _i13.AuthHTTPService(gh<_i7.Dio>()));
    gh.lazySingleton<_i14.CarsService>(
        () => _i15.CarsHTTPService(gh<_i7.Dio>()));
    gh.lazySingleton<_i16.HallsRepository>(
        () => _i17.HallsRepositoryImpl(gh<_i8.HallsService>()));
    gh.lazySingleton<_i18.MoreRepository>(
        () => _i19.MoreRepositoryImpl(gh<_i10.MoreService>()));
    gh.lazySingleton<_i20.RateHall>(
        () => _i20.RateHall(gh<_i16.HallsRepository>()));
    gh.lazySingleton<_i21.AuthRepository>(() => _i22.AuthRepositoryImpl(
          gh<_i12.AuthService>(),
          gh<_i3.CacheService>(),
        ));
    gh.lazySingleton<_i23.BookHall>(
        () => _i23.BookHall(gh<_i16.HallsRepository>()));
    gh.lazySingleton<_i24.CarsRepository>(
        () => _i25.CarsRepositoryImpl(gh<_i14.CarsService>()));
    gh.lazySingleton<_i26.ContactUs>(
        () => _i26.ContactUs(gh<_i18.MoreRepository>()));
    gh.lazySingleton<_i27.GetAllCars>(
        () => _i27.GetAllCars(gh<_i24.CarsRepository>()));
    gh.lazySingleton<_i28.GetAllHalls>(
        () => _i28.GetAllHalls(gh<_i16.HallsRepository>()));
    gh.lazySingleton<_i29.GetAuthStatus>(
        () => _i29.GetAuthStatus(gh<_i21.AuthRepository>()));
    gh.lazySingleton<_i30.GetHairdressers>(
        () => _i30.GetHairdressers(gh<_i16.HallsRepository>()));
    gh.lazySingleton<_i31.GetOffersHalls>(
        () => _i31.GetOffersHalls(gh<_i16.HallsRepository>()));
    gh.lazySingleton<_i32.GetPhotographers>(
        () => _i32.GetPhotographers(gh<_i16.HallsRepository>()));
    gh.lazySingleton<_i33.HallsCubit>(() => _i33.HallsCubit(
          gh<_i28.GetAllHalls>(),
          gh<_i31.GetOffersHalls>(),
          gh<_i30.GetHairdressers>(),
          gh<_i32.GetPhotographers>(),
          gh<_i20.RateHall>(),
          gh<_i23.BookHall>(),
        ));
    gh.lazySingleton<_i34.LoginWithEmailAndPassword>(
        () => _i34.LoginWithEmailAndPassword(gh<_i21.AuthRepository>()));
    gh.lazySingleton<_i35.Logout>(() => _i35.Logout(gh<_i21.AuthRepository>()));
    gh.factory<_i36.MoreCubit>(() => _i36.MoreCubit(gh<_i26.ContactUs>()));
    gh.lazySingleton<_i37.RateCar>(
        () => _i37.RateCar(gh<_i24.CarsRepository>()));
    gh.lazySingleton<_i38.RegisterWithEmailAndPassword>(
        () => _i38.RegisterWithEmailAndPassword(gh<_i21.AuthRepository>()));
    gh.factory<_i39.AuthCubit>(() => _i39.AuthCubit(
          gh<_i38.RegisterWithEmailAndPassword>(),
          gh<_i34.LoginWithEmailAndPassword>(),
          gh<_i35.Logout>(),
          gh<_i29.GetAuthStatus>(),
        ));
    gh.lazySingleton<_i40.BookCar>(
        () => _i40.BookCar(gh<_i24.CarsRepository>()));
    gh.lazySingleton<_i41.CarsCubit>(() => _i41.CarsCubit(
          gh<_i27.GetAllCars>(),
          gh<_i37.RateCar>(),
          gh<_i40.BookCar>(),
        ));
    return this;
  }
}

class _$AppModule extends _i42.AppModule {}
