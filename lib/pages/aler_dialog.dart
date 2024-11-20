import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:oldiot/component/color.dart';
import 'package:oldiot/widget/text.dart';
import 'package:oldiot/widget/textfield.dart';

class AlertDialogWidget extends StatelessWidget {
  final TextEditingController ssidController;
  final TextEditingController passwordController;
  final double width;
  const AlertDialogWidget({
    super.key,
    required this.width,
    required this.ssidController,
    required this.passwordController,
  });

  Future<void> sendWifiCredentials() async {
    String url = 'http://192.168.4.1/';
    Map<String, String> body = {
      'ssid': ssidController.text,
      'password': passwordController.text,
    };

    try {
      await http.post(Uri.parse(url), body: body);
      AlertDialog(
        title: Center(
          child: Icon(
            Icons.done,
            size: width * 0.1,
            color: ColorsClass.blue,
          ),
        ),
      );
    } catch (e) {
      AlertDialog(
        title: Center(
          child: Icon(
            Icons.error_outline,
            size: width * 0.1,
            color: ColorsClass.red,
          ),
        ),
        
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: ColorsClass.primaryBlack,
      title: Center(
        child: TextWidget(
          data: 'SSID and Password',
          size: width * 0.07,
          color: ColorsClass.white,
          weight: FontWeight.bold,
        ),
      ),
      content: SizedBox(
        height: width * 0.55,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextWidget(
                  data: "Wifi tarmog'ining nomi",
                  size: width * 0.05,
                  color: ColorsClass.white,
                ),
              ],
            ),
            SizedBox(height: width * 0.01),
            TextFormFieldWidget(
              type: TextInputType.name,
              width: width,
              text: "SSID name",
              controller: ssidController,
              prefixIcon: const Icon(
                Icons.wifi,
                color: ColorsClass.primaryBlack,
              ),
            ),
            SizedBox(height: width * 0.07),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextWidget(
                  data: "Wifi tarmog'ining paroli",
                  size: width * 0.05,
                  color: ColorsClass.white,
                ),
              ],
            ),
            SizedBox(height: width * 0.01),
            TextFormFieldWidget(
              type: TextInputType.name,
              width: width,
              text: "Password",
              controller: passwordController,
              prefixIcon: const Icon(
                Icons.lock_outline,
                color: ColorsClass.primaryBlack,
              ),
            ),
          ],
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            alignment: Alignment.center,
            height: width * .1,
            width: width * .3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(width * .028),
              color: ColorsClass.red,
            ),
            child: TextWidget(
              data: "Yopish",
              size: width * .05,
              weight: FontWeight.bold,
            ),
          ),
        ),
        GestureDetector(
          onTap: () async {
            await sendWifiCredentials();
            const Center(
              child: CircularProgressIndicator(),
            );
            Navigator.pop(context);
          },
          child: Container(
            alignment: Alignment.center,
            height: width * .1,
            width: width * .2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(width * .025),
              color: ColorsClass.blue,
            ),
            child: TextWidget(
              data: "OK",
              size: width * .05,
              weight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
