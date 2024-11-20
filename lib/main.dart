import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:oldiot/firebase_options.dart';
import 'package:oldiot/routes.dart';
import 'package:oldiot/service/provider/provider.dart';
import 'package:oldiot/service/themes/theme.dart';
import 'package:provider/provider.dart';

void main() async {
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ProviderClass>(
          create: (_) => ProviderClass(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      theme: themeData(context) ,
      // ThemeData(
      //   appBarTheme: const AppBarTheme(
      //     centerTitle: true,
      //     titleTextStyle: TextStyle(
      //       color: ColorsClass.white,
      //     ),
      //     iconTheme: IconThemeData(
      //       color: ColorsClass.white,
      //     ),
      //   ),
      // ),
      // home: SettingsScreen(),
    );
  }
}
