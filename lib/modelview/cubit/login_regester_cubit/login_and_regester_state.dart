part of 'login_and_regester_cubit.dart';

@immutable
sealed class LoginAndRegesterState {}

final class LoginAndRegesterInitial extends LoginAndRegesterState {}

final class WaitingState extends LoginAndRegesterState {}

final class ErrorState extends LoginAndRegesterState {
  final String message;
  ErrorState({required this.message});
}

final class LoginSuccessState extends LoginAndRegesterState {}

final class SignUpSuccessState extends LoginAndRegesterState {}
