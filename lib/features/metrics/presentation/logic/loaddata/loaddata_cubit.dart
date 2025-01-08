import 'dart:developer';

import 'package:arb_tasks/features/metrics/data/model/Iteam_model.dart';
import 'package:arb_tasks/features/metrics/data/repo/metrices_rep_imp.dart';
import 'package:arb_tasks/features/metrics/domain/repo/metrices_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'loaddata_state.dart';

class LoaddataCubit extends Cubit<LoaddataState> {
  LoaddataCubit() : super(LoaddataInitial());
  MetricesRepo metricesRepo = MetricesRepImp();
  int active = 0;
  int numberOrderReceived = 0;
  List<Item>? sucesdata;
  double? averageOrderPrice = 0;
  double returnedPercentage = 0,
      numberOrderReturned = 0,
      numberOrder = 0,
      numberOrderCompleted = 0;
  double numberOrderPercentage = 0;
  double? completedPercentage;
  Future<void> loadDataFromJson() async {
    emit(Loaddataloading());
    var data = await metricesRepo.loadData();
    data.fold((faull) {
      emit(LoaddataFailure(faull.message));
    }, (sucess) {
      sucesdata = sucess;

      for (var element in sucess) {
        if (element.status == "RETURNED") {
          numberOrderReceived++;
          log(numberOrderReceived.toString());
        } else if (element.status == "DELIVERED") {
          numberOrderCompleted++;
          log(numberOrderReceived.toString());
        } else if (element.status == "ORDERED") {
          numberOrder++;
          log(numberOrderReceived.toString());
        }
      }
      if (sucess.isNotEmpty) {
        double totalPrice = 0;

        for (var element in sucess) {
          if (element.status == "RETURNED") {
            numberOrderReceived++;
          }

          final cleanedPrice =
              element.price.replaceAll('\$', '').replaceAll(',', '');
          totalPrice += double.parse(cleanedPrice);
        }

        averageOrderPrice = totalPrice / sucess.length;
      } else {
        averageOrderPrice = 0;
      }

      emit(Loaddatasucess(sucess));
    });
  }

  // دالة لحساب النسب المئوية
  void calculatePercentages() {
    double totalOrders = sucesdata?.length.toDouble() ?? 0;
    if (totalOrders == 0) {
      returnedPercentage = 0;
      numberOrderPercentage = 0;
      completedPercentage = 0;
    }

    returnedPercentage = (numberOrderReceived! / totalOrders) * 100;
    completedPercentage = (numberOrderCompleted / totalOrders) * 100;
    numberOrderPercentage = (numberOrder! / totalOrders) * 100;
    log(numberOrderPercentage.toString());
  }
}
