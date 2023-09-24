part of 'choice_info_bloc.dart';

abstract class ChoiceInfoEvent extends Equatable {}

class PeriodChoiceInfoEvent extends ChoiceInfoEvent {
  @override
  List<Object?> get props => [];
}

class PregnantChoiceInfoEvent extends ChoiceInfoEvent {
  @override
  List<Object?> get props => [];
}

class GetResultChoiceInfoEvent extends ChoiceInfoEvent {
  @override
  List<Object?> get props => [];
}

class SendResultChoiceInfoEvent extends ChoiceInfoEvent {
  final DateTime? trackPeriod;
  final DateTime? trackPregnant;

  SendResultChoiceInfoEvent({
    this.trackPeriod,
    this.trackPregnant,
  });

  @override
  List<Object?> get props => [trackPeriod, trackPregnant];
}
