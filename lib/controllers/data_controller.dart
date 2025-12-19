import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DataController extends GetxController {
  final isDataView = true.obs;
  final isTodayData = true.obs;
  final fromDate = Rx<DateTime?>(null);
  final toDate = Rx<DateTime?>(null);

  void toggleView() {
    isDataView.value = !isDataView.value;
  }

  void toggleDateType() {
    isTodayData.value = !isTodayData.value;
  }

  Future<void> selectFromDate(BuildContext context) async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );
    if (date != null) {
      fromDate.value = date;
    }
  }

  Future<void> selectToDate(BuildContext context) async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: fromDate.value ?? DateTime(2020),
      lastDate: DateTime.now(),
    );
    if (date != null) {
      toDate.value = date;
    }
  }

  void searchData() {
    Get.snackbar('Info', 'Search functionality - UI only');
  }
}