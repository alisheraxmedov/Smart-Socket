import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oldiot/component/color.dart';
import 'package:oldiot/service/provider/provider.dart';
import 'package:oldiot/widget/text.dart';
import 'package:provider/provider.dart';

class SettingContainer extends StatelessWidget {
  final double width;
  final String title;
  final DatabaseReference reference;
  const SettingContainer({
    super.key,
    required this.width,
    required this.title,
    required this.reference,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * .1,
        vertical: width * .05,
      ),
      child: Container(
        height: width * .4,
        width: width,
        decoration: BoxDecoration(
          color: ColorsClass.primaryBlack2,
          borderRadius: BorderRadius.circular(width * .05),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.07),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.report_problem_outlined,
                    color: ColorsClass.yellow,
                    size: width * 0.1,
                  ),
                  TextWidget(
                    align: TextAlign.start,
                    data:
                        "Iltimos, faslga qarab qurilmani tanlang. Agar qish\nmavsumida bo'lsangiz istgichni, yoz mavsumida\nbo'lsangiz sovutgichni tanlang!",
                    size: width * 0.02,
                  ),
                ],
              ),
            ),
            TextWidget(
              data: title,
              size: width * .05,
              weight: FontWeight.bold,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    reference.child("Condition").update({
                      "sovuq":
                          Provider.of<ProviderClass>(context, listen: false)
                                      .realtimeData["Condition"]["sovuq"] ==
                                  0
                              ? 1
                              : 0,
                      "issiq": 0,
                    });
                  },
                  child: Container(
                    height: width * .1,
                    width: width * .3,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Provider.of<ProviderClass>(context, listen: false)
                                  .realtimeData["Condition"]["sovuq"] ==
                              0
                          ? ColorsClass.primaryBlack
                          : ColorsClass.blue,
                      border: Border.all(
                        width: 1.0,
                        color: ColorsClass.white,
                      ),
                      borderRadius: BorderRadius.circular(
                        width * 0.035,
                      ),
                    ),
                    child: TextWidget(
                      data: "Sovutgich",
                      size: width * .04,
                      weight: FontWeight.bold,
                      color: ColorsClass.white,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    reference.child("Condition").update({
                      "issiq":
                          Provider.of<ProviderClass>(context, listen: false)
                                      .realtimeData["Condition"]["issiq"] ==
                                  0
                              ? 1
                              : 0,
                      "sovuq": 0,
                    });
                  },
                  child: Container(
                    height: width * .1,
                    width: width * .3,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Provider.of<ProviderClass>(context, listen: false)
                                  .realtimeData["Condition"]["issiq"] ==
                              0
                          ? ColorsClass.primaryBlack
                          : ColorsClass.blue,
                      border: Border.all(
                        width: 1.0,
                        color: ColorsClass.white,
                      ),
                      borderRadius: BorderRadius.circular(
                        width * 0.035,
                      ),
                    ),
                    child: TextWidget(
                      data: "Isitgich",
                      size: width * .05,
                      weight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SettingContainer2 extends StatelessWidget {
  final double width;
  final String title;
  final DatabaseReference reference;
  const SettingContainer2({
    super.key,
    required this.width,
    required this.title,
    required this.reference,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController temperaturaController = TextEditingController();
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * .1,
        vertical: width * .05,
      ),
      child: Container(
        height: width * .45,
        width: width,
        decoration: BoxDecoration(
          color: ColorsClass.primaryBlack2,
          borderRadius: BorderRadius.circular(width * .05),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.07),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.report_problem_outlined,
                    color: ColorsClass.yellow,
                    size: width * 0.1,
                  ),
                  TextWidget(
                    align: TextAlign.start,
                    data:
                        "Bu yerda ko'rsatilgan temperaturani o'zgartirish\norqali siz hona haroratini o'zgartirishingiz mumkin!\nYuqoridagi tanlangan qurilmani inobatga oling!",
                    size: width * 0.02,
                  ),
                ],
              ),
            ),
            TextWidget(
              data: title,
              size: width * .045,
              weight: FontWeight.bold,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    reference.child("DHT11").update({
                      "savedTemperature":
                          Provider.of<ProviderClass>(context, listen: false)
                                  .realtimeData["DHT11"]["savedTemperature"] -
                              1
                    });
                  },
                  icon: Icon(
                    Icons.arrow_left,
                    color: ColorsClass.white,
                    size: width * 0.2,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 40.0,
                  width: 100.0,
                  color: ColorsClass.white,
                  child: TextField(
                    controller: temperaturaController,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    onTapOutside: (event) {
                      reference.child("DHT11").update({
                        "savedTemperature": double.parse(
                          temperaturaController.text,
                        ),
                      });
                      FocusScope.of(context).unfocus();
                    },
                    onSubmitted: (value) {
                      reference.child("DHT11").update({
                        "savedTemperature": double.parse(
                          temperaturaController.text,
                        ),
                      });
                      FocusScope.of(context).unfocus();
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                    ],
                    // maxLength: 5,
                    style: TextStyle(
                      color: ColorsClass.primaryBlack,
                      fontSize: width * .05,
                    ),
                    decoration: InputDecoration(
                        fillColor: ColorsClass.white,
                        border: InputBorder.none,
                        hintStyle: const TextStyle(
                          color: ColorsClass.primaryBlack,
                          fontWeight: FontWeight.bold,
                        ),
                        hintText:
                            "${Provider.of<ProviderClass>(context, listen: false).realtimeData["DHT11"]["savedTemperature"]}"),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    reference.child("DHT11").update({
                      "savedTemperature":
                          Provider.of<ProviderClass>(context, listen: false)
                                  .realtimeData["DHT11"]["savedTemperature"] +
                              1
                    });
                  },
                  icon: Icon(
                    Icons.arrow_right,
                    color: ColorsClass.white,
                    size: width * 0.2,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
