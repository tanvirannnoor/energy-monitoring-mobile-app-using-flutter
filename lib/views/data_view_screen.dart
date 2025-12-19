import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/data_controller.dart';
import '../common_widgets/custom_app_bar.dart';
import '../common_widgets/date_picker_field.dart';
import '../common_widgets/custom_button.dart';
import '../routes/app_routes.dart';

class DataViewScreen extends StatelessWidget {
  final DataController controller = Get.find();

  DataViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8EAF6),
      appBar: CustomAppBar(
        title: 'SCM',
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications_outlined),
                onPressed: () {},
              ),
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildViewToggle(),
            const SizedBox(height: 24),
            _buildGaugeSection(),
            const SizedBox(height: 24),
            _buildDateToggle(),
            const SizedBox(height: 16),
            // Show date pickers and search button when Custom Date Data is selected
            Obx(
              () =>
                  !controller.isTodayData.value
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
                      : const SizedBox(height: 8),
            ),
            _buildEnergyDataCard(),
          ],
        ),
      ),
    );
  }

  Widget _buildViewToggle() {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Obx(
              () => GestureDetector(
                onTap: () {
                  if (!controller.isDataView.value) {
                    controller.toggleView();
                  }
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color:
                        controller.isDataView.value
                            ? const Color(0xFF2196F3)
                            : Colors.transparent,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        controller.isDataView.value
                            ? Icons.radio_button_checked
                            : Icons.radio_button_unchecked,
                        size: 20,
                        color:
                            controller.isDataView.value
                                ? Colors.white
                                : Colors.grey,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Data View',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color:
                              controller.isDataView.value
                                  ? Colors.white
                                  : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Obx(
              () => GestureDetector(
                onTap: () {
                  controller.toggleView();
                  Get.offNamed(AppRoutes.REVENUE_VIEW);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color:
                        !controller.isDataView.value
                            ? const Color(0xFF2196F3)
                            : Colors.transparent,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        !controller.isDataView.value
                            ? Icons.radio_button_checked
                            : Icons.radio_button_unchecked,
                        size: 20,
                        color:
                            !controller.isDataView.value
                                ? Colors.white
                                : Colors.grey,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Revenue View',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color:
                              !controller.isDataView.value
                                  ? Colors.white
                                  : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGaugeSection() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Gauge Chart
          SizedBox(
            height: 150,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Background arc
                CustomPaint(
                  size: const Size(200, 100),
                  painter: GaugeBackgroundPainter(),
                ),
                // Foreground arc
                CustomPaint(
                  size: const Size(200, 100),
                  painter: GaugeForegroundPainter(value: 55.0, maxValue: 100.0),
                ),
                // Center text
                Positioned(
                  bottom: 20,
                  child: Column(
                    children: [
                      const Text(
                        '55.00',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      Text(
                        'kWh/Sqft',
                        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateToggle() {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Obx(
              () => GestureDetector(
                onTap: () {
                  if (!controller.isTodayData.value) {
                    controller.toggleDateType();
                  }
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color:
                        controller.isTodayData.value
                            ? const Color(0xFF2196F3)
                            : Colors.transparent,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.circle,
                        size: 12,
                        color:
                            controller.isTodayData.value
                                ? Colors.white
                                : const Color(0xFF2196F3),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Today Data',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color:
                              controller.isTodayData.value
                                  ? Colors.white
                                  : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Obx(
              () => GestureDetector(
                onTap: controller.toggleDateType,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color:
                        !controller.isTodayData.value
                            ? const Color(0xFF2196F3)
                            : Colors.transparent,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.circle,
                        size: 12,
                        color:
                            !controller.isTodayData.value
                                ? Colors.white
                                : Colors.grey,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Custom Date Data',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color:
                              !controller.isTodayData.value
                                  ? Colors.white
                                  : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEnergyDataCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Energy Chart',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const Text(
                '5.53 kW',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          _buildDataItem(
            'Data A',
            '2798.50 (29.53%)',
            '35689 ৳',
            const Color(0xFF2196F3),
          ),
          const SizedBox(height: 12),
          _buildDataItem(
            'Data B',
            '72598.50 (35.39%)',
            '5259689 ৳',
            const Color(0xFF64B5F6),
          ),
          const SizedBox(height: 12),
          _buildDataItem(
            'Data C',
            '6598.36 (83.90%)',
            '5698756 ৳',
            const Color(0xFF9C27B0),
          ),
          const SizedBox(height: 12),
          _buildDataItem(
            'Data D',
            '6598.26 (36.59%)',
            '356987 ৳',
            const Color(0xFFFF9800),
          ),
        ],
      ),
    );
  }

  Widget _buildDataItem(String label, String data, String cost, Color color) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[300]!, width: 1),
      ),
      child: Row(
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      label,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.black54,
                          ),
                          children: [
                            const TextSpan(
                              text: 'Data',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            const TextSpan(text: '  : '),
                            TextSpan(
                              text: data,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                RichText(
                  text: TextSpan(
                    style: const TextStyle(fontSize: 13, color: Colors.black54),
                    children: [
                      const TextSpan(
                        text: 'Cost',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      const TextSpan(text: '  : '),
                      TextSpan(
                        text: cost,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Custom painter for gauge background
class GaugeBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = const Color(0xFFE3F2FD)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 20
          ..strokeCap = StrokeCap.round;

    final rect = Rect.fromLTWH(0, 0, size.width, size.height * 2);
    const startAngle = 3.14; // 180 degrees (pi radians)
    const sweepAngle = 3.14; // 180 degrees

    canvas.drawArc(rect, startAngle, sweepAngle, false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Custom painter for gauge foreground
class GaugeForegroundPainter extends CustomPainter {
  final double value;
  final double maxValue;

  GaugeForegroundPainter({required this.value, required this.maxValue});

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..shader = const LinearGradient(
            colors: [Color(0xFF2196F3), Color(0xFF64B5F6)],
          ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
          ..style = PaintingStyle.stroke
          ..strokeWidth = 20
          ..strokeCap = StrokeCap.round;

    final rect = Rect.fromLTWH(0, 0, size.width, size.height * 2);
    const startAngle = 3.14; // 180 degrees
    final sweepAngle = (value / maxValue) * 3.14; // Proportional arc

    canvas.drawArc(rect, startAngle, sweepAngle, false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
