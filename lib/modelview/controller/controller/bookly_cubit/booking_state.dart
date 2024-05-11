part of 'booking_cubit.dart';

@immutable
sealed class BookingState {}

final class BookingInitial extends BookingState {}

final class SuccessBooklyState extends BookingState {
  final currentRangeValues;

  SuccessBooklyState({this.currentRangeValues});
}

final class SuccessGetBooklyState extends BookingState {
  final data;
  SuccessGetBooklyState({this.data});
}
