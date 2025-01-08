import 'package:arb_tasks/features/details/presentation/view/screen/deails_screen.dart';
import 'package:arb_tasks/features/metrics/presentation/view/screen/metrics_screen.dart';
import 'package:arb_tasks/routing/app_routing.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

appPages() => [
      GetPage(
        name: Routes.metricsScreen,
        //  binding: AddPofaBinding(),
        page: () => const MetricsScreen(),
      ),
      GetPage(
        name: Routes.detailsScreen,
        //  binding: AddPofaBinding(),
        page: () => const DetailsScreen(),
      ),
      // GetPage(
      //   name: Routes.registerScreen,
      //   //  binding: AddPofaBinding(),
      //   page: () => const SingUpScreen(),
      // ),
      // GetPage(
      //   name: Routes.loginScreen,
      //   //  binding: AddPofaBinding(),
      //   page: () => const LoginScreen(),
      // )
    ];
