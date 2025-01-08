import 'package:arb_tasks/core/localization/language_localization.dart';
import 'package:arb_tasks/core/services/cache/cash_helper.dart';
import 'package:arb_tasks/features/metrics/presentation/logic/loaddata/loaddata_cubit.dart';
import 'package:arb_tasks/routing/app_pages.dart';
import 'package:arb_tasks/routing/app_routing.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CashHelper.init();

  await ScreenUtil.ensureScreenSize();

  runApp(
      // baseproject(token: token),
      DevicePreview(
          enabled: false,
          builder: (context) => const baseproject(
              // token: userModel
              )));
}

class baseproject extends StatelessWidget {
  const baseproject({
    super.key,
    // this.token
  });
  // final UserModel? token;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 766),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return BlocProvider(
          create: (context) {
            final cubit = LoaddataCubit();
            cubit.loadDataFromJson();
            cubit.calculatePercentages();
            // استدعاء الدالة هنا
            return cubit;
          },
          child: GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'baseproject',
            theme: ThemeData(
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                  backgroundColor: Colors.white),
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
              appBarTheme: AppBarTheme(
                  surfaceTintColor: Colors.transparent, toolbarHeight: 50.h),
              useMaterial3: true,
              fontFamily:
                  //  controller.getCacheLanguage().languageCode == "en"
                  //     ? 'Poppins'
                  //     :
                  'cairo',
            ),
            locale: const Locale('en'),
            translations: LanguageLocalization(),
            initialRoute: Routes.metricsScreen,
            getPages: appPages(),
          ),
        );
      },
    );
  }
}
