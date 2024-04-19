part of 'add_place_cubit.dart';

@immutable
sealed class AddPlaceState {}

final class AddPlaceInitial extends AddPlaceState {}

final class SucessAddState extends AddPlaceState {}
