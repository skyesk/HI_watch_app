import 'package:flutter/material.dart';

Widget loginErrorDialog(context, int id) {
  return new AlertDialog(
    title: new Text('出错啦'),
    content: new SingleChildScrollView(
      child: new ListBody(
        children: <Widget>[
          new Text(id == 0 ? '账号或密码输入错误' : '服务器错误'),
        ],
      ),
    ),
    actions: <Widget>[
      new FlatButton(
        child: new Text('行8'),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    ],
  );
}
