import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomodorocubit/cubit/pomodoro_cubit.dart';
import 'package:pomodorocubit/widgets/custom_circular_perecent_indecator.dart';

class CustomPomodoroAppBody extends StatelessWidget {
  final PomodoroAppState state;
  const CustomPomodoroAppBody({
    Key? key,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Pomodoro App",
          style: TextStyle(color: Colors.white, fontSize: 28),
        ),
        backgroundColor: const Color.fromARGB(255, 50, 65, 71),
      ),
      backgroundColor: const Color.fromARGB(255, 33, 40, 43),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomCircularPercentIndicator(
            state: state,
          ),
          const SizedBox(
            height: 55,
          ),
          state.isRunning
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (state.isRunning) {
                          if (state.isPaused) {
                            context.read<PomodoroAppCubit>().resumeTimer();
                          } else {
                            context.read<PomodoroAppCubit>().stopTimer();
                          }
                        } else {
                          context.read<PomodoroAppCubit>().startTimer();
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(255, 197, 25, 97),
                        ),
                        padding:
                            MaterialStateProperty.all(const EdgeInsets.all(14)),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(9),
                          ),
                        ),
                      ),
                      child: Text(
                        state.isPaused ? "Resume" : "Stop",
                        style: const TextStyle(fontSize: 22),
                      ),
                    ),
                    const SizedBox(
                      width: 22,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context.read<PomodoroAppCubit>().cancelTimer();
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromARGB(255, 197, 25, 97)),
                        padding:
                            MaterialStateProperty.all(const EdgeInsets.all(14)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(9))),
                      ),
                      child: const Text(
                        "CANCEL",
                        style: TextStyle(fontSize: 19),
                      ),
                    ),
                  ],
                )
              : ElevatedButton(
                  onPressed: () {
                    context.read<PomodoroAppCubit>().startTimer();
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 25, 120, 197)),
                    padding:
                        MaterialStateProperty.all(const EdgeInsets.all(14)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9))),
                  ),
                  child: const Text(
                    "Start Studying",
                    style: TextStyle(fontSize: 23),
                  ),
                )
        ],
      ),
    );
  }
}
