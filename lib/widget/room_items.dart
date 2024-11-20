import 'package:flutter/material.dart';
import 'package:oldiot/component/color.dart';
import 'package:oldiot/widget/private/digital_clock.dart';
import 'package:oldiot/widget/text.dart';

class RoomItemsWidgets extends StatelessWidget {
  final double width;
  final double temperatura;
  final double namlik;
  const RoomItemsWidgets({
    super.key,
    required this.width,
    required this.temperatura,
    required this.namlik,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
//================== Temperatura ==================
        Container(
          height: width * .35,
          width: width * .27,
          decoration: BoxDecoration(
            color: ColorsClass.primaryBlack2,
            border: Border.all(
              width: 1.0,
              color: ColorsClass.white,
            ),
            borderRadius: BorderRadius.circular(
              width * .05,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextWidget(
                data: "Harorat",
                size: width * .05,
                color: ColorsClass.white,
              ),
              TextWidget(
                data: "$temperatura C",
                size: width * 0.065,
              ),
            ],
          ),
        ),
//================== Harorat ==================
        Container(
          height: width * .35,
          width: width * .27,
          decoration: BoxDecoration(
            color: ColorsClass.primaryBlack2,
            border: Border.all(
              width: 1.0,
              color: ColorsClass.white,
            ),
            borderRadius: BorderRadius.circular(
              width * .05,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextWidget(
                data: "Namlik",
                size: width * .05,
                color: ColorsClass.white,
              ),
              TextWidget(
                data: "$namlik %",
                size: width * 0.065,
              ),
            ],
          ),
        ),
//================== Soat ==================
        Container(
          height: width * .35,
          width: width * .27,
          decoration: BoxDecoration(
            color: ColorsClass.primaryBlack2,
            border: Border.all(
              width: 1.0,
              color: ColorsClass.white,
            ),
            borderRadius: BorderRadius.circular(
              width * .05,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextWidget(
                data: "Soat",
                size: width * .05,
                color: ColorsClass.white,
              ),
              DigitalClock(width: width),
            ],
          ),
        ),
      ],
    );
  }
}
