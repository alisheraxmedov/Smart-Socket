import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oldiot/component/color.dart';

class TextWidget extends StatelessWidget {
  final double size;
  final String data;
  final FontWeight weight;
  final Color color;
  final double spacing;
  final TextAlign align;
  const TextWidget(
      {super.key,
      required this.data,
      required this.size,
      this.weight = FontWeight.normal,
      this.color = ColorsClass.white,
      this.spacing = 0,
      this.align = TextAlign.center});

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: align,
      data,
      style: GoogleFonts.playfairDisplay(
        letterSpacing: spacing,
        color: color,
        fontSize: size,
        fontWeight: weight,
      ),
      // TextStyle(
      // letterSpacing: spacing,
      // color: color,
      // fontSize: size,
      // fontWeight: weight,
      // ),
    );
  }
}
