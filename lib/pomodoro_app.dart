import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomodorocubit/cubit/pomodoro_cubit.dart';
import 'package:pomodorocubit/widgets/custom_pomodoro_app_body.dart';

class PomodoroApp extends StatelessWidget {
  final PomodoroAppCubit cubit = PomodoroAppCubit();

  PomodoroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PomodoroAppCubit, PomodoroAppState>(
      builder: (context, state) {
        return CustomPomodoroAppBody(
          state: state,
        );
      },
    );
  }
}
