import 'package:arb_tasks/core/components/buttom_bbav_bar.dart';
import 'package:arb_tasks/core/components/pice_widget.dart';
import 'package:arb_tasks/core/localization/app_strings.dart';
import 'package:arb_tasks/core/utiles/app_image.dart';
import 'package:arb_tasks/core/utiles/app_styels.dart';
import 'package:arb_tasks/core/components/custom_drawer.dart';
import 'package:arb_tasks/features/metrics/presentation/logic/loaddata/loaddata_cubit.dart';
import 'package:arb_tasks/features/metrics/presentation/view/widget/information_card_widget.dart';
import 'package:arb_tasks/features/metrics/presentation/view/widget/mobile_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MetricesWebUi extends StatelessWidget {
  const MetricesWebUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: CustomDrawer(),
        ),
        SizedBox(
          width: 20.w,
        ),
        Expanded(
          flex: 3,
          child: MobileUI(),
        ),
        SizedBox(
          width: 24,
        ),
        Expanded(
            flex: 1,
            child: Column(
              children: [
                Container(
                  //  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(AppImage.backGroundIfo))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.totalOrderCount.tr,
                          style: AppStyles.f14600(context)
                              .copyWith(color: Colors.white, fontSize: 20),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text("50${AppStrings.order.tr}",
                            style: AppStyles.f32600(context)
                                .copyWith(fontSize: 20)),
                        SizedBox(
                          height: 15.h,
                        ),
                        InformatiionCard(
                          titel: AppStrings.averageOrderPrice.tr,
                          subtitel: "25022105",
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        InformatiionCard(
                          titel: AppStrings.totalNumberOfReturnedOrders.tr,
                          subtitel: "0",
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  "Order Statistic",
                  style:
                      AppStyles.f18600(context).copyWith(color: Colors.black),
                ),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                    height: 200.h,
                    child: BlocBuilder<LoaddataCubit, LoaddataState>(
                      builder: (context, state) {
                        return IncomeChart(
                            orderReversed: 20,
                            orderDelivered: 50,
                            orderCompleted: 20);
                      },
                    )),
              ],
            )),
        SizedBox(
          width: 5.w,
        )
      ],
    ));
  }
}
