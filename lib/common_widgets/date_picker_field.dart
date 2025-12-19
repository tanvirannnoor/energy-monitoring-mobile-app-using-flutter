import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePickerField extends StatelessWidget {
  final String label;
  final DateTime? date;
  final VoidCallback onTap;

  const DatePickerField({
    super.key,
    required this.label,
    required this.date,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[300]!),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            const Icon(Icons.calendar_today, color: Color(0xFF1E88E5), size: 20),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                date != null ? DateFormat('dd/MM/yyyy').format(date!) : label,
                style: TextStyle(
                  fontSize: 15,
                  color: date != null ? Colors.black : Colors.grey[600],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}