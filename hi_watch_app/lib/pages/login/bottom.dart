import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget loginPageTeam() {
  return Positioned(
    bottom: ScreenUtil().setSp(0),
    left: ScreenUtil().setSp(60),
    right: ScreenUtil().setSp(60),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: new BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            offset: Offset(-1.0, -6.0),
            blurRadius: 20.0,
          ),
          BoxShadow(
            color: Colors.black12,
            offset: Offset(-1.0, -6.0),
            blurRadius: 20.0,
          ),
        ],
      ),
      height: ScreenUtil().setHeight(620),
      width: ScreenUtil().setWidth(500),
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: ScreenUtil().setHeight(30),
          ),
          Text(
            "防灾科技学院",
            style: TextStyle(
              color: Colors.lightBlue,
              fontWeight: FontWeight.bold,
              fontSize: ScreenUtil().setSp(60),
            ),
          ),
          Text(
            "IOT-518实验室 出品",
            style: TextStyle(
              color: Colors.lightBlue,
              fontWeight: FontWeight.bold,
              fontSize: ScreenUtil().setSp(45),
            ),
          ),
          SizedBox(
            height: ScreenUtil().setHeight(40),
          ),
          Text("谷若辰  焦晓宁", style: nameTextStyle()),
          Text("韦思凯  王亚琪", style: nameTextStyle()),
          Text("王晶  陈曦", style: nameTextStyle()),
        ],
      ),
    ),
  );
}

TextStyle nameTextStyle() {
  return TextStyle(
    color: Colors.black54,
    fontWeight: FontWeight.normal,
    fontSize: ScreenUtil().setSp(45),
  );
}
