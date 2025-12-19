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
      appBar: CustomAppBar(
        title: 'SCM',
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildElectricitySection(),
            const SizedBox(height: 24),
            _buildDataCardsSection(),
            const SizedBox(height: 24),
            _buildFeatureGrid(),
          ],
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Electricity',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
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
          Obx(() => ToggleSwitch(
            option1: 'Source',
            option2: 'Load',
            isOption1Selected: controller.isSourceSelected.value,
            onToggle: controller.toggleSourceLoad,
          )),
        ],
      ),
    );
  }

  Widget _buildDataCardsSection() {
    final cards = [
      {'title': 'Data View', 'data1': '123', 'data2': '456', 'active': true},
      {'title': 'Data Type 2', 'data1': '789', 'data2': '012', 'active': true},
      {'title': 'Data Type 3', 'data1': '345', 'data2': '678', 'active': false},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Data Overview',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 12),
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
              index,
            ),
          );
        }),
      ],
    );
  }

  Widget _buildDataCard(String title, String data1, String data2, bool isActive, int index) {
    return GestureDetector(
      onTap: () => controller.onCardTap(index, isActive),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFF1E88E5).withOpacity(0.1) : Colors.grey[100],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isActive ? const Color(0xFF1E88E5) : Colors.grey[300]!,
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isActive ? const Color(0xFF1E88E5) : Colors.grey,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.electric_bolt, color: Colors.white, size: 24),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text('Data 1: $data1', style: TextStyle(color: Colors.grey[600])),
                      const SizedBox(width: 16),
                      Text('Data 2: $data2', style: TextStyle(color: Colors.grey[600])),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: isActive ? Colors.green : Colors.grey,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                isActive ? 'Active' : 'Inactive',
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureGrid() {
    final features = [
      {'title': 'Analysis Pro', 'icon': Icons.analytics},
      {'title': 'Plant Summary', 'icon': Icons.factory},
      {'title': 'Diesel Generator', 'icon': Icons.oil_barrel},
      {'title': 'Gas Generator', 'icon': Icons.propane_tank},
      {'title': 'Natural Gas', 'icon': Icons.gas_meter},
      {'title': 'Water Process', 'icon': Icons.water_drop},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Features',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 12),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.5,
          ),
          itemCount: features.length,
          itemBuilder: (context, index) {
            final feature = features[index];
            return Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF1E88E5).withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(feature['icon'] as IconData, size: 32, color: const Color(0xFF1E88E5)),
                  const SizedBox(height: 8),
                  Text(
                    feature['title'] as String,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}