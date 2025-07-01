import 'dart:async';

import 'package:al_minhaj/core/widgets/sized_box.dart';
import 'package:al_minhaj/features/home/presentation/widgets/timer_next_pray.dart';
import 'package:flutter/material.dart';

class PrayerTimeCard extends StatefulWidget {
  const PrayerTimeCard({super.key});

  @override
  State<PrayerTimeCard> createState() =>
      _PrayerTimeCardState();
}

int imageIndex = 0;
List<String> imagesList = [
  'assets/images/homecard1.png',
  'assets/images/homecard2.png',
  'assets/images/homecard3.png',
];

class _PrayerTimeCardState
    extends State<PrayerTimeCard> {
  late Timer _timer;
  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(
      const Duration(seconds: 3),
      (timer) {
        setState(() {
          imageIndex = imageIndex == 2
              ? 0
              : imageIndex + 1;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 18.heightPercent(context),
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 16,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          alignment: AlignmentDirectional.centerStart,
          fit: BoxFit.fill,
          image: AssetImage(imagesList[imageIndex]),
        ),
      ),
      child: TimerNextPray(),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
