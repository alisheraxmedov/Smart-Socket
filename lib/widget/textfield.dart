import 'package:flutter/material.dart';
import 'package:oldiot/component/color.dart';

class TextFormFieldWidget extends StatelessWidget {
  final double width;
  final String text;
  final TextEditingController controller;
  final Widget suffixIcon;
  final Widget prefixIcon;
  final bool obcureText;
  final TextInputType? type;
  const TextFormFieldWidget({
    super.key,
    required this.width,
    required this.text,
    required this.controller,
    required this.type,
    this.suffixIcon = const SizedBox(),
    this.prefixIcon = const SizedBox(),
    this.obcureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: type,
      controller: controller,
      obscureText: obcureText,
      obscuringCharacter: "*",
      decoration: InputDecoration(
        filled: true,
        fillColor: ColorsClass.white,
        border: InputBorder.none,
        hintText: text,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
      ),
    );
  }
}
