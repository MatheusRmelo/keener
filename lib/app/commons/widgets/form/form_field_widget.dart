import 'package:flutter/material.dart';

class FormFieldWidget extends StatelessWidget {
  const FormFieldWidget(
      {super.key,
      this.customLabel,
      this.label,
      this.height = 88,
      this.isLight = false,
      required this.child})
      : assert(label != null || customLabel != null);
  final String? label;
  final Widget child;
  final Widget? customLabel;
  final bool isLight;
  final double height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          customLabel ??
              Text(
                label!,
                style: TextStyle(
                    color: isLight ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
          const SizedBox(height: 8),
          child
        ]));
  }
}
