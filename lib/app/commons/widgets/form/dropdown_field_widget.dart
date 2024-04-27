import 'package:flutter/material.dart';

class DropdownFieldWidget<T> extends StatelessWidget {
  const DropdownFieldWidget(
      {super.key,
      required this.items,
      required this.onChanged,
      this.value,
      this.height = 48,
      this.placeholder});

  final String? placeholder;
  final List<DropdownMenuItem<T>> items;
  final T? value;
  final ValueChanged<T?> onChanged;
  final double height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: DropdownButtonFormField<T>(
          value: value,
          itemHeight: height,
          padding: EdgeInsets.zero,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            hintText: placeholder,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none),
            filled: true,
            fillColor: Colors.grey.withOpacity(0.3),
          ),
          items: items,
          onChanged: onChanged),
    );
  }
}
