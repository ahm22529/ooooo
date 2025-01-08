part of 'loaddata_cubit.dart';

@immutable
sealed class LoaddataState {}

final class LoaddataInitial extends LoaddataState {}

final class Loaddataloading extends LoaddataState {}

final class Loaddatasucess extends LoaddataState {
  final List<Item> data;
  Loaddatasucess(this.data);
}

final class LoaddataFailure extends LoaddataState {
  final String message;
  LoaddataFailure(this.message);
}
