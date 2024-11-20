import 'package:flutter/material.dart';

class ProviderClass extends ChangeNotifier {
// ============= data of realtimedatabase =============
  Map<dynamic, dynamic> realtimeData = {};
  void getRealtimeData(Map<dynamic, dynamic> data) {
    realtimeData = data;
    notifyListeners();
  }

// ============= set screen Width =============
  double width = 30.0;
  void setWidth(double value) {
    width = value;
    notifyListeners();
  }
}
