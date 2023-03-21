// ignore_for_file: library_private_types_in_public_api

import 'package:brain_heart/schemata/color_schema.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import "package:brain_heart/schemata/text_style.dart";

// ignore: prefer_generic_function_type_aliases
typedef OnValidation(String? text);

// ignore: must_be_immutable
class CommonTextField extends StatefulWidget {
  final Function(String text) onChanged;
  final VoidCallback? ontap;
  final VoidCallback? onNextPress;
  final TextEditingController inputController;
  final TextInputAction? inputAction;
  final FocusNode? focusNode;
  final bool? autoFocus;
  final OnValidation? validation;
  final EdgeInsetsGeometry? contentPadding;
  final String? hintText;
  final String? labelText;
  bool? isSecureTextField = false;
  bool? isShowCursor = true;
  final TextInputType? keyboardType;
  final int? maxLine;
  final int? maxLength;
  final TextStyle? hintStyleText;
  final Widget? postfixWid;
  final List<TextInputFormatter>? formatter;
  final TextCapitalization? textCapitalization;
  final Widget? suffixIcon;
  final bool? obscureText;
  final bool? readOnly;

  CommonTextField(
      {Key? key,
      required this.onChanged,
      this.ontap,
      this.focusNode,
      required this.inputController,
      this.onNextPress,
      this.inputAction,
      this.autoFocus,
      this.readOnly = false,
      this.contentPadding,
      this.validation,
      this.hintStyleText,
      this.hintText,
      this.labelText,
      this.isSecureTextField,
      this.keyboardType,
      this.maxLine = 1,
      this.formatter,
      this.maxLength = 1,
      this.isShowCursor,
      this.postfixWid,
      this.textCapitalization,
      this.suffixIcon,
      this.obscureText})
      : super(key: key);

  @override
  _CommonTextFieldState createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: widget.ontap,
      maxLines: widget.maxLine,
      showCursor: widget.isShowCursor,
      cursorColor: ColorSchema.primaryColor,
      // maxLengthEnforcement: MaxLengthEnforcement.enforced,
      textInputAction: widget.inputAction ?? TextInputAction.done,
      focusNode: widget.focusNode,
      readOnly: widget.readOnly ?? false,
      minLines: 1,
      autofocus: widget.autoFocus ?? false,
      controller: widget.inputController,
      obscureText: widget.obscureText ?? false,
      autovalidateMode:
          widget.validation != null ? AutovalidateMode.onUserInteraction : null,
      keyboardType: widget.keyboardType ?? TextInputType.text,
      textCapitalization: widget.textCapitalization ?? TextCapitalization.none,
      inputFormatters: widget.formatter ?? [],

      // textAlignVertical: TextAlignVertical.center,
      // textAlign: TextAlign.center,
      decoration: InputDecoration(
        fillColor: Colors.transparent,
        // prefix: widget.postfixWid,
        prefixIconConstraints:
            const BoxConstraints(maxHeight: 25, maxWidth: 30),
        isDense: true,
        suffixIcon: widget.suffixIcon,
        suffixIconConstraints:
            const BoxConstraints(minHeight: 25, maxWidth: 25),
        constraints: const BoxConstraints(maxHeight: 40, minHeight: 40),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(right: 5),
          child: widget.postfixWid,
        ),
        prefixIconColor: ColorSchema.blackColor,
        iconColor: ColorSchema.blackColor,

        errorMaxLines: 3,
        alignLabelWithHint: false,
        isCollapsed: false,

        labelText: widget.labelText ?? "",
        labelStyle: const TextStyle()
            .normal12
            .textColor(ColorSchema.dark1.withOpacity(0.5)),
        focusedErrorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2),
        ),
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide:
              BorderSide(color: ColorSchema.dark1.withOpacity(0.1), width: 2),
        ),

        contentPadding: const EdgeInsets.only(right: 20, bottom: 10),
        focusedBorder: UnderlineInputBorder(
          borderSide:
              BorderSide(color: ColorSchema.dark1.withOpacity(0.1), width: 2),
        ),
        border: UnderlineInputBorder(
          borderSide:
              BorderSide(color: ColorSchema.dark1.withOpacity(0.1), width: 2),
        ),
        hintText: widget.hintText,
      ),
      onFieldSubmitted: (String text) {
        if (widget.onNextPress != null) {
          widget.onNextPress!();
        }
      },
      validator: (text) {
        return widget.validation!(text!);
      },
      onChanged: widget.onChanged,
    );
  }
}
