import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({
    super.key,
    required this.trackPeriod,
    required this.trackPregnant,
  });
  final DateTime? trackPeriod;
  final DateTime? trackPregnant;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset(
            'assets/svg/choice_background.svg',
            height: double.infinity,
          ),
          Center(
            child: Column(
              children: [
                const SizedBox(height: 240),
                const Text(
                  'My period',
                  style: TextStyle(fontSize: 24),
                ),
                const SizedBox(height: 16),
                Text(trackPeriod?.toString() ?? 'Period wasnt sended'),
                const SizedBox(height: kToolbarHeight),
                const Text('Pregnant',
                  style: TextStyle(fontSize: 24),),
                const SizedBox(height: 16),
                Text(trackPregnant?.toString() ?? 'Pregnant wasnt sended'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
