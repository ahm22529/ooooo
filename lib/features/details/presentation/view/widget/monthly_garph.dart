import 'package:arb_tasks/core/components/retry_widget.dart';
import 'package:arb_tasks/core/utiles/app_colors.dart';
import 'package:arb_tasks/features/details/presentation/logic/cubit/monthly_cubit.dart';
import 'package:arb_tasks/features/details/presentation/logic/yearly_details_cubit.dart/detailscubit_cubit.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BarChartSample extends StatefulWidget {
  const BarChartSample({super.key});

  @override
  _BarChartSampleState createState() => _BarChartSampleState();
}

class _BarChartSampleState extends State<BarChartSample> {
  int? touchedIndex;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailscubitCubit, DetailscubitState>(
      builder: (context, state) {
        if (state is Detailscubitload) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is Detailscubitsucess) {
          final data = state.data; // بيانات القيم (عدد الطلبات لكل شهر)
          final maxY = (data.isEmpty ? 0 : data.reduce((a, b) => a > b ? a : b))
              .toDouble(); // أعلى قيمة في القائمة
          return Padding(
            padding: const EdgeInsets.all(0.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                width: 600.h,
                child: BarChart(
                  BarChartData(
                    maxY: maxY + 10,
                    gridData: const FlGridData(show: false),
                    barGroups: _generateBarGroups(data),
                    titlesData: FlTitlesData(
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 60,
                          getTitlesWidget: (value, meta) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '${value.toInt()}',
                                style: const TextStyle(fontSize: 12),
                              ),
                            );
                          },
                        ),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) {
                            const months = [
                              'Jan',
                              'Feb',
                              'Mar',
                              'Apr',
                              'May',
                              'Jun',
                              'Jul',
                              'Aug',
                              'Sep',
                              'Oct',
                              'Nov',
                              'Dec'
                            ];
                            return Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                months[value.toInt()],
                                style: const TextStyle(fontSize: 12),
                              ),
                            );
                          },
                        ),
                      ),
                      rightTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      topTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                    ),
                    barTouchData: BarTouchData(
                      touchTooltipData: BarTouchTooltipData(
                        getTooltipItem: (group, groupIndex, rod, rodIndex) {
                          const months = [
                            'Jan',
                            'Feb',
                            'Mar',
                            'Apr',
                            'May',
                            'Jun',
                            'Jul',
                            'Aug',
                            'Sep',
                            'Oct',
                            'Nov',
                            'Dec'
                          ];
                          return BarTooltipItem(
                            '${months[groupIndex]}\n',
                            const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            children: [
                              TextSpan(
                                text: 'Orders: ${rod.toY.toString()}',
                                style: const TextStyle(color: Colors.yellow),
                              ),
                            ],
                          );
                        },
                      ),
                      touchCallback: (event, response) {
                        setState(() {
                          if (event.isInterestedForInteractions &&
                              response != null &&
                              response.spot != null) {
                            touchedIndex = response.spot!.touchedBarGroupIndex;

                            context.read<MonthlyCubit>().numberoffmonth =
                                touchedIndex!;
                            context.read<MonthlyCubit>().getMonthlyData();
                          } else {
                            touchedIndex = null;
                          }
                        });
                      },
                    ),
                    borderData: FlBorderData(show: false),
                    groupsSpace: 8,
                  ),
                ),
              ),
            ),
          );
        } else {
          return RetryWidget(
            onRetry: () => context.read<DetailscubitCubit>().getYearlyData(),
          );
        }
      },
    );
  }

  List<BarChartGroupData> _generateBarGroups(List<int> data) {
    return List.generate(
      data.length,
      (index) => BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: data[index].toDouble(),
            color: touchedIndex == index
                ? AppColors.primaryColor.withOpacity(0.8)
                : AppColors.primaryColor,
            width: 20,
            borderRadius: BorderRadius.circular(4),
          ),
        ],
      ),
    );
  }
}
