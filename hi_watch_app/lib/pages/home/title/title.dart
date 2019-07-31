import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:hi_watch_app/provider/home/title_provider.dart';
import 'package:provider/provider.dart';

class HomePageTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: ScreenUtil().setSp(0),
      left: ScreenUtil().setSp(30),
      right: ScreenUtil().setSp(30),
      child: Container(
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: new BorderRadius.only(
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          ),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black26,
              offset: Offset(1.0, 3.0),
              blurRadius: 20.0,
            ),
            BoxShadow(
              color: Colors.black26,
              offset: Offset(1.0, 3.0),
              blurRadius: 20.0,
            ),
          ],
        ),
        width: ScreenUtil().setWidth(700),
        height: ScreenUtil().setHeight(180),
        child: Container(
          padding: EdgeInsets.only(bottom: ScreenUtil().setSp(10)),
          alignment: Alignment.bottomCenter,
          child: Text(
            Provider.of<HomePageTitleProvider>(context).name,
            //"韦思凯",
            style: TextStyle(
              color: Colors.lightBlue,
              fontWeight: FontWeight.bold,
              fontSize: ScreenUtil().setSp(50),
            ),
          ),
        ),
      ),
    );
  }
}
