import 'package:arb_tasks/core/error/fauiler.dart';
import 'package:arb_tasks/features/details/domain/repo/details_repo.dart';
import 'package:arb_tasks/features/metrics/data/model/Iteam_model.dart';
import 'package:dartz/dartz.dart';

class DetailsRepImp extends DetailsRepo {
  @override
  Future<Either<Failure, List<int>>> getYearlydata(
    List<Item> iteams,
  ) async {
    try {
      List<int> monthlyOrders = List.filled(12, 0);

      for (var element in iteams) {
        final date = DateTime.parse(element.registered);
        final monthIndex = date.month - 1;
        monthlyOrders[monthIndex]++;
      }
      print(monthlyOrders);
      return right(monthlyOrders);
    } on Exception catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> getMontly(
      List<Item> iteams, int namberOfmonthly) async {
    try {
      List<int> dailyOrders = List.filled(31, 0);
      List<int> returnedOrders = List.filled(31, 0);

      for (var element in iteams) {
        final date = DateTime.parse(element.registered);

        if (date.month == namberOfmonthly) {
          final dayIndex = date.day - 1;
          dailyOrders[dayIndex]++;

          // إذا كان الطلب مُرجعًا، قم بزيادة العداد في قائمة المرتجعات
          if (element.status == "RETURNED") {
            // استخدم الشرط الذي يحدد إذا كان الطلب مرجعًا
            returnedOrders[dayIndex]++;
          }
        }
      }

      print('Daily Orders: $dailyOrders');
      print('Returned Orders: $returnedOrders');

      return right({
        "dailyOrders": dailyOrders,
        "returnedOrders": returnedOrders,
      });
    } on Exception catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
