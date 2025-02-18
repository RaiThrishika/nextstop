import 'package:driver_app/features/driver_module/domain/entities/update_trip_status_response.dart';
import 'package:driver_app/features/driver_module/domain/usecases/update_trip_status_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'update_trip_status_event.dart';
part 'update_trip_status_state.dart';
part 'update_trip_status_bloc.freezed.dart';

@Injectable()
class UpdateTripStatusBloc extends Bloc<UpdateTripStatusEvent, UpdateTripStatusState> {
  final UpdateTripStatusUseCase useCase;
  UpdateTripStatusBloc(this.useCase) : super(const UpdateTripStatusState.initial()) {
    on<UpdateTripStatusEvent>((event, emit) async{
      await event.when(fetch: (tripStatus, tripType) async{
        emit(const UpdateTripStatusState.loading());
        print("UpdateTripStatus State bloc called");
        try {
          final response = await useCase.execute(
            tripStatus: tripStatus,
            tripType: tripType
          );
          response.fold((l) {
            print("UpdateTripStatus state bloc called $l");
            emit(UpdateTripStatusState.failed(error: l));},
                  (r) {
                print("UpdateTripStatus  bloc called $r");
                emit(UpdateTripStatusState.success(response: r));
              });
        } catch (e) {
          emit(UpdateTripStatusState.failed(error: "Error occurred $e"));
        }
      });
    });
  }
}




