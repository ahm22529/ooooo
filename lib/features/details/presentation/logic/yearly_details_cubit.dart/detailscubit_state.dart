part of 'detailscubit_cubit.dart';

@immutable
sealed class DetailscubitState {}

final class DetailscubitInitial extends DetailscubitState {}

final class Detailscubitload extends DetailscubitState {}

final class Detailscubitsucess extends DetailscubitState {
  final List<int> data;

  Detailscubitsucess({required this.data});
}

final class DetailscubitFailure extends DetailscubitState {
  final String message;

  DetailscubitFailure({required this.message});
}
