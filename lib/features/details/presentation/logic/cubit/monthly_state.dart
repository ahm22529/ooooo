part of 'monthly_cubit.dart';

@immutable
sealed class MonthlyState {}

final class MonthlyInitial extends MonthlyState {}

final class MonthlyLoad extends MonthlyState {}

final class MonthlySuess extends MonthlyState {
  final List<int> monthlyordera, monthlyreversedOrder;

  MonthlySuess(
      {required this.monthlyordera, required this.monthlyreversedOrder});
}

final class MonthlyFailure extends MonthlyState {
  final String message;

  MonthlyFailure({required this.message});
}
