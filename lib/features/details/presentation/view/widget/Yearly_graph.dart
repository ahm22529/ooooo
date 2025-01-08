import 'package:arb_tasks/core/components/retry_widget.dart';
import 'package:arb_tasks/core/utiles/app_colors.dart';
import 'package:arb_tasks/features/details/presentation/logic/cubit/monthly_cubit.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LineChartSample extends StatelessWidget {
  const LineChartSample({super.key});

  @override
  Widget build(BuildContext context) {
    final isArabic =
        Localizations.localeOf(context).languageCode == 'ar'; // تحديد اللغة

    return BlocBuilder<MonthlyCubit, MonthlyState>(
      builder: (context, state) {
        if (state is MonthlyLoad) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is MonthlySuess) {
          // بيانات الأورد (الطلبات) والمرتد
          final orders = state.monthlyordera; // بيانات الأورد
          final returns = state.monthlyreversedOrder; // بيانات المرتد

          final maxOrderValue = orders.isEmpty
              ? 0
              : orders.reduce((a, b) => a > b ? a : b).toDouble();

          final maxY = maxOrderValue * 2;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                width: 1700.w,
                child: Directionality(
                  // تغيير الاتجاه بناءً على اللغة
                  textDirection:
                      isArabic ? TextDirection.rtl : TextDirection.ltr,
                  child: LineChart(
                    LineChartData(
                      gridData: const FlGridData(show: false),
                      titlesData: FlTitlesData(
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 40,
                            getTitlesWidget: (value, meta) {
                              return Text('${value.toInt()}',
                                  style: const TextStyle(fontSize: 12));
                            },
                          ),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: (value, meta) {
                              final day = value.toInt() + 1; // اليوم من الشهر
                              return Text(
                                '$day',
                                style: const TextStyle(fontSize: 12),
                              );
                            },
                            interval: 1, // عرض كل يوم
                          ),
                        ),
                        rightTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        topTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                      ),
                      borderData: FlBorderData(show: false),
                      minX: 0,
                      maxX: 30,
                      minY: 0,
                      maxY: double.parse(maxY.toString()),
                      lineBarsData: [
                        LineChartBarData(
                          color: AppColors.primaryColor,
                          spots: List.generate(orders.length, (index) {
                            return FlSpot(
                                index.toDouble(), orders[index].toDouble());
                          }),
                          isCurved: true,
                          curveSmoothness: 0.5,
                          barWidth: 4,
                          isStrokeCapRound: true,
                          belowBarData: BarAreaData(
                            show: true,
                            gradient: LinearGradient(
                              colors: [
                                const Color(0xff17875C),
                                const Color(0xffD9D9D9).withOpacity(0),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                        ),
                        LineChartBarData(
                          color: Colors.red, // لون المنحنى للمرتد
                          spots: List.generate(returns.length, (index) {
                            return FlSpot(
                                index.toDouble(), returns[index].toDouble());
                          }),
                          isCurved: true,
                          curveSmoothness: 0.5,
                          barWidth: 4,
                          isStrokeCapRound: true,
                          belowBarData: BarAreaData(
                            show: false, // عدم تلوين المساحة تحت المنحنى
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        } else {
          return RetryWidget(onRetry: () {
            context.read<MonthlyCubit>().getMonthlyData();
          });
        }
      },
    );
  }
}
