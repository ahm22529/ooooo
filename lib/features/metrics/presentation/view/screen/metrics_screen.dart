import 'package:arb_tasks/core/components/buttom_bbav_bar.dart';
import 'package:arb_tasks/core/components/custom_app_bar.dart';

import 'package:arb_tasks/core/localization/app_strings.dart';
import 'package:arb_tasks/core/utiles/adaptive_ui.dart';

import 'package:arb_tasks/features/metrics/presentation/view/widget/mobile_ui.dart';
import 'package:arb_tasks/features/metrics/presentation/view/widget/web_view_ui.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:arb_tasks/core/utiles/size_config.dart'; // استيراد SizeConfig

class MetricsScreen extends StatefulWidget {
  const MetricsScreen({super.key});

  @override
  State<MetricsScreen> createState() => _MetricsScreenState();
}

class _MetricsScreenState extends State<MetricsScreen> {
  int currentViewIndex = 0;
  GlobalKey<ScaffoldState> globalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    // تهيئة SizeConfig
    SizeConfig.init(context);

    // التحقق من حجم الشاشة لتحديد ما إذا كان يجب إخفاء الـ BottomNavigationBar
    bool isDesktop = SizeConfig.width > SizeConfig.desktop;

    return Builder(
      builder: (context) {
        return Scaffold(
          bottomNavigationBar:
              isDesktop ? null : SizedBox(child: buildBottomNavBarWidget(0)),
          backgroundColor: Colors.white,
          appBar: MediaQuery.of(context).size.width < 800
              ? buildAppBar(
                  showBackButton: false, context, title: AppStrings.metrices.tr)
              : null,
          body: AdaptiveUi(
            MobileLauyOut: (context) {
              return MobileUI();
            },
            TabletLayOut: (context) {
              return MobileUI();
            },
            DeskTopLayOut: (context) {
              return MetricesWebUi();
            },
          ),
        );
      },
    );
  }
}
