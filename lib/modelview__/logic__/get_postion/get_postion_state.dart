part of 'get_postion_cubit.dart';

@immutable
sealed class GetPostionState {}

final class GetPostionInitial extends GetPostionState {}

final class WaitingGetPostionState extends GetPostionState {}

final class SuccessGetPostionState extends GetPostionState {}
