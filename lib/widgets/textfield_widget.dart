import 'package:flutter/material.dart';
import 'package:travel_app/config/constants.dart';

class TextfieldWidget extends StatefulWidget {
  final String? labelTitle;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final ValueChanged? valueChanged;
  final Widget? icon;
  final TextStyle? hintTextStyle;
  final InputDecoration? decoration;
  final bool obscureText;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final bool enable;
  final String? hintText;
  final int? maxLines;
  final int? minLines;
  final String counterText;
  final Function(String)? onChanged;
  final Function()? onTap;
  final TextAlign? textAlign;
  final bool isEmpty;
  final bool isPassword;

  const TextfieldWidget({
    super.key,
    this.labelTitle,
    this.controller,
    this.keyboardType,
    this.textCapitalization = TextCapitalization.none,
    this.valueChanged,
    this.textInputAction = TextInputAction.next,
    this.focusNode,
    this.icon,
    this.isEmpty = false,
    this.hintTextStyle,
    this.decoration,
    this.enable = true,
    this.obscureText = false,
    this.maxLines = 1,
    this.minLines = 1,
    this.hintText = '',
    this.counterText = '',
    this.onChanged,
    this.onTap,
    this.textAlign = TextAlign.start,
    this.isPassword = false,
  });

  @override
  State<TextfieldWidget> createState() => _TextfieldWidgetState();
}

class _TextfieldWidgetState extends State<TextfieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        labelStyle: TextStyle(fontFamily: Fonts.medium),
        labelText: widget.labelTitle,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.textFieldBorder, width: 2.0),
        ),
        suffixIcon: widget.isPassword ? widget.icon : null,
      ),
      controller: widget.controller,
      obscureText: widget.isPassword ? true : false,
    );
  }
}
