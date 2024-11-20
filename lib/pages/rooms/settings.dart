import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:oldiot/component/color.dart';
import 'package:oldiot/service/provider/provider.dart';
import 'package:oldiot/widget/private/setting_container.dart';
import 'package:oldiot/widget/text.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  static const String routeName = "/settings";
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final reference = FirebaseDatabase.instance.ref("ESP32");
    final double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsClass.blue,
        centerTitle: true,
        title: TextWidget(
          data: "Sozlamalar",
          size: width * 0.08,
        ),
      ),
      body: StreamBuilder(
        stream: reference.onValue,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Container(
            height: double.infinity,
            width: width,
            decoration: const BoxDecoration(
              color: ColorsClass.white,
              image: DecorationImage(
                image: AssetImage(
                  "assets/fon/settings.jpg",
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                SettingContainer(
                  width: width,
                  title: "Ulagan qurilmani tanlang",
                  reference: reference,
                ),
                //===================================================================================
                SettingContainer2(
                  width: width,
                  reference: reference,
                  title: "Temperaturani qo'lda kiritish",
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: GestureDetector(
          onTap: () {
            if (Provider.of<ProviderClass>(context, listen: false)
                    .realtimeData["DHT11"]["temperature"] <
                Provider.of<ProviderClass>(context, listen: false)
                    .realtimeData["DHT11"]["savedTemperature"]) {
              reference.update({
                "rele": 0,
              });
            } else {
              reference.update({
                "rele": 1,
              });
            }
            Navigator.pop(context);
          },
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.1,
            ),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(width * 0.05),
                color: ColorsClass.primaryBlack,
              ),
              height: width * 0.2,
              width: width * width,
              child: TextWidget(
                data: "Tadbiq qilish",
                size: width * 0.07,
                weight: FontWeight.bold,
              ),
            ),
          ),
        ),
    );
  }
}


//https://youtu.be/GLHWEQzD3E0