import 'package:arb_tasks/core/components/buttom_bbav_bar.dart';
import 'package:arb_tasks/core/components/custom_app_bar.dart';
import 'package:arb_tasks/core/localization/app_strings.dart';
import 'package:arb_tasks/core/utiles/adaptive_ui.dart';
import 'package:arb_tasks/core/utiles/size_config.dart';
import 'package:arb_tasks/features/details/presentation/logic/cubit/monthly_cubit.dart';
import 'package:arb_tasks/features/details/presentation/logic/yearly_details_cubit.dart/detailscubit_cubit.dart';
import 'package:arb_tasks/features/details/presentation/view/widget/garph_mobile_ui.dart';
import 'package:arb_tasks/features/details/presentation/view/widget/web_view_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    // التحقق من حجم الشاشة لتحديد ما إذا كان يجب إخفاء الـ BottomNavigationBar
    bool isDesktop = SizeConfig.width > SizeConfig.desktop;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            final cubit = DetailscubitCubit();
            cubit.da = Get.arguments;
            cubit.getYearlyData();
            return cubit;
          },
        ),
        BlocProvider(
          create: (context) {
            final cubit = MonthlyCubit();
            cubit.da = Get.arguments;
            cubit.getMonthlyData();
            return cubit;
          },
        )
      ],
      child: Scaffold(
        bottomNavigationBar:
            isDesktop ? null : SizedBox(child: buildBottomNavBarWidget(1)),
        backgroundColor: Colors.white,
        appBar: isDesktop
            ? null
            : buildAppBar(
                showBackButton: false, context, title: AppStrings.graph.tr),
        body: AdaptiveUi(MobileLauyOut: (contntext) {
          return const GarphMobileUI();
        }, TabletLayOut: (contntext) {
          return const GarphMobileUI();
        }, DeskTopLayOut: (contntext) {
          return WebViewUi();
        }),
      ),
    );
  }
}
