import 'package:flutter/material.dart';

class EmployeeRow extends StatelessWidget {
  final String name;
  final String role;

  const EmployeeRow({super.key, required this.name, required this.role});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(radius: 14, child: Text(name.isNotEmpty ? name[0] : '?')),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
            ),
            Text(
              role,
              style: const TextStyle(fontSize: 11, color: Colors.black54),
            ),
          ],
        ),
      ],
    );
  }
}
