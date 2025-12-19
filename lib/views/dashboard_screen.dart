import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/dashboard_controller.dart';
import '../common_widgets/custom_app_bar.dart';
import '../common_widgets/gauge_chart.dart';
import '../common_widgets/toggle_switch.dart';

class DashboardScreen extends StatelessWidget {
  final DashboardController controller = Get.find();

  DashboardScreen({super.key});

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
      body: Column(
        children: [
          _buildTabBar(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildElectricitySection(),
                  const SizedBox(height: 16),
                  _buildDataCardsSection(),
                  const SizedBox(height: 16),
                  _buildFeatureGrid(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      color: Colors.white,
      child: Row(
        children: [
          _buildTab('Summary', 0),
          _buildTab('SLD', 1),
          _buildTab('Data', 2),
        ],
      ),
    );
  }

  Widget _buildTab(String title, int index) {
    return Expanded(
      child: Obx(
        () => GestureDetector(
          onTap: () => controller.onTabChange(index),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              color:
                  controller.selectedTab.value == index
                      ? const Color(0xFF2196F3)
                      : Colors.white,
              border: Border(
                bottom: BorderSide(
                  color:
                      controller.selectedTab.value == index
                          ? const Color(0xFF2196F3)
                          : Colors.grey[300]!,
                  width: 2,
                ),
              ),
            ),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color:
                    controller.selectedTab.value == index
                        ? Colors.white
                        : Colors.grey[600],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildElectricitySection() {
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Electricity',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: GaugeChart(
              value: 5.53,
              maxValue: 10.0,
              unit: 'kW',
              label: 'Total Power',
            ),
          ),
          const SizedBox(height: 20),
          Obx(
            () => ToggleSwitch(
              option1: 'Source',
              option2: 'Load',
              isOption1Selected: controller.isSourceSelected.value,
              onToggle: controller.toggleSourceLoad,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDataCardsSection() {
    final cards = [
      {
        'title': 'Data View',
        'data1': '55505.63',
        'data2': '58805.63',
        'active': true,
        'icon': 'assets/icons/dt.png',
        'color': const Color(0xFF64B5F6),
      },
      {
        'title': 'Data Type 2',
        'data1': '55505.63',
        'data2': '58805.63',
        'active': true,
        'icon': 'assets/icons/dt2.png',
        'color': const Color(0xFFFF9800),
      },
      {
        'title': 'Data Type 3',
        'data1': '55505.63',
        'data2': '58805.63',
        'active': false,
        'icon': 'assets/icons/dt3.png',
        'color': const Color(0xFF81C784),
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...cards.asMap().entries.map((entry) {
          final index = entry.key;
          final card = entry.value;
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: _buildDataCard(
              card['title'] as String,
              card['data1'] as String,
              card['data2'] as String,
              card['active'] as bool,
              card['icon'] as String,
              card['color'] as Color,
              index,
            ),
          );
        }),
      ],
    );
  }

  Widget _buildDataCard(
    String title,
    String data1,
    String data2,
    bool isActive,
    String iconPath,
    Color iconColor,
    int index,
  ) {
    return GestureDetector(
      onTap: () => controller.onCardTap(index, isActive),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFF2196F3), width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.asset(
                iconPath,
                width: 32,
                height: 32,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color: iconColor,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        isActive ? '(Active)' : '(Inactive)',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: isActive ? Colors.blue : Colors.red,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                            children: [
                              const TextSpan(
                                text: 'Data 1',
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                              const TextSpan(text: '    : '),
                              TextSpan(
                                text: data1,
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
                  Row(
                    children: [
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                            children: [
                              const TextSpan(
                                text: 'Data 2',
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                              const TextSpan(text: '    : '),
                              TextSpan(
                                text: data2,
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
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: Colors.grey, size: 28),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureGrid() {
    final features = [
      {'title': 'Analysis Pro', 'icon': 'assets/icons/ap.png'},
      {'title': 'G. Generator', 'icon': 'assets/icons/gen.png'},
      {'title': 'Plant Summary', 'icon': 'assets/icons/ps.png'},
      {'title': 'Natural Gas', 'icon': 'assets/icons/ng.png'},
      {'title': 'D. Generator', 'icon': 'assets/icons/gen.png'},
      {'title': 'Water Process', 'icon': 'assets/icons/wp.png'},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 2.2,
      ),
      itemCount: features.length,
      itemBuilder: (context, index) {
        final feature = features[index];
        return GestureDetector(
          onTap: () => controller.onFeatureTap(feature['title'] as String),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF3E0),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Image.asset(
                    feature['icon'] as String,
                    width: 24,
                    height: 24,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    feature['title'] as String,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
