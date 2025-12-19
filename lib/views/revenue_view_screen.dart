import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/revenue_controller.dart';
import '../controllers/data_controller.dart';
import '../common_widgets/custom_app_bar.dart';
import '../routes/app_routes.dart';

class RevenueViewScreen extends StatelessWidget {
  final RevenueController controller = Get.find();
  final DataController dataController = Get.put(DataController());

  RevenueViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Ensure Revenue View is highlighted when this screen loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (dataController.isDataView.value) {
        dataController.toggleView();
      }
    });

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
            _buildDataCostInfoCard(),
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
                  if (!dataController.isDataView.value) {
                    dataController.toggleView();
                  }
                  Get.offNamed(AppRoutes.DATA_VIEW);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color:
                        dataController.isDataView.value
                            ? const Color(0xFF2196F3)
                            : Colors.transparent,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        dataController.isDataView.value
                            ? Icons.radio_button_checked
                            : Icons.radio_button_unchecked,
                        size: 20,
                        color:
                            dataController.isDataView.value
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
                              dataController.isDataView.value
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
                  // Already on Revenue View, no action needed
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color:
                        !dataController.isDataView.value
                            ? const Color(0xFF2196F3)
                            : Colors.transparent,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        !dataController.isDataView.value
                            ? Icons.radio_button_checked
                            : Icons.radio_button_unchecked,
                        size: 20,
                        color:
                            !dataController.isDataView.value
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
                              !dataController.isDataView.value
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
                  painter: GaugeForegroundPainter(
                    value: 8897455,
                    maxValue: 10000000,
                  ),
                ),
                // Center text
                Positioned(
                  bottom: 20,
                  child: Column(
                    children: [
                      const Text(
                        '8897455',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      Text(
                        'tk',
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

  Widget _buildDataCostInfoCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[300]!, width: 1),
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
          // Header with toggle
          InkWell(
            onTap: controller.toggleExpanded,
            borderRadius: BorderRadius.circular(16),
            child: Obx(
              () => Container(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    const Icon(
                      Icons.bar_chart_rounded,
                      color: Color(0xFF2196F3),
                      size: 22,
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'Data & Cost Info',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: Color(0xFF2196F3),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        controller.isExpanded.value
                            ? Icons.keyboard_arrow_up_rounded
                            : Icons.keyboard_arrow_down_rounded,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Expandable content
          Obx(
            () => AnimatedCrossFade(
              firstChild: const SizedBox.shrink(),
              secondChild: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: Column(
                  children: [
                    _buildDataItem(
                      'Data 1',
                      'Cost 1',
                      '2798.50 (29.53%)',
                      '35689 ৳',
                    ),
                    const SizedBox(height: 16),
                    _buildDataItem(
                      'Data 2',
                      'Cost 2',
                      '2798.50 (29.53%)',
                      '35689 ৳',
                    ),
                    const SizedBox(height: 16),
                    _buildDataItem(
                      'Data 3',
                      'Cost 3',
                      '2798.50 (29.53%)',
                      '35689 ৳',
                    ),
                    const SizedBox(height: 16),
                    _buildDataItem(
                      'Data 4',
                      'Cost 4',
                      '2798.50 (29.53%)',
                      '35689 ৳',
                    ),
                  ],
                ),
              ),
              crossFadeState:
                  controller.isExpanded.value
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
              duration: const Duration(milliseconds: 300),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDataItem(
    String dataLabel,
    String costLabel1,
    String data,
    String costLabel2,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          dataLabel,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 6),
        Row(
          children: [
            Text(
              costLabel1,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(width: 4),
            const Text(
              ':',
              style: TextStyle(fontSize: 13, color: Colors.black54),
            ),
            const SizedBox(width: 6),
            Text(
              data,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            Text(
              costLabel1,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(width: 4),
            const Text(
              ':',
              style: TextStyle(fontSize: 13, color: Colors.black54),
            ),
            const SizedBox(width: 6),
            Text(
              costLabel2,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ],
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
