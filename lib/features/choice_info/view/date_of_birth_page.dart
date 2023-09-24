import 'package:app_test/features/choice_info/bloc/choice_info_bloc.dart';
import 'package:app_test/features/choice_info/view/result_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum DateOfBirthMode { period, pregnant }

class DateOfBirthPage extends StatefulWidget {
  const DateOfBirthPage({
    super.key,
    required this.mode,
  });

  final DateOfBirthMode mode;

  @override
  State<DateOfBirthPage> createState() => _DateOfBirthPageState();
}

class _DateOfBirthPageState extends State<DateOfBirthPage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChoiceInfoBloc, ChoiceInfoState>(
        listener: (BuildContext context, state) {
      if (state is ResultChoiceInfoState) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ResultPage(
              trackPeriod: state.trackPeriod,
              trackPregnant: state.trackPregnant,
            ),
          ),
        );
      }
    }, builder: (BuildContext context, state) {
      return Scaffold(
        body: Stack(
          children: [
            SvgPicture.asset(
              'assets/svg/date_of_birth_background.svg',
              height: double.infinity,
            ),
            Align(
              alignment: Alignment.center,
              child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: DateTime.now(),
                  onDateTimeChanged: (date) {
                    if (widget.mode == DateOfBirthMode.period) {
                      context.read<ChoiceInfoBloc>().add(
                            SendResultChoiceInfoEvent(
                              trackPeriod: date,
                            ),
                          );
                    } else if (widget.mode == DateOfBirthMode.pregnant) {
                      context.read<ChoiceInfoBloc>().add(
                            SendResultChoiceInfoEvent(
                              trackPregnant: date,
                            ),
                          );
                    }
                  }),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: kToolbarHeight),
                child: GestureDetector(
                  onTap: () => context.read<ChoiceInfoBloc>().add(
                        GetResultChoiceInfoEvent(),
                      ),
                  child: SvgPicture.asset(
                    'assets/svg/next_button.svg',
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
