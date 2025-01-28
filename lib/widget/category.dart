import 'package:flutter/material.dart';
import 'package:oldiot/component/color.dart';
import 'package:oldiot/service/provider/provider.dart';
import 'package:oldiot/widget/text.dart';
import 'package:provider/provider.dart';

class BasicPart extends StatelessWidget {
  final double width;
  final String data;
  final IconData? icon;
  final void Function()? onTap;
  const BasicPart({
    super.key,
    required this.width,
    required this.data,
    required this.icon,
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
              size: width * .04,
            ),
            Container(
              height: width * .15,
              width: width * .15,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: ColorsClass.white,
              ),
              child: Icon(
                icon,
                color: ColorsClass.primaryBlack,
                size: width * .1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BasicPartButton extends StatelessWidget {
  final double width;
  final String data;
  final IconData? icon;
  final void Function()? onTap;
  const BasicPartButton({
    super.key,
    required this.width,
    required this.data,
    required this.icon,
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
              size: width * .04,
            ),
            Container(
              height: width * .15,
              width: width * .15,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Provider.of<ProviderClass>(context, listen: false)
                            .realtimeData["rele"] ==
                        1
                    ? ColorsClass.white
                    : ColorsClass.blue,
              ),
              child: Icon(
                icon,
                color: Provider.of<ProviderClass>(context, listen: false)
                            .realtimeData["rele"] ==
                        0
                    ? ColorsClass.primaryBlack
                    : ColorsClass.white,
                size: width * .1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
