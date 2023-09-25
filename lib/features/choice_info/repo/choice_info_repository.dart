class ChoiceInfoCashRepository {
  DateTime? trackPeriod;
  DateTime? trackPregnant;

  static final ChoiceInfoCashRepository _choiceInfoRepository =
      ChoiceInfoCashRepository._internal();

  factory ChoiceInfoCashRepository() {
    return _choiceInfoRepository;
  }

  ChoiceInfoCashRepository._internal();
}
