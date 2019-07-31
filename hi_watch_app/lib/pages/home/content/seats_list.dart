import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget homePageSeatsListItem(id, leader, status) {
  return Container(
    decoration: UnderlineTabIndicator(
      borderSide: BorderSide(color: Colors.black45),
    ),
    height: ScreenUtil().setHeight(150),
    padding: EdgeInsets.fromLTRB(
      ScreenUtil().setSp(40),
      ScreenUtil().setSp(20),
      ScreenUtil().setSp(60),
      ScreenUtil().setSp(20),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "编号：$id",
              style: TextStyle(fontSize: ScreenUtil().setSp(40)),
            ),
            Text(
              "负责人：$leader",
              style: TextStyle(fontSize: ScreenUtil().setSp(30)),
            ),
          ],
        ),
        statusDisplay(status),
      ],
    ),
  );
}

/// 获得显示状态用的小圆圈

Widget statusDisplay(status) {
  return CircleAvatar(
    radius: 24.0,
    backgroundColor: getStatusDisplayColor(status),
  );
}

Color getStatusDisplayColor(status) {
  if (status == 'n') {
    return Colors.grey;
  } else {
    return status == 'r' ? Colors.green : Colors.red;
  }
}
