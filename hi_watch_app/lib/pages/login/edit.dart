import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:hi_watch_app/routes/application.dart';
import 'package:hi_watch_app/routes/routers.dart';
import 'package:provider/provider.dart';

import 'package:hi_watch_app/service/service_method.dart';

import 'package:hi_watch_app/widgets/login_error_dialog.dart';

import 'package:hi_watch_app/provider/home/content/seats_list_provider.dart';
import 'package:hi_watch_app/provider/home/title_provider.dart';

class LoginPageEdit extends StatefulWidget {
  @override
  _LoginPageEditState createState() => _LoginPageEditState();
}

class _LoginPageEditState extends State<LoginPageEdit> {
  TextEditingController idTextEditController = TextEditingController();
  TextEditingController passwordTextEditController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: ScreenUtil().setSp(350),
      left: ScreenUtil().setSp(30),
      right: ScreenUtil().setSp(30),
      child: Container(
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
          borderRadius: new BorderRadius.all(
            Radius.circular(5.0),
          ),
        ),
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.all(
                  Radius.circular(20.0),
                ),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(1.0, 6.0),
                    blurRadius: 20.0,
                  ),
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(1.0, 6.0),
                    blurRadius: 20.0,
                  ),
                ],
              ),
              width: ScreenUtil().setWidth(700),
              padding: EdgeInsets.fromLTRB(20.00, 20.0, 20.0, 30.0),
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "登录",
                      style: TextStyle(color: Colors.lightBlue, fontSize: ScreenUtil().setSp(50)),
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(40),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: "工号",
                      hintText: "请输入您的工号",
                      icon: Icon(Icons.person),
                    ),
                    keyboardType: TextInputType.number,
                    controller: idTextEditController,
                    maxLines: 1,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: "密码",
                      hintText: "请输入你的密码",
                      icon: Icon(Icons.lock),
                    ),
                    controller: passwordTextEditController,
                    obscureText: true,
                    maxLines: 1,
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(50),
                  ),
                  Container(
                    width: ScreenUtil().setWidth(180),
                    child: FlatButton(
                      onPressed: () => loginButtonClicked(
                        context,
                        int.parse(idTextEditController.text),
                        passwordTextEditController.text,
                      ),
                      child: Center(
                        child: Text(
                          "登录",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

loginButtonClick() {}

void loginButtonClicked(BuildContext context, int id, String password) async {
  print("onPressed Login Button");

  await checkUser(
    id,
    password,
  ).then(
    (value) async {
      if (value == 1) {
        await requestPerInfo(id).then(
          (value) {
            print("用户名：" + value['name']);
            Provider.of<HomePageTitleProvider>(context).setName(value['name'].toString());
            Provider.of<HomeContentSeatsListProvider>(context).refreshAllSeatsList(
              value['name'],
              context,
            );
          },
        );
        Application.router.navigateTo(
          context,
          Routes.homePage,
          transition: TransitionType.cupertino,
        );
        print("登录成功");
      } else {
        showDialog(
          context: context,
          barrierDismissible: true,
          builder: (_) => loginErrorDialog(context, value),
        );
        print("账号或密码输入错误");
      }
    },
  );
}
