import 'dart:async';

import 'package:flutter/material.dart';
import 'package:oldiot/component/color.dart';
import 'package:oldiot/widget/text.dart';

class DigitalClock extends StatefulWidget {
  final double width;
  const DigitalClock({
    super.key,
    required this.width,
  });

  @override
  // ignore: library_private_types_in_public_api
  _DigitalClockState createState() => _DigitalClockState();
}

class _DigitalClockState extends State<DigitalClock> {
  double? indicatorValue;
  Timer? timer;

  String time() {
    return "${DateTime.now().hour < 10 ? "0${DateTime.now().hour}" : DateTime.now().hour}:${DateTime.now().minute < 10 ? "0${DateTime.now().minute}" : DateTime.now().minute}:${DateTime.now().second < 10 ? "0${DateTime.now().second}" : DateTime.now().second} ";
  }

  updateSeconds() {
    timer = Timer.periodic(
        const Duration(seconds: 1),
        (Timer timer) => setState(() {
              indicatorValue = DateTime.now().second / 60;
            }));
  }

  @override
  void initState() {
    super.initState();
    indicatorValue = DateTime.now().second / 60;
    updateSeconds();
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Center(
        child: TextWidget(
          data: time(),
          size: widget.width * .063,
          weight: FontWeight.normal,
          color: ColorsClass.white,
          spacing: 0.0,
        ),
      ),
    );
  }
}
