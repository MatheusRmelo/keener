import 'package:flutter/material.dart';

class DetailItemWidget extends StatelessWidget {
  const DetailItemWidget({super.key, required this.label, required this.value});
  final String label;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: const TextStyle(
                fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          value,
          style: const TextStyle(fontSize: 12, color: Colors.white),
        ),
      ],
    );
  }
}
