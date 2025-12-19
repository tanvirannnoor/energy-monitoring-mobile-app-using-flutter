import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/data_controller.dart';
import '../common_widgets/custom_app_bar.dart';
import '../common_widgets/gauge_chart.dart';
import '../common_widgets/toggle_switch.dart';
import '../common_widgets/custom_button.dart';
import '../common_widgets/date_picker_field.dart';
import '../common_widgets/data_list_tile.dart';
import '../routes/app_routes.dart';

class DataViewScreen extends StatelessWidget {
  final DataController controller = Get.find();

  DataViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Data View'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Obx(() => ToggleSwitch(
              option1: 'Data View',
              option2: 'Revenue View',
              isOption1Selected: controller.isDataView.value,
              onToggle: () {
                controller.toggleView();
                Get.offNamed(AppRoutes.REVENUE_VIEW);
              },
            )),
            const SizedBox(height: 24),
            GaugeChart(
              value: 2.5,
              maxValue: 5.0,
              unit: 'kWh/Sqft',
              label: 'Energy Consumption',
              isHalfCircle: true,
            ),
            const SizedBox(height: 24),
            Obx(() => ToggleSwitch(
              option1: 'Today Data',
              option2: 'Custom Date Data',
              isOption1Selected: controller.isTodayData.value,
              onToggle: controller.toggleDateType,
            )),
            const SizedBox(height: 16),
            Obx(() => !controller.isTodayData.value
                ? Column(
                    children: [
                      DatePickerField(
                        label: 'From Date',
                        date: controller.fromDate.value,
                        onTap: () => controller.selectFromDate(context),
                      ),
                      const SizedBox(height: 12),
                      DatePickerField(
                        label: 'To Date',
                        date: controller.toDate.value,
                        onTap: () => controller.selectToDate(context),
                      ),
                      const SizedBox(height: 16),
                      CustomButton(
                        text: 'Search',
                        onPressed: controller.searchData,
                      ),
                      const SizedBox(height: 24),
                    ],
                  )
                : const SizedBox(height: 24)),
            _buildEnergyChart(),
            const SizedBox(height: 24),
            _buildDataBreakdown(),
          ],
        ),
      ),
    );
  }

  Widget _buildEnergyChart() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Energy Chart',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Total Energy:', style: TextStyle(fontSize: 14)),
              const Text('5.53 kW', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            height: 150,
            decoration: BoxDecoration(
              color: const Color(0xFF1E88E5).withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                'Chart Placeholder',
                style: TextStyle(color: Colors.grey[600]),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDataBreakdown() {
    final dataItems = [
      {'label': 'Data A', 'value': '1.25 kW', 'percentage': 22.6, 'cost': 1250},
      {'label': 'Data B', 'value': '1.85 kW', 'percentage': 33.5, 'cost': 1850},
      {'label': 'Data C', 'value': '1.43 kW', 'percentage': 25.9, 'cost': 1430},
      {'label': 'Data D', 'value': '1.00 kW', 'percentage': 18.0, 'cost': 1000},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Data Breakdown',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 12),
        ...dataItems.map((item) => DataListTile(
          label: item['label'] as String,
          value: item['value'] as String,
          percentage: item['percentage'] as double,
          cost: item['cost'] as int,
        )),
      ],
    );
  }
}