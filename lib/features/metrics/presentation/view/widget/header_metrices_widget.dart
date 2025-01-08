import 'package:arb_tasks/core/localization/app_strings.dart';
import 'package:arb_tasks/core/utiles/adaptive_ui.dart';
import 'package:arb_tasks/core/utiles/app_image.dart';
import 'package:arb_tasks/core/utiles/app_styels.dart';
import 'package:arb_tasks/features/metrics/presentation/view/widget/information_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HeaderMetricsScreen extends StatelessWidget {
  const HeaderMetricsScreen({
    super.key,
    required this.averageOrderPrice,
    required this.totalOrderCount,
    required this.totalNumberOfReturnedOrders,
  });
  final String averageOrderPrice, totalOrderCount, totalNumberOfReturnedOrders;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          image: const DecorationImage(
              fit: BoxFit.cover, image: AssetImage(AppImage.backGroundIfo))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
        child: AdaptiveUi(
          MobileLauyOut: (BuildContext context) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.totalOrderCount.tr,
                  style: AppStyles.f14600(context)
                      .copyWith(color: Colors.white, fontSize: 18.sp),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text("$totalOrderCount${AppStrings.order.tr}",
                    style: AppStyles.f32600(context).copyWith(fontSize: 32.sp)),
                SizedBox(
                  height: 15.h,
                ),
                InformatiionCard(
                  titel: AppStrings.averageOrderPrice.tr,
                  subtitel: averageOrderPrice,
                ),
                SizedBox(
                  height: 10.h,
                ),
                InformatiionCard(
                  titel: AppStrings.totalNumberOfReturnedOrders.tr,
                  subtitel: totalNumberOfReturnedOrders,
                ),
              ],
            );
          },
          TabletLayOut: (BuildContext context) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.totalOrderCount.tr,
                  style: AppStyles.f14600(context)
                      .copyWith(color: Colors.white, fontSize: 18.sp),
                ),
                SizedBox(
                  width: 5.h,
                ),
                Text("$totalOrderCount${AppStrings.order.tr}",
                    style: AppStyles.f32600(context).copyWith(fontSize: 32.sp)),
                SizedBox(
                  height: 15.h,
                ),
                InformatiionCard(
                  titel: AppStrings.averageOrderPrice.tr,
                  subtitel: averageOrderPrice,
                ),
                SizedBox(
                  height: 10.h,
                ),
                InformatiionCard(
                  titel: AppStrings.totalNumberOfReturnedOrders.tr,
                  subtitel: totalNumberOfReturnedOrders,
                ),
              ],
            );
          },
          DeskTopLayOut: (BuildContext context) {
            return const Row(
              children: [],
            );
          },
        ),
      ),
    );
  }
}
