import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget(
      {super.key,
      this.height = 48,
      this.placeholder,
      this.helperText,
      this.isPassword = false,
      this.readOnly = false,
      this.enabled,
      this.capitalization = TextCapitalization.sentences,
      this.keyboardType = TextInputType.text,
      this.prefixIcon,
      this.suffixIcon,
      this.formatters,
      this.onChanged,
      this.onSubmitted,
      this.onPressed,
      this.error,
      this.isDense,
      this.maxLines = 1,
      this.contentPadding =
          const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      this.controller});
  final double height;
  final String? placeholder;
  final String? helperText;
  final TextEditingController? controller;
  final bool isPassword;
  final bool readOnly;
  final bool? enabled;
  final TextCapitalization capitalization;
  final String? error;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final List<TextInputFormatter>? formatters;
  final TextInputType keyboardType;
  final Function(String? value)? onChanged;
  final Function(String? value)? onSubmitted;

  final Function()? onPressed;
  final bool? isDense;
  final EdgeInsets? contentPadding;
  final int maxLines;
  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  bool _showPassword = false;

  @override
  void initState() {
    super.initState();
    _showPassword = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: TextField(
        maxLines: widget.maxLines,
        enabled: widget.enabled,
        controller: widget.controller,
        obscureText: !widget.isPassword ? false : _showPassword,
        keyboardType: widget.keyboardType,
        inputFormatters: widget.formatters,
        onChanged: widget.onChanged,
        readOnly: widget.readOnly,
        textCapitalization: widget.capitalization,
        onSubmitted: widget.onSubmitted,
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none),
            filled: true,
            fillColor: Colors.grey.withOpacity(0.3),
            isDense: widget.isDense,
            contentPadding: widget.contentPadding,
            helperText: widget.helperText,
            errorText: widget.error,
            hintText: widget.placeholder,
            prefixIcon: widget.prefixIcon,
            prefixIconColor: Colors.grey,
            suffixIcon: !widget.isPassword
                ? widget.suffixIcon
                : IconButton(
                    onPressed: () {
                      setState(() => _showPassword = !_showPassword);
                    },
                    icon: Icon(
                      _showPassword ? Icons.visibility_off : Icons.visibility,
                    ))),
      ),
    );
  }
}
