import 'package:get/get.dart';
import '../routes/app_routes.dart';

class DashboardController extends GetxController {
  // Observable variables
  var isSourceSelected = true.obs;
  var selectedTab = 0.obs;

  // Toggle between Source and Load
  void toggleSourceLoad() {
    isSourceSelected.value = !isSourceSelected.value;
  }

  // Handle tab change
  void onTabChange(int index) {
    selectedTab.value = index;
    // You can add logic here to load different data based on tab
    switch (index) {
      case 0:
        // Summary tab logic
        print('Summary tab selected');
        break;
      case 1:
        // SLD tab logic
        print('SLD tab selected');
        break;
      case 2:
        // Data tab logic
        print('Data tab selected');
        break;
    }
  }

  // Handle card tap - only Data Type 2 goes to data view
  void onCardTap(int index, bool isActive) {
    print('Card $index tapped, Active: $isActive');
    // Only Data Type 2 (index 1) goes to DATA_VIEW
    if (index == 1 && isActive) {
      Get.toNamed(AppRoutes.DATA_VIEW);
    } else {
      Get.toNamed(AppRoutes.NO_DATA);
    }
  }

  // Handle feature card tap
  void onFeatureTap(String featureName) {
    print('Feature $featureName tapped');
    Get.toNamed(AppRoutes.NO_DATA);
  }


  @override
  void onClose() {
    // Clean up resources here
    super.onClose();
  }
}