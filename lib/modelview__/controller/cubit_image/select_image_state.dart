part of 'select_image_cubit.dart';

@immutable
sealed class SelectImageState {}

final class SelectImageInitial extends SelectImageState {}

final class SuccessImageInitial extends SelectImageState {}

final class FeailImageInitial extends SelectImageState {}
