import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'choice_info_event.dart';
part 'choice_info_state.dart';

class ChoiceInfoBloc extends Bloc<ChoiceInfoEvent, ChoiceInfoState> {
  ChoiceInfoBloc() : super(ChoiceInfoInitial()) {
    DateTime? trackPeriod;
    DateTime? trackPregnant;

    on<PeriodChoiceInfoEvent>((event, emit) {
      emit(PeriodChoiceInfoState());
    });

    on<PregnantChoiceInfoEvent>((event, emit) {
      emit(PregnantChoiceInfoState());
    });

    on<SendResultChoiceInfoEvent>((event, emit) {
      event.trackPeriod != null ? trackPeriod = event.trackPeriod : null;
      event.trackPregnant != null ? trackPregnant = event.trackPregnant : null;
    });

    on<GetResultChoiceInfoEvent>((event, emit) {
      emit(ResultChoiceInfoState(
        trackPeriod: trackPeriod,
        trackPregnant: trackPregnant,
      ));
    });
  }
}
