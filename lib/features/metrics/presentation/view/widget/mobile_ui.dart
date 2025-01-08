import 'package:arb_tasks/core/components/retry_widget.dart';
import 'package:arb_tasks/core/localization/app_strings.dart';
import 'package:arb_tasks/core/utiles/app_styels.dart';
import 'package:arb_tasks/core/utiles/size_config.dart';
import 'package:arb_tasks/features/metrics/presentation/view/widget/header_metrices_widget.dart';
import 'package:arb_tasks/features/metrics/presentation/view/widget/iteam_order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../logic/loaddata/loaddata_cubit.dart';

class MobileUI extends StatefulWidget {
  const MobileUI({
    super.key,
  });

  @override
  State<MobileUI> createState() => _MobileUIState();
}

class _MobileUIState extends State<MobileUI> {
  bool isDesktop = SizeConfig.width > SizeConfig.desktop;
  @override
  Widget build(BuildContext context) {
    final authCubit = context.read<LoaddataCubit>();
    return BlocBuilder<LoaddataCubit, LoaddataState>(
      builder: (context, state) {
        if (state is Loaddataloading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is Loaddatasucess) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.h),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (isDesktop == false)
                        HeaderMetricsScreen(
                          averageOrderPrice:
                              authCubit.averageOrderPrice.toString(),
                          totalOrderCount: state.data.length.toString(),
                          totalNumberOfReturnedOrders:
                              "${authCubit.numberOrderReceived} ${AppStrings.order.tr}",
                        ),
                      SizedBox(height: 16.h),
                      Text(
                        AppStrings.order.tr,
                        style: AppStyles.f18600(context).copyWith(
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 16.h),
                    ],
                  ),
                ),
                isDesktop
                    ? SliverGrid.builder(
                        itemCount: state.data.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: .8,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 5),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: ItaemOrder(
                              iteam: state.data[index],
                            ),
                          );
                        })
                    : SliverList.builder(
                        itemCount: state.data.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: ItaemOrder(
                              iteam: state.data[index],
                            ),
                          );
                        })
              ],
            ),
          );
        } else {
          return RetryWidget(onRetry: () async {
            await authCubit.loadDataFromJson();
          });
        }
      },
    );
  }
}
