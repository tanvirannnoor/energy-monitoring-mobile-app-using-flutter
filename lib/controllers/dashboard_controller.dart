import 'package:get/get.dart';
import '../routes/app_routes.dart';

class DashboardController extends GetxController {
  final selectedCardIndex = 0.obs;
  final isSourceSelected = true.obs;

  void toggleSourceLoad() {
    isSourceSelected.value = !isSourceSelected.value;
  }

  void onCardTap(int index, bool isActive) {
    selectedCardIndex.value = index;
    if (isActive) {
      Get.toNamed(AppRoutes.DATA_VIEW);
    } else {
      Get.toNamed(AppRoutes.NO_DATA);
    }
  }
}