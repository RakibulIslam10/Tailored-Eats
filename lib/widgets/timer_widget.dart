import 'dart:async';
import 'package:tailored_eats/core/themes/token.dart';
import 'package:tailored_eats/widgets/text_widget.dart';
import 'package:flutter/material.dart';

import '../core/utils/dimensions.dart';
import '../core/utils/space.dart';

class TimerWidget extends StatefulWidget {
  const TimerWidget({super.key, required this.onResendCode});

  final VoidCallback onResendCode;

  @override
  _TimerWidgetState createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  late int totalTimeInSeconds;
  Timer? _timer;
  bool showResend = false;

  @override
  void initState() {
    super.initState();
    totalTimeInSeconds = _parseTime('00:30');
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (totalTimeInSeconds > 0) {
        setState(() {
          totalTimeInSeconds--;
        });
      } else {
        setState(() {
          showResend = true; // Show "Resend" when the timer ends
        });
        timer.cancel();
      }
    });
  }

  void resetTimer() {
    setState(() {
      totalTimeInSeconds = _parseTime('00:30');
      showResend = false; // Hide "Resend" and show the timer again
    });
    startTimer();
  }

  // Parse the "mm:ss" format into total seconds
  int _parseTime(String time) {
    final parts = time.split(':');
    final minutes = int.parse(parts[0]);
    final seconds = int.parse(parts[1]);
    return minutes * 60 + seconds;
  }

  String formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final remainingSeconds = (seconds % 60).toString().padLeft(2, '0');
    return '$minutes:$remainingSeconds';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Dimensions.verticalSize * 0.5),
      child: Row(
        mainAxisAlignment: mainCenter,
        children: [
          TextWidget(
            'Didn’t get a code? ',
            fontWeight: FontWeight.w400,
            fontSize: Dimensions.titleSmall,
          ),
          Space.width.v5,
          TextWidget(
            showResend ? 'Resend Code' : formatTime(totalTimeInSeconds),
            color: CustomColors.primary,
            fontWeight: FontWeight.w600,
            fontSize: Dimensions.titleSmall,
            onTap: () {
              if (showResend) {
                widget.onResendCode();
                resetTimer();
              }
            },
          ),
        ],
      ),
    );
  }
}
