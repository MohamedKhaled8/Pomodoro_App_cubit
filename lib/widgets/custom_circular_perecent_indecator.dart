import 'package:flutter/material.dart';
import 'package:pomodorocubit/cubit/pomodoro_cubit.dart';
import 'package:percent_indicator/percent_indicator.dart';


class CustomCircularPercentIndicator extends StatelessWidget {
  final PomodoroAppState state;
  const CustomCircularPercentIndicator({
    Key? key,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularPercentIndicator(
          progressColor: const Color.fromARGB(255, 255, 85, 113),
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          lineWidth: 7,
          percent: state.duration.inMinutes / 25,
          animation: true,
          animateFromLastPercent: true,
          animationDuration: 1000,
          radius: 120.0,
          center: Text(
            "${state.duration.inMinutes.remainder(60).toString().padLeft(2, "0")}:${state.duration.inSeconds.remainder(60).toString().padLeft(2, "0")}",
            style: const TextStyle(fontSize: 77, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
