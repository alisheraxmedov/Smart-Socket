import 'package:flutter/material.dart';

class NoDataImage extends StatelessWidget {
  const NoDataImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/fon/nodata.jpg"),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
