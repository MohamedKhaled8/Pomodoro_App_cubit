part of 'pomodoro_cubit.dart';

@immutable
sealed class PomodoroState {}

final class PomodoroInitial extends PomodoroState {}

class PomodoroAppState extends PomodoroState {
  final bool isRunning;
  final bool isPaused; // Added
  final Duration duration;

  PomodoroAppState({required this.isRunning, required this.isPaused, required this.duration});

  PomodoroAppState copyWith({bool? isRunning, bool? isPaused, Duration? duration}) {
    return PomodoroAppState(
      isRunning: isRunning ?? this.isRunning,
      isPaused: isPaused ?? this.isPaused,
      duration: duration ?? this.duration,
    );
  }
}

