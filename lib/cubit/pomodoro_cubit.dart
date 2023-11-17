import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'pomodoro_state.dart';

class PomodoroAppCubit extends Cubit<PomodoroAppState> {
  late Timer _repeatedFunction;
  Duration _initialDuration = Duration(minutes: 25);

  PomodoroAppCubit() : super(PomodoroAppState(isRunning: false, isPaused: false, duration: Duration(minutes: 25)));

  void startTimer() {
    _repeatedFunction = Timer.periodic(Duration(seconds: 1), (timer) {
      emit(state.copyWith(duration: state.duration - Duration(seconds: 1)));
    });
    emit(state.copyWith(isRunning: true, isPaused: false));
  }

  void stopTimer() {
    _repeatedFunction.cancel();
    emit(state.copyWith(isRunning: true, isPaused: true));
  }

  void resumeTimer() {
    _repeatedFunction = Timer.periodic(Duration(seconds: 1), (timer) {
      emit(state.copyWith(duration: state.duration - Duration(seconds: 1)));
    });
    emit(state.copyWith(isRunning: true, isPaused: false));
  }

  void cancelTimer() {
    _repeatedFunction.cancel();
    emit(state.copyWith(isRunning: false, isPaused: false, duration: _initialDuration));
  }

  @override
  Future<void> close() {
    _repeatedFunction.cancel();
    return super.close();
  }
}
