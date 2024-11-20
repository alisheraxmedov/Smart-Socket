import 'package:flutter/material.dart';
import 'package:oldiot/component/color.dart';
import 'package:oldiot/widget/private/digital_clock.dart';
import 'package:oldiot/widget/text.dart';

class BeautifulContainer extends StatelessWidget {
  final double width;
  const BeautifulContainer({
    super.key,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: width * .15,
      width: width,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.5,
          color: ColorsClass.primaryBlack,
        ),
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(
            width * .07,
          ),
          topLeft: Radius.circular(
            width * .07,
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              alignment: Alignment.centerLeft,
              height: width * .15,
              decoration: BoxDecoration(
                // color: ColorsClass.red,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    width * .07,
                  ),
                ),
              ),
              child: TextWidget(
                data: " Xonalar",
                size: width * 0.07,
                color: ColorsClass.primaryBlack,
                align: TextAlign.start,
                weight: FontWeight.bold,
                spacing: 1.0,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                color: ColorsClass.primaryBlack2,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    width * .087,
                  ),
                  bottomRight: Radius.circular(
                    width * .067,
                  ),
                ),
              ),
              alignment: Alignment.center,
              height: width * .145,
              child: DigitalClock(width: width),
            ),
          ),
        ],
      ),
    );
  }
}
