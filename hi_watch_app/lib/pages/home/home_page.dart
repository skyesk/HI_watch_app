import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:hi_watch_app/pages/home/title/title.dart';
import 'package:hi_watch_app/pages/home/content/content.dart';
import 'package:hi_watch_app/provider/home/content/seats_list_provider.dart';
import 'package:hi_watch_app/provider/home/title_provider.dart';

import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    countdown(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 828, height: 1792)..init(context);
    return Scaffold(
      body: Container(
        height: ScreenUtil.screenHeight,
        width: ScreenUtil.screenWidth,
        color: Colors.lightBlueAccent,
        alignment: Alignment.topCenter,
        child: Stack(
          children: <Widget>[
            HomePageTitle(),
            HomePageContent(),
          ],
        ),
      ),
    );
  }
}

void countdown(BuildContext context) {
  Timer countdownTimer = new Timer.periodic(
    new Duration(seconds: 1),
    (timer) {
      print("刷新次数：$timer.tick");
      String userName = Provider.of<HomePageTitleProvider>(context).name;
      Provider.of<HomeContentSeatsListProvider>(context).refreshAllSeatsList(
        userName,
        context,
      );
    },
  );
}
