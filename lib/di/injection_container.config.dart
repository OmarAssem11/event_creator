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
import 'package:event_creator/di/app_module.dart' as _i30;
import 'package:event_creator/features/auth/data/repository/auth_repository_impl.dart'
    as _i17;
import 'package:event_creator/features/auth/data/services/auth_http_service.dart'
    as _i11;
import 'package:event_creator/features/auth/data/services/token_interceptor.dart'
    as _i6;
import 'package:event_creator/features/auth/domain/repository/auth_repository.dart'
    as _i16;
import 'package:event_creator/features/auth/domain/services/auth_service.dart'
    as _i10;
import 'package:event_creator/features/auth/domain/usecases/get_auth_status.dart'
    as _i22;
import 'package:event_creator/features/auth/domain/usecases/login_with_email_and_password.dart'
    as _i25;
import 'package:event_creator/features/auth/domain/usecases/logout.dart'
    as _i26;
import 'package:event_creator/features/auth/domain/usecases/register_with_email_and_password.dart'
    as _i27;
import 'package:event_creator/features/auth/presentation/cubit/auth_cubit.dart'
    as _i28;
import 'package:event_creator/features/cars/data/repository/cars_repository_impl.dart'
    as _i19;
import 'package:event_creator/features/cars/data/services/cars_http_service.dart'
    as _i13;
import 'package:event_creator/features/cars/domain/repository/cars_repository.dart'
    as _i18;
import 'package:event_creator/features/cars/domain/services/cars_service.dart'
    as _i12;
import 'package:event_creator/features/cars/domain/usecases/get_all_cars.dart'
    as _i20;
import 'package:event_creator/features/cars/presentation/cubit/cars_cubit.dart'
    as _i29;
import 'package:event_creator/features/halls/data/repository/halls_repository_impl.dart'
    as _i15;
import 'package:event_creator/features/halls/data/services/halls_http_service.dart'
    as _i9;
import 'package:event_creator/features/halls/domain/repository/halls_repository.dart'
    as _i14;
import 'package:event_creator/features/halls/domain/services/halls_service.dart'
    as _i8;
import 'package:event_creator/features/halls/domain/usecases/get_all_halls.dart'
    as _i21;
import 'package:event_creator/features/halls/domain/usecases/get_offers_halls.dart'
    as _i23;
import 'package:event_creator/features/halls/presentation/cubit/halls_cubit.dart'
    as _i24;
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
    gh.singleton<_i6.TokenInterceptor>(_i6.TokenInterceptor(
      gh<_i3.CacheService>(),
      gh<_i6.ConnectivityManager>(),
    ));
    gh.lazySingleton<_i10.AuthService>(
        () => _i11.AuthHTTPService(gh<_i7.Dio>()));
    gh.lazySingleton<_i12.CarsService>(
        () => _i13.CarsHTTPService(gh<_i7.Dio>()));
    gh.lazySingleton<_i14.HallsRepository>(
        () => _i15.HallsRepositoryImpl(gh<_i8.HallsService>()));
    gh.lazySingleton<_i16.AuthRepository>(() => _i17.AuthRepositoryImpl(
          gh<_i10.AuthService>(),
          gh<_i3.CacheService>(),
        ));
    gh.lazySingleton<_i18.CarsRepository>(
        () => _i19.CarsRepositoryImpl(gh<_i12.CarsService>()));
    gh.lazySingleton<_i20.GetAllCars>(
        () => _i20.GetAllCars(gh<_i18.CarsRepository>()));
    gh.lazySingleton<_i21.GetAllHalls>(
        () => _i21.GetAllHalls(gh<_i14.HallsRepository>()));
    gh.lazySingleton<_i22.GetAuthStatus>(
        () => _i22.GetAuthStatus(gh<_i16.AuthRepository>()));
    gh.lazySingleton<_i23.GetOffersHalls>(
        () => _i23.GetOffersHalls(gh<_i14.HallsRepository>()));
    gh.factory<_i24.HallsCubit>(() => _i24.HallsCubit(
          gh<_i21.GetAllHalls>(),
          gh<_i23.GetOffersHalls>(),
        ));
    gh.lazySingleton<_i25.LoginWithEmailAndPassword>(
        () => _i25.LoginWithEmailAndPassword(gh<_i16.AuthRepository>()));
    gh.lazySingleton<_i26.Logout>(() => _i26.Logout(gh<_i16.AuthRepository>()));
    gh.lazySingleton<_i27.RegisterWithEmailAndPassword>(
        () => _i27.RegisterWithEmailAndPassword(gh<_i16.AuthRepository>()));
    gh.factory<_i28.AuthCubit>(() => _i28.AuthCubit(
          gh<_i27.RegisterWithEmailAndPassword>(),
          gh<_i25.LoginWithEmailAndPassword>(),
          gh<_i26.Logout>(),
          gh<_i22.GetAuthStatus>(),
        ));
    gh.factory<_i29.CarsCubit>(() => _i29.CarsCubit(gh<_i20.GetAllCars>()));
    return this;
  }
}

class _$AppModule extends _i30.AppModule {}
