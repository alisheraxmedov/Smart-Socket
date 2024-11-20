import 'package:flutter/material.dart';
import 'package:oldiot/component/color.dart';
import 'package:oldiot/component/room_items.dart';
import 'package:oldiot/widget/text.dart';

class BasicHomePart extends StatelessWidget {
  final double width;
  final String data;
  final int index;
  final void Function()? onTap;
  const BasicHomePart({
    super.key,
    required this.width,
    required this.data,
    required this.index,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
              data: data,
              size: width * .05,
              weight: FontWeight.bold,
            ),
            Container(
              height: width * .15,
              width: width * .15,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorsClass.primaryBlack,
                image: DecorationImage(
                  image: AssetImage(
                    RoomItems.image[index],
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            TextWidget(
              data: "Qurilmalar: ${RoomItems.device[index]}",
              size: width * .03,
              weight: FontWeight.bold,
            ),
          ],
        ),
      ),
    );
  }
}
