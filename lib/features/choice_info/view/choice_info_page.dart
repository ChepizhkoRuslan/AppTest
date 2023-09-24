import 'package:app_test/features/choice_info/bloc/choice_info_bloc.dart';
import 'package:app_test/features/choice_info/view/date_of_birth_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChoiceInfoPage extends StatefulWidget {
  const ChoiceInfoPage({super.key});

  @override
  State<ChoiceInfoPage> createState() => _ChoiceInfoPageState();
}

class _ChoiceInfoPageState extends State<ChoiceInfoPage> {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChoiceInfoBloc, ChoiceInfoState>(
        listener: (context, state) {
      if (state is PeriodChoiceInfoState ||
          state is PregnantChoiceInfoState) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DateOfBirthPage(
              mode: state is PeriodChoiceInfoState
                  ? DateOfBirthMode.period
                  : DateOfBirthMode.pregnant,
            ),
          ),
        );
      }
    }, builder: (context, state) {
      return Scaffold(
        body: Stack(
          children: [
            SvgPicture.asset(
              'assets/svg/choice_background.svg',
              height: double.infinity,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height / 3,
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => context
                          .read<ChoiceInfoBloc>()
                          .add(PeriodChoiceInfoEvent()),
                      child: SvgPicture.asset(
                        'assets/svg/choice_period_button.svg',
                      ),
                    ),
                    GestureDetector(
                      onTap: () => context
                          .read<ChoiceInfoBloc>()
                          .add(PregnantChoiceInfoEvent()),
                      child: SvgPicture.asset(
                        'assets/svg/choice_pregnant_button.svg',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
