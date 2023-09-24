part of 'choice_info_bloc.dart';

abstract class ChoiceInfoState extends Equatable {}

class ChoiceInfoInitial extends ChoiceInfoState {
  @override
  List<Object?> get props => [];
}

class PeriodChoiceInfoState extends ChoiceInfoState {
  @override
  List<Object?> get props => [];
}

class PregnantChoiceInfoState extends ChoiceInfoState {
  @override
  List<Object?> get props => [];
}

class ResultChoiceInfoState extends ChoiceInfoState {
  final DateTime? trackPeriod;
  final DateTime? trackPregnant;

  ResultChoiceInfoState({
    this.trackPeriod,
    this.trackPregnant,
  });

  @override
  List<Object?> get props => [trackPeriod, trackPregnant];
}
