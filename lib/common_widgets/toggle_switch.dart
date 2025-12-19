import 'package:flutter/material.dart';

class ToggleSwitch extends StatelessWidget {
  final String option1;
  final String option2;
  final bool isOption1Selected;
  final VoidCallback onToggle;

  const ToggleSwitch({
    super.key,
    required this.option1,
    required this.option2,
    required this.isOption1Selected,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: isOption1Selected ? null : onToggle,
              child: Container(
                margin: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: isOption1Selected ? const Color(0xFF1E88E5) : Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    option1,
                    style: TextStyle(
                      color: isOption1Selected ? Colors.white : Colors.grey[700],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: isOption1Selected ? onToggle : null,
              child: Container(
                margin: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: !isOption1Selected ? const Color(0xFF1E88E5) : Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    option2,
                    style: TextStyle(
                      color: !isOption1Selected ? Colors.white : Colors.grey[700],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}