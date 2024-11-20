import 'package:flutter/material.dart';
import 'package:oldiot/component/color.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = "/splash";
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: ColorsClass.white,
      body: SizedBox(
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Hello",
              style: TextStyle(
                color: ColorsClass.blue,
                fontWeight: FontWeight.bold,
                fontSize: width * .3,
              ),
            )
          ],
        ),
      ),
    );
  }
}
