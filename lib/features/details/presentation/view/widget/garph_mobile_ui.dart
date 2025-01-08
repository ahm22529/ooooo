import 'package:arb_tasks/core/localization/app_strings.dart';
import 'package:arb_tasks/core/utiles/app_styels.dart';
import 'package:arb_tasks/features/details/presentation/logic/cubit/monthly_cubit.dart';
import 'package:arb_tasks/features/details/presentation/view/widget/Yearly_graph.dart';
import 'package:arb_tasks/features/details/presentation/view/widget/monthly_garph.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class GarphMobileUI extends StatelessWidget {
  const GarphMobileUI({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppStrings.yearlyGraph.tr,
              style: AppStyles.f18600(context).copyWith(color: Colors.black)),
          SizedBox(height: 30.h),
          Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(child: BarChartSample()),
                  SizedBox(height: 30.h),
                  BlocBuilder<MonthlyCubit, MonthlyState>(
                    builder: (context, state) {
                      return Text(
                        context.read<MonthlyCubit>().getMonthName(),
                        style: AppStyles.f18600(context)
                            .copyWith(color: Colors.black),
                      );
                    },
                  ),
                  SizedBox(height: 20.h),
                  const Expanded(flex: 1, child: LineChartSample()),
                ],
              ))
        ],
      ),
    );
  }
}
