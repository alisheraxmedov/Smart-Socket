import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:oldiot/component/color.dart';
import 'package:oldiot/component/room_items.dart';
import 'package:oldiot/service/provider/provider.dart';
import 'package:oldiot/widget/private/spended_energy.dart';
import 'package:oldiot/widget/room_items.dart';
import 'package:oldiot/widget/text.dart';
import 'package:provider/provider.dart';

class VannaxonaScreen extends StatelessWidget {
  static const String routeName = "/vannaxona";
  const VannaxonaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final reference = FirebaseDatabase.instance.ref("ESP32");
    final double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsClass.blue,
        centerTitle: true,
        title: TextWidget(
          data: "Vannaxona",
          size: width * .08,
          color: ColorsClass.white,
          weight: FontWeight.bold,
        ),
        actions: [
          const Icon(
            Icons.more_vert,
            color: ColorsClass.white,
          ),
          SizedBox(
            width: width * 0.02,
          ),
        ],
      ),
      body: StreamBuilder(
        stream: reference.onValue,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return CustomScrollView(
            slivers: [
//================== (Harorat, Namlik, Soat) ==================
              SliverAppBar(
                backgroundColor: ColorsClass.primaryBlack,
                iconTheme: const IconThemeData(size: 0.0),
                toolbarHeight: width * .4,
                flexibleSpace: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.05,
                    vertical: width * .03,
                  ),
                  child: RoomItemsWidgets(
                    width: width,
                    temperatura:
                        Provider.of<ProviderClass>(context, listen: false)
                            .realtimeData["DHT11"]["temperature"],
                    namlik: Provider.of<ProviderClass>(context, listen: false)
                        .realtimeData["DHT11"]["humidity"],
                  ),
                ),
//================== Bottom qism <rasm> va <text> ==================
                bottom: PreferredSize(
                  preferredSize: Size(width, width * .4),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: width * .067,
                      vertical: width * .04,
                    ),
//================== Sarflangan energiya ==================
                    child: SpendedEnergy(
                      width: width,
                    ),
                  ),
                ),
              ),
//================== Xonaning qurilmalari ==================
              SliverGrid.builder(
                itemCount: RoomItems.vannaxonaDeviceName.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.05,
                      vertical: width * 0.03,
                    ),
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
//================== Xonaning qurilmasining nomi ==================
                          TextWidget(
                            data: RoomItems.vannaxonaDeviceNameUzb[index],
                            size: width * .05,
                            weight: FontWeight.bold,
                          ),
//================== Xonaning qurilmasining iconButtoni ==================
                          GestureDetector(
                            onTap: () {
                              reference.child("Bathroom").update({
                                RoomItems.vannaxonaDeviceName[index]:
                                    Provider.of<ProviderClass>(context,
                                                        listen: false)
                                                    .realtimeData["Bathroom"]
                                                [RoomItems.vannaxonaDeviceName[
                                                    index]] ==
                                            0
                                        ? 1
                                        : 0
                              });
                            },
                            child: Container(
                              height: width * .17,
                              width: width * .17,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Provider.of<ProviderClass>(context,
                                                    listen: false)
                                                .realtimeData["Bathroom"][
                                            RoomItems
                                                .vannaxonaDeviceName[index]] ==
                                        0
                                    ? ColorsClass.white
                                    : ColorsClass.buttonBlue,
                                image: DecorationImage(
                                  image: AssetImage(
                                    RoomItems.vannaxonaDevice[index],
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
//================== Xonaning qurilmasining holati(on/off) ==================
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: width * .03,
                                ),
                                child: TextWidget(
                                  data: context
                                                  .watch<ProviderClass>()
                                                  .realtimeData["Bathroom"][
                                              RoomItems.vannaxonaDeviceName[
                                                  index]] ==
                                          0
                                      ? "O'ch"
                                      : "Yoq",
                                  size: width * .045,
                                  weight: FontWeight.bold,
                                  spacing: 1.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
