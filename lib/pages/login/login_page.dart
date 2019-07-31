import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hi_watch_app/pages/login/edit.dart';
import 'package:hi_watch_app/pages/login/bottom.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 828, height: 1792)..init(context);
    return Scaffold(
      body: Container(
        height: ScreenUtil.screenHeight,
        width: ScreenUtil.screenWidth,
        child: Stack(
          children: <Widget>[
            SizedBox(
              height: ScreenUtil().setHeight(450),
              child: Container(
                color: Colors.lightBlue,
              ),
            ),
            Positioned(
              top: ScreenUtil().setSp(150),
              left: ScreenUtil().setSp(60),
              child: Text(
                "Hi_Watch_移动端",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: ScreenUtil().setSp(75),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            LoginPageEdit(),
            loginPageTeam(),
          ],
        ),
      ),
      resizeToAvoidBottomPadding: false,
    );
  }
}
