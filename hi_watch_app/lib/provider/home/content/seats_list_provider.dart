import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'package:hi_watch_app/service/service_method.dart';
import 'dart:convert';

import 'package:hi_watch_app/provider/home/content/title_provider.dart';

class HomeContentSeatsListProvider with ChangeNotifier {
  List contentSeatsList = new List();
  List allSeatsList = new List();
  List mySeatsList = new List();
  List emptySeatsList = new List();
  HomeContentSeatsListProvider();

  void refreshAllSeatsList(String leaderName, BuildContext context) async {
    await getSeatsList().then((onValue) {
      contentSeatsList.clear();
      allSeatsList.clear();
      mySeatsList.clear();
      emptySeatsList.clear();

      /**
       * 填充“全部列表数据”
       */
      allSeatsList = json.decode(json.encode(onValue));

      /**
       * 填充“关于我的”数据
       */
      for (var i = 0; i < allSeatsList.length; i++) {
        if (allSeatsList[i]["leader_name"] == leaderName) {
          mySeatsList.add(allSeatsList[i]);
        }
      }

      /**
       * 填充“空闲座位”数据
       */
      for (var i = 0; i < allSeatsList.length; i++) {
        if (allSeatsList[i]["status"] == "n") {
          emptySeatsList.add(allSeatsList[i]);
        }
      }

      /**
       * 根据目前点的是那个item刷新列表
       */
      List<bool> titleItemsStatusList = Provider.of<HomeContentTitleItemProvider>(context).itemsStatus;
      int titleClickedId = 0;
      for (var i = 0; i < titleItemsStatusList.length; i++) {
        if (titleItemsStatusList[i] == true) {
          titleClickedId = i;
        }
      }

      switch (titleClickedId) {
        case 0:
          contentSeatsList = allSeatsList;
          break;
        case 1:
          contentSeatsList = mySeatsList;
          break;
        case 2:
          contentSeatsList = emptySeatsList;
          break;
        default:
      }

      notifyListeners();
    });
  }

  void requestAllSeatsList() async {
    contentSeatsList = allSeatsList;
    notifyListeners();
  }

  void requestMySeatsList() async {
    contentSeatsList = mySeatsList;
    notifyListeners();
  }

  void requestEmptySeatsList() async {
    contentSeatsList = emptySeatsList;
    notifyListeners();
  }
}
