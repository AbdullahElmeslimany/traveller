part of 'page_list_cubit.dart';

@immutable
sealed class PageListState {}

final class PageListInitial extends PageListState {}

final class PageListWaitState extends PageListState {}

final class PageListCHangeState extends PageListState {}
