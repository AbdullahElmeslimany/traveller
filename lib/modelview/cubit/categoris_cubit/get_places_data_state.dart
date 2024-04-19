part of 'get_places_data_cubit.dart';

@immutable
sealed class GetPlacesDataState {}

final class GetPlacesDataInitial extends GetPlacesDataState {}

final class SuccessDataState extends GetPlacesDataState {
  final List data;
  SuccessDataState({required this.data});
}

final class WaitingDataState extends GetPlacesDataState {}

final class FialedDataState extends GetPlacesDataState {}
