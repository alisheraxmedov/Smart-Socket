import 'package:flutter/material.dart';
import 'package:oldiot/component/color.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsClass.black,
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: ColorsClass.blue,
            ),
          ),
          Expanded(
            child: Container(
              color: ColorsClass.red,
            ),
          ),
        ],
      ),
    );
  }
}
