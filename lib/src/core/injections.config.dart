// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cache/cache.dart' as _i566;
import 'package:cinema_plus/src/domain/repository/auth_repository.dart'
    as _i854;
import 'package:cinema_plus/src/domain/repository/movie_repository.dart'
    as _i1045;
import 'package:cinema_plus/src/domain/repository/ticket_repository.dart'
    as _i1064;
import 'package:cinema_plus/src/domain/repository/user_repository.dart'
    as _i447;
import 'package:cinema_plus/src/features/authentication/cubit/auth_cubit.dart'
    as _i975;
import 'package:cinema_plus/src/features/booking/cubit/booking_cubit.dart'
    as _i796;
import 'package:cinema_plus/src/features/home/favorites/cubit/favourite_cubit.dart'
    as _i186;
import 'package:cinema_plus/src/features/home/movies/cubit/movie_cubit.dart'
    as _i432;
import 'package:cinema_plus/src/features/home/profile/cubit/profile_cubit.dart'
    as _i856;
import 'package:cinema_plus/src/features/home/tickets/cubit/ticket_cubit.dart'
    as _i749;
import 'package:cinema_plus/src/features/payment/cubit/payment_cubit.dart'
    as _i1019;
import 'package:cinema_plus/src/features/search/cubit/search_cubit.dart'
    as _i392;
import 'package:cinema_plus/src/service/app.module.dart' as _i374;
import 'package:cinema_plus/src/service/firebase_service.dart' as _i651;
import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:dio/dio.dart' as _i361;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:get_it/get_it.dart' as _i174;
import 'package:google_sign_in/google_sign_in.dart' as _i116;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    await gh.factoryAsync<_i651.FirebaseService>(
      () => appModule.firebaseService,
      preResolve: true,
    );
    gh.factory<_i59.FirebaseAuth>(() => appModule.auth);
    gh.factory<_i974.FirebaseFirestore>(() => appModule.firestore);
    gh.factory<_i116.GoogleSignIn>(() => appModule.googleSignIn);
    gh.factory<_i566.CacheClient>(() => appModule.cache);
    gh.factory<_i361.Dio>(() => appModule.dio);
    gh.lazySingleton<_i796.BookingCubit>(() => _i796.BookingCubit());
    gh.lazySingleton<_i1045.MovieRepository>(() => _i1045.MovieRepository(
          gh<_i361.Dio>(),
          gh<_i974.FirebaseFirestore>(),
          gh<_i59.FirebaseAuth>(),
        ));
    gh.lazySingleton<_i854.AuthenticationRepository>(
        () => _i854.AuthenticationRepository(
              gh<_i566.CacheClient>(),
              gh<_i59.FirebaseAuth>(),
              gh<_i116.GoogleSignIn>(),
              gh<_i974.FirebaseFirestore>(),
            ));
    gh.lazySingleton<_i975.AuthCubit>(
        () => _i975.AuthCubit(gh<_i854.AuthenticationRepository>()));
    gh.lazySingleton<_i856.ProfileCubit>(
        () => _i856.ProfileCubit(gh<_i854.AuthenticationRepository>()));
    gh.lazySingleton<_i186.FavouriteCubit>(
        () => _i186.FavouriteCubit(gh<_i1045.MovieRepository>()));
    gh.lazySingleton<_i432.MovieCubit>(
        () => _i432.MovieCubit(gh<_i1045.MovieRepository>()));
    gh.lazySingleton<_i392.SearchCubit>(
        () => _i392.SearchCubit(gh<_i1045.MovieRepository>()));
    gh.lazySingleton<_i1064.TicketRepository>(() => _i1064.TicketRepository(
          gh<_i974.FirebaseFirestore>(),
          gh<_i59.FirebaseAuth>(),
        ));
    gh.lazySingleton<_i447.UserRepository>(() => _i447.UserRepository(
          gh<_i974.FirebaseFirestore>(),
          gh<_i59.FirebaseAuth>(),
        ));
    gh.lazySingleton<_i1019.PaymentCubit>(
        () => _i1019.PaymentCubit(gh<_i447.UserRepository>()));
    gh.lazySingleton<_i749.TicketCubit>(
        () => _i749.TicketCubit(gh<_i1064.TicketRepository>()));
    return this;
  }
}

class _$AppModule extends _i374.AppModule {}
