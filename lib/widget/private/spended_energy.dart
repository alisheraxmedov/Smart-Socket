import 'package:flutter/material.dart';
import 'package:oldiot/component/color.dart';
import 'package:oldiot/widget/text.dart';

class SpendedEnergy extends StatelessWidget {
  final double width;
  const SpendedEnergy({
    super.key,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        height: width * .3,
        decoration: BoxDecoration(
          color: ColorsClass.white,
          borderRadius: BorderRadius.circular(width * .06),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: SizedBox(
                height: width * .19,
                child: Image.asset(
                  "assets/icons/energy.png",
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: SizedBox(
                height: width * 0.2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      data: "63 kVth",
                      size: width * .07,
                      color: ColorsClass.primaryBlack,
                      weight: FontWeight.bold,
                    ),
                    SizedBox(
                      height: width * .02,
                    ),
                    TextWidget(
                      data: "Bir oyda sarflangan elektor energiyasi",
                      size: width * .027,
                      align: TextAlign.start,
                      color: ColorsClass.primaryBlack2,
                      weight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
