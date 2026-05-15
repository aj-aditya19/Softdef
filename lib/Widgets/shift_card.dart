import 'package:flutter/material.dart';
import 'package:test_ui/ViewModels/schedule_viewmodel.dart';

class ShiftCard extends StatelessWidget {
  final StaffShift shift;
  final bool isYellow;
  final double left;
  final double width;

  const ShiftCard({
    super.key,
    required this.shift,
    required this.isYellow,
    required this.left,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    final bgColor = isYellow
        ? const Color(0xFFFFF3CD)
        : const Color(0xFFD4F4E8);
    final textColor = isYellow
        ? const Color(0xFFB78103)
        : const Color(0xFF2D7D57);

    return Positioned(
      left: left,
      top: 6,
      width: width,
      height: 44.0 - 12,
      child: Container(
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(6),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            Text(
              shift.duration,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: textColor,
              ),
            ),
            const Spacer(),
            Text(
              shift.name,
              style: const TextStyle(fontSize: 12, color: Color(0xFF333333)),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              width: 1,
              height: 14,
              color: Colors.grey,
            ),
            Text(
              shift.role,
              style: const TextStyle(fontSize: 12, color: Color(0xFF333333)),
            ),
          ],
        ),
      ),
    );
  }
}
