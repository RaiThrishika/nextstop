// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/driver_module/data/data_sources/data_source.dart'
    as _i99;
import '../../features/driver_module/data/data_sources/remote_data_source.dart'
    as _i1008;
import '../../features/driver_module/data/repository/driver_repository.dart'
    as _i316;
import '../../features/driver_module/data/services/api_service.dart' as _i533;
import '../../features/driver_module/domain/repositories/driver_repository.dart'
    as _i807;
import '../../features/driver_module/domain/usecases/route_stops_usecase.dart'
    as _i233;
import '../../features/driver_module/domain/usecases/update_trip_status_usecase.dart'
    as _i725;
import '../../features/driver_module/presentation/driver_home_screen/blocs/route_stops_list_bloc/route_stops_list_bloc.dart'
    as _i545;
import '../../features/driver_module/presentation/driver_home_screen/blocs/update_trip_status_bloc/update_trip_status_bloc.dart'
    as _i532;
import '../base_constants.dart' as _i543;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final aPIService = _$APIService();
    gh.factory<_i543.BaseConstants>(() => _i543.BaseConstants());
    gh.singleton<_i361.Dio>(() => aPIService.dio);
    gh.factory<_i99.DataSource>(() => _i1008.RemoteDataSource(gh<_i361.Dio>()));
    gh.factory<_i807.DriverRepository>(
        () => _i316.DriverRepositoryImpl(gh<_i99.DataSource>()));
    gh.factory<_i233.RouteStopsUseCase>(
        () => _i233.RouteStopsUseCase(gh<_i807.DriverRepository>()));
    gh.factory<_i725.UpdateTripStatusUseCase>(
        () => _i725.UpdateTripStatusUseCase(gh<_i807.DriverRepository>()));
    gh.factory<_i532.UpdateTripStatusBloc>(
        () => _i532.UpdateTripStatusBloc(gh<_i725.UpdateTripStatusUseCase>()));
    gh.factory<_i545.GetRouteStopsListBloc>(
        () => _i545.GetRouteStopsListBloc(gh<_i233.RouteStopsUseCase>()));
    return this;
  }
}

class _$APIService extends _i533.APIService {}
