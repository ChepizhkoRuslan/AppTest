import 'package:app_test/features/choice_info/bloc/choice_info_bloc.dart';
import 'package:app_test/features/choice_info/repo/choice_info_repository.dart';
import 'package:app_test/features/choice_info/view/choice_info_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const AppTest());
}

class AppTest extends StatelessWidget {
  const AppTest({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ChoiceInfoBloc(
        ChoiceInfoCashRepository(),
      ),
      child: MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: const ChoiceInfoPage(),
      ),
    );
  }
}
