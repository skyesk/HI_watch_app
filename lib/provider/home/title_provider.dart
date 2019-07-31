import 'package:flutter/widgets.dart';

class HomePageTitleProvider with ChangeNotifier {
  String name;

  HomePageTitleProvider(this.name);

  void setName(String name) {
    this.name = name;
    notifyListeners();
  }
}
