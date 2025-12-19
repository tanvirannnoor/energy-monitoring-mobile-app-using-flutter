import 'package:get/get.dart';

class RevenueController extends GetxController {
  final isExpanded = false.obs;
  final selectedDataIndex = 0.obs;

  void toggleExpanded() {
    isExpanded.value = !isExpanded.value;
  }

  void selectData(int index) {
    selectedDataIndex.value = index;
  }
}