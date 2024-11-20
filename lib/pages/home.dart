import 'package:firebase_database/firebase_database.dart';
import 'package:oldiot/pages/aler_dialog.dart';
import 'package:oldiot/pages/no_data.dart';
import 'package:oldiot/pages/rooms/settings.dart';
import 'package:oldiot/widget/text.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'package:oldiot/component/color.dart';
import 'package:oldiot/component/room_items.dart';

import 'package:oldiot/service/provider/provider.dart';

import 'package:oldiot/widget/category.dart';
import 'package:oldiot/widget/private/xona_container.dart';
import 'package:oldiot/widget/room_category.dart';

import 'package:oldiot/pages/rooms/mehmonxona.dart';
import 'package:oldiot/pages/rooms/oshxona.dart';
import 'package:oldiot/pages/rooms/vannaxona.dart';
import 'package:oldiot/pages/rooms/xojatxona.dart';
import 'package:oldiot/pages/rooms/yotoqxona.dart';

List<String> pages = [
  MehmonxonaScreen.routeName,
  YotoqxonaScreen.routeName,
  OshxonaScreen.routeName,
  VannaxonaScreen.routeName,
  XojatxonaScreen.routeName,
];

final _ssidController = TextEditingController();
final _passwordController = TextEditingController();

class HomeScreen extends StatelessWidget {
  static const String routeName = "/";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final reference = FirebaseDatabase.instance.ref("ESP32");
    final double width = MediaQuery.sizeOf(context).width;

    // if (Provider.of<ProviderClass>(context, listen: false).realtimeData["DHT11"]
    //         ["temperature"] >
    //     Provider.of<ProviderClass>(context, listen: false).realtimeData["DHT11"]
    //         ["savedTemperature"]) {
    //   reference.child("DHT11").update({
    //     "rele": 0,
    //   });
    // } else {}

    return Scaffold(
// ************************** AppBar **************************
      appBar: AppBar(
        toolbarHeight: width * .15,
        backgroundColor: ColorsClass.blue,
        centerTitle: true,
        title: TextWidget(
          data: "Xush kelibsiz",
          size: width * 0.08,
        ),
        actions: [
          Icon(
            Icons.notifications,
            size: width * 0.08,
          ),
          SizedBox(
            width: width * 0.05,
          ),
        ],
      ),
      backgroundColor: ColorsClass.white,
      body: StreamBuilder(
        stream: reference.onValue,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            // return const Center(
            //   child: CircularProgressIndicator(),
            // );
            return const NoDataImage();
          }
          Provider.of<ProviderClass>(context, listen: false).getRealtimeData(
              snapshot.data!.snapshot.value as Map<dynamic, dynamic>);
          context.read<ProviderClass>().getRealtimeData(
              snapshot.data!.snapshot.value as Map<dynamic, dynamic>);
//======================= Information passes to Provider =======================
          context.read<ProviderClass>().setWidth(width);
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: width * 0.42,
                backgroundColor: ColorsClass.primaryBlack,
                flexibleSpace: FlexibleSpaceBar(
                  background: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // ************************** Wifiga bog'lanish **************************
                      BasicPart(
                        width: width,
                        data: "Wifi\nbog'lanish",
                        icon: Icons.wifi,
                        onTap: () => showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialogWidget(
                              width: width,
                              ssidController: _ssidController,
                              passwordController: _passwordController,
                            );
                          },
                        ),
                      ),
                      // ************************** Qurilma sozlamalari **************************
                      BasicPart(
                        width: width,
                        data: "Qurilma\nsozlamalari",
                        icon: Icons.offline_bolt_outlined,
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            SettingsScreen.routeName,
                          );
                        },
                      ),
                      // ************************** Qurilma holati(yoniq/o'chiq) **************************

                      BasicPartButton(
                        data: "Qurilma\nholati",
                        width: width,
                        icon: Icons.ad_units,
                        onTap: () {
                          reference.update(
                            {
                              "rele": Provider.of<ProviderClass>(context,
                                              listen: false)
                                          .realtimeData["rele"] ==
                                      1
                                  ? 0
                                  : 1,
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              // ************************** Xonlarar va Soat **************************
              SliverAppBar(
                toolbarHeight: width * .25,
                flexibleSpace: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.05,
                    vertical: width * .03,
                  ),
                  child: BeautifulContainer(width: width),
                ),
              ),
              // ************************** Xonalar **************************
              SliverGrid.builder(
                itemCount: 5,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.05,
                      vertical: width * 0.03,
                    ),
                    child: BasicHomePart(
                      onTap: () {
                        Navigator.pushNamed(context, pages[index]);
                      },
                      width: width,
                      data: RoomItems.name[index],
                      index: index,
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



// class ThreeContainer extends StatelessWidget {
//   const ThreeContainer({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final reference = FirebaseDatabase.instance.ref("ESP32");
//     final double width = MediaQuery.sizeOf(context).width;
//     return StreamBuilder(
//       stream: reference.onValue,
//       builder: (context, snapshot) {
//         if (!snapshot.hasData) {
//           Center(
//             child: TextWidget(
//               data: "Ma'lumot mavjud emas!",
//               size: MediaQuery.sizeOf(context).width * 0.05,
//             ),
//           );
//         }
//         context.read<ProviderClass>().getRealtimeData(
//               snapshot.data!.snapshot.value as Map<dynamic, dynamic>,
//             );
//         return SliverAppBar(
//           expandedHeight: width * 0.42,
//           backgroundColor: ColorsClass.primaryBlack,
//           flexibleSpace: FlexibleSpaceBar(
//             background: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
// // ************************** Wifiga bog'lanish **************************
//                 BasicPart(
//                   width: width,
//                   data: "Wifi\nbog'lanish",
//                   icon: Icons.wifi,
//                   onTap: () {},
//                 ),
// // ************************** Qurilma sozlamalari **************************
//                 BasicPart(
//                   width: width,
//                   data: "Qurilma\nsozlamalari",
//                   icon: Icons.offline_bolt_outlined,
//                   onTap: () {},
//                 ),
// // ************************** Qurilma holati(yoniq/o'chiq) **************************
//                 BasicPart(
//                   data: "Qurilma\nholati",
//                   width: width,
//                   icon: Icons.ad_units,
                  // onTap: () {
                  //   // context.watch<ProviderClass>().realtimeData["rele"];
                  //   print(context.watch<ProviderClass>().realtimeData["rele"]);
                  //   reference.update(
                  //     {
                  //       "rele": 1,
                  //     },
                  //   );
                  // },
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }