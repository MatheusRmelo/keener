import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget(
      {super.key,
      this.isLoading = false,
      this.isDisabled = false,
      this.canHaveWidthNull = false,
      this.width,
      this.height = 40,
      this.margin,
      this.padding,
      this.icon,
      this.backgroundColor,
      this.textColor = Colors.white,
      this.variant = ButtonWidgetVariant.solid,
      required this.title,
      required this.onPressed});
  final bool isLoading;
  final bool isDisabled;
  final String title;
  final bool canHaveWidthNull;
  final double? width;
  final double? height;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final IconData? icon;
  final Color textColor;
  final Color? backgroundColor;
  final ButtonWidgetVariant variant;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? (canHaveWidthNull ? null : double.infinity),
      height: height,
      margin: margin ?? const EdgeInsets.symmetric(vertical: 24),
      child: variant == ButtonWidgetVariant.solid
          ? ElevatedButton(
              onPressed: isLoading || isDisabled ? null : onPressed,
              style: ElevatedButton.styleFrom(
                  padding: padding,
                  elevation: 0,
                  backgroundColor:
                      backgroundColor ?? Theme.of(context).primaryColor,
                  disabledMouseCursor: SystemMouseCursors.forbidden,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16))),
              child: isLoading
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            width: 24,
                            height: 24,
                            margin: const EdgeInsets.only(right: 8),
                            child: const CircularProgressIndicator(
                              color: Colors.white,
                            )),
                        const Text("Carregando...",
                            style: TextStyle(color: Colors.white))
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (icon != null)
                          Container(
                            margin: const EdgeInsets.only(right: 8),
                            child: Icon(
                              icon,
                              size: 24,
                              color: textColor,
                            ),
                          ),
                        Text(
                          title.toUpperCase(),
                          style: TextStyle(
                              color: textColor, fontWeight: FontWeight.bold),
                        )
                      ],
                    ))
          : OutlinedButton(
              onPressed: isLoading || isDisabled ? null : onPressed,
              style: OutlinedButton.styleFrom(
                  foregroundColor: backgroundColor,
                  side: BorderSide(
                      color: backgroundColor ?? Theme.of(context).primaryColor),
                  enabledMouseCursor: SystemMouseCursors.click,
                  disabledMouseCursor: SystemMouseCursors.forbidden,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16))),
              child: isLoading
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            width: 24,
                            height: 24,
                            margin: const EdgeInsets.only(right: 8),
                            child: CircularProgressIndicator(
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.6),
                            )),
                        Text("Carregando...",
                            style: TextStyle(
                                color: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.6)))
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (icon != null)
                          Container(
                            margin: const EdgeInsets.only(right: 8),
                            child: Icon(
                              icon,
                              size: 24,
                              color: backgroundColor,
                            ),
                          ),
                        Text(
                          title.toUpperCase(),
                          style: TextStyle(color: backgroundColor),
                        )
                      ],
                    )),
    );
  }
}

enum ButtonWidgetVariant { solid, outlined }
