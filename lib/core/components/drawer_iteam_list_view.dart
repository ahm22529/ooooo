// ignore: camel_case_types
import 'dart:developer';

import 'package:arb_tasks/features/metrics/presentation/logic/loaddata/loaddata_cubit.dart';
import 'package:arb_tasks/core/components/iteam_darwer.dart';
import 'package:arb_tasks/routing/app_routing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class drweriteamListview extends StatefulWidget {
  const drweriteamListview({
    super.key,
    // ignore: non_constant_identifier_names
    required this.Iteam,
  });

  final List Iteam;

  @override
  State<drweriteamListview> createState() => _drweriteamListviewState();
}

class _drweriteamListviewState extends State<drweriteamListview> {
  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
        itemCount: widget.Iteam.length,
        itemBuilder: (context, index) =>
            BlocBuilder<LoaddataCubit, LoaddataState>(
              builder: (context, state) {
                return GestureDetector(
                    onTap: () {
                      log(index.toString());
                      if (context.read<LoaddataCubit>().active != index) {
                        setState(() {
                          context.read<LoaddataCubit>().active = index;
                          print(context.read<LoaddataCubit>().active);
                        });
                      }
                      switch (index) {
                        case 0:
                          Get.toNamed(Routes.metricsScreen);
                          break;
                        case 1:
                          Navigator.of(context).pushNamed(
                            Routes.detailsScreen,
                            arguments: context
                                .read<LoaddataCubit>()
                                .sucesdata, // استخدام الحالة هنا
                          );
                          break;
                      }
                    },
                    child: IteamDrwer(
                      model: widget.Iteam[index],
                      isactive: context.read<LoaddataCubit>().active == index,
                    ));
              },
            ));
  }
}
