import 'package:app_test/features/choice_info/repo/choice_info_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'choice_info_event.dart';
part 'choice_info_state.dart';

class ChoiceInfoBloc extends Bloc<ChoiceInfoEvent, ChoiceInfoState> {
  final ChoiceInfoCashRepository repository;
  ChoiceInfoBloc(this.repository) : super(ChoiceInfoInitial()) {

    on<PeriodChoiceInfoEvent>((event, emit) {
      emit(PeriodChoiceInfoState());
    });

    on<PregnantChoiceInfoEvent>((event, emit) {
      emit(PregnantChoiceInfoState());
    });

    on<SendResultChoiceInfoEvent>((event, emit) {
      event.trackPeriod != null
          ? repository.trackPeriod = event.trackPeriod
          : null;
      event.trackPregnant != null
          ? repository.trackPregnant = event.trackPregnant
          : null;
    });

    on<GetResultChoiceInfoEvent>((event, emit) {
      emit(ResultChoiceInfoState(
        trackPeriod: repository.trackPeriod,
        trackPregnant: repository.trackPregnant,
      ));
    });
  }
}
