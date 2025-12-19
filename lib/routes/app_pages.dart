import 'package:get/get.dart';
import '../views/login_screen.dart';
import '../views/dashboard_screen.dart';
import '../views/data_view_screen.dart';
import '../views/revenue_view_screen.dart';
import '../views/no_data_screen.dart';
import '../controllers/auth_controller.dart';
import '../controllers/dashboard_controller.dart';
import '../controllers/data_controller.dart';
import '../controllers/revenue_controller.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => LoginScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => AuthController());
      }),
    ),
    GetPage(
      name: AppRoutes.DASHBOARD,
      page: () => DashboardScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => DashboardController());
      }),
    ),
    GetPage(
      name: AppRoutes.DATA_VIEW,
      page: () => DataViewScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => DataController());
      }),
    ),
    GetPage(
      name: AppRoutes.REVENUE_VIEW,
      page: () => RevenueViewScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => RevenueController());
      }),
    ),
    GetPage(
      name: AppRoutes.NO_DATA,
      page: () => NoDataScreen(),
    ),
  ];
}