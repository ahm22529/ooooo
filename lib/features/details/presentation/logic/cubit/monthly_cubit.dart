import 'package:arb_tasks/features/details/data/repo/details_rep_imp.dart';
import 'package:arb_tasks/features/metrics/data/model/Iteam_model.dart';
import 'package:bloc/bloc.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

part 'monthly_state.dart';

class MonthlyCubit extends Cubit<MonthlyState> {
  MonthlyCubit() : super(MonthlyInitial());
  List<Item>? da;
  DetailsRepImp de = DetailsRepImp();
  int numberoffmonth = 1;

  Future<void> getMonthlyData() async {
    emit(MonthlyLoad());

    var res = await de.getMontly(da!, numberoffmonth);

    res.fold((l) {
      emit(MonthlyFailure(message: l.message));
    }, (r) {
      emit(MonthlySuess(
          monthlyordera: r["dailyOrders"],
          monthlyreversedOrder: r["returnedOrders"]));
    });
  }

  String getMonthName() {
    // التحقق من اللغة الحالية
    bool isArabic = Get.locale?.languageCode == 'ar';

    // أسماء الأشهر بالعربية
    List<String> arabicMonths = [
      'يناير',
      'فبراير',
      'مارس',
      'أبريل',
      'مايو',
      'يونيو',
      'يوليو',
      'أغسطس',
      'سبتمبر',
      'أكتوبر',
      'نوفمبر',
      'ديسمبر'
    ];

    // أسماء الأشهر بالإنجليزية
    List<String> englishMonths = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];

    // إرجاع اسم الشهر بناءً على اللغة
    return isArabic
        ? arabicMonths[numberoffmonth]
        : englishMonths[numberoffmonth];
  }
}
