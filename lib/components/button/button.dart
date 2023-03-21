import 'package:brain_heart/schemata/color_schema.dart';
import 'package:flutter/material.dart';
import 'package:brain_heart/schemata/text_style.dart';

enum ButtonType { enable, disable, progress }

class Button extends StatelessWidget {
  final ButtonType buttonType;
  final double height;
  final String title;
  final Function()? onTap;
  final List<BoxShadow>? boxshadow;
  final Color? backgroundColor;
  const Button({
    Key? key,
    this.buttonType = ButtonType.disable,
    this.onTap,
    this.backgroundColor,
    this.title = "",
    this.height = 54,
    this.boxshadow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color background = ColorSchema.dark1.withOpacity(0.2);
    switch (buttonType) {
      case ButtonType.enable:
        {
          background = ColorSchema.primaryColor;
        }
        break;
      case ButtonType.disable:
        {
          background = ColorSchema.dark1.withOpacity(0.2);
        }
        break;
      case ButtonType.progress:
        break;
    }
    return Material(
      elevation: 0,
      borderRadius: BorderRadius.circular(50),
      color: backgroundColor ?? background,
      shadowColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        onTap: () {
          if (onTap != null) {
            onTap!();
          }
        },
        child: Container(
          height: height,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.transparent),
          child: Center(
            child: Text(
              title,
              style:
                  const TextStyle().medium16.textColor(ColorSchema.whiteColor),
            ),
          ),
        ),
      ),
    );
  }
}
