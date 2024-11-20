import 'package:flutter/material.dart';
import 'package:oldiot/pages/home.dart';
import 'package:oldiot/pages/rooms/mehmonxona.dart';
import 'package:oldiot/pages/rooms/oshxona.dart';
import 'package:oldiot/pages/rooms/settings.dart';
import 'package:oldiot/pages/rooms/vannaxona.dart';
import 'package:oldiot/pages/rooms/xojatxona.dart';
import 'package:oldiot/pages/rooms/yotoqxona.dart';
import 'package:oldiot/pages/splash.dart';

Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      );
    case MehmonxonaScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const MehmonxonaScreen(),
      );
    case YotoqxonaScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const YotoqxonaScreen(),
      );
    case OshxonaScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const OshxonaScreen(),
      );
    case VannaxonaScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const VannaxonaScreen(),
      );
    case XojatxonaScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const XojatxonaScreen(),
      );
    case SettingsScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const SettingsScreen(),
      );
    case SplashScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const SplashScreen(),
      );
    // case AuthGate.routeName:
    //   return MaterialPageRoute(
    //     builder: (context) => const AuthGate(),
    //   );
    // case Home.routeName:
    //   return MaterialPageRoute(
    //     builder: (context) => const Home(),
    //   );
    // case WifiConfigPage.routeName:
    //   return MaterialPageRoute(
    //     builder: (context) => const WifiConfigPage(),
    //   );
    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(
          backgroundColor: Colors.red,
          body: Center(
            child: Text("Not Found"),
          ),
        ),
      );
  }
}
