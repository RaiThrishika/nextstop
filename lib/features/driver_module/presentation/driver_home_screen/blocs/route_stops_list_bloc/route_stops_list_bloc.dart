import 'package:driver_app/features/driver_module/domain/entities/get_route_stops_response.dart';
import 'package:driver_app/features/driver_module/domain/usecases/route_stops_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'route_stops_list_event.dart';
part 'route_stops_list_state.dart';
part 'route_stops_list_bloc.freezed.dart';

@Injectable()
class GetRouteStopsListBloc extends Bloc<GetRouteStopsListEvent, GetRouteStopsListState> {
  final RouteStopsUseCase useCase;
  GetRouteStopsListBloc(this.useCase) : super(const GetRouteStopsListState.initial()) {
    on<GetRouteStopsListEvent>((event, emit) async{
      await event.when(fetch: () async{
        emit(const GetRouteStopsListState.loading());
        print("GetRouteStops State bloc called");
        try {
          final response = await useCase.execute();
          response.fold((l) {
            print("GetRouteStops state bloc called $l");
            emit(GetRouteStopsListState.failed(error: l));},
                  (r) {
                print("GetRouteStopsListState bloc called $r");
                emit(GetRouteStopsListState.success(response: r));
              });
        } catch (e) {
          emit(GetRouteStopsListState.failed(error: "Error occurred $e"));
        }
      });
    });
  }
}




