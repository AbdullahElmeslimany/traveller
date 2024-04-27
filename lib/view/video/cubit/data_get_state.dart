part of 'data_get_cubit.dart';

@immutable
sealed class DataGetState {}

final class DataGetInitial extends DataGetState {}

final class SuccessDataGetState extends DataGetState {
  final data;

  SuccessDataGetState({required this.data});
}

final class ChangeImageAndShowState extends DataGetState {}
