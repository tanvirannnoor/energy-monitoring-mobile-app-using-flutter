import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/revenue_controller.dart';
import '../common_widgets/custom_app_bar.dart';
import '../common_widgets/gauge_chart.dart';
import '../common_widgets/expandable_card.dart';

class RevenueViewScreen extends StatelessWidget {
  final RevenueController controller = Get.find();

  RevenueViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Revenue View'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            GaugeChart(
              value: 8897455,
              maxValue: 10000000,
              unit: 'tk',
              label: 'Total Revenue',
              isHalfCircle: true,
            ),
            const SizedBox(height: 24),
            Obx(() => ExpandableCard(
              title: 'Data & Cost Info',
              isExpanded: controller.isExpanded.value,
              onToggle: controller.toggleExpanded,
              children: [
                _buildInfoRow('Data 1', '1250 tk'),
                _buildInfoRow('Data 2', '1850 tk'),
                _buildInfoRow('Data 3', '1430 tk'),
                _buildInfoRow('Data 4', '1000 tk'),
              ],
            )),
            const SizedBox(height: 16),
            _buildRevenueBreakdown(),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontSize: 14)),
          Text(value, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }

  Widget _buildRevenueBreakdown() {
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
            'Revenue Summary',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 16),
          _buildSummaryRow('Monthly Revenue', '৳ 2,500,000'),
          _buildSummaryRow('Yearly Revenue', '৳ 30,000,000'),
          _buildSummaryRow('Growth Rate', '+15.2%'),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(color: Colors.grey[600])),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}