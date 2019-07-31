import 'package:flutter/widgets.dart';

class HomeContentTitleItemProvider with ChangeNotifier {
  List<bool> itemsStatus;

  HomeContentTitleItemProvider(this.itemsStatus);

  void setItemsStatus(int id) {
    for (var i = 0; i < itemsStatus.length; i++) {
      itemsStatus[i] = false;
    }
    itemsStatus[id] = true;

    notifyListeners();
  }
}
