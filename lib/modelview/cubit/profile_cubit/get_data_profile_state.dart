part of 'get_data_profile_cubit.dart';

@immutable
sealed class GetDataProfileState {}

final class GetDataProfileInitial extends GetDataProfileState {}

final class SucessDataProfileState extends GetDataProfileState {
  final List data;
  SucessDataProfileState({required this.data});
}

final class WaitingProfileState extends GetDataProfileState {}

final class FialedDataProfileState extends GetDataProfileState {}
