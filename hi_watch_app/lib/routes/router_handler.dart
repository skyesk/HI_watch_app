import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import 'package:hi_watch_app/pages/login/login_page.dart';
import 'package:hi_watch_app/pages/home/home_page.dart';

// 登录页面
Handler loginPageHandler = Handler(
  handlerFunc: (
    BuildContext context,
    Map<String, List<String>> params,
  ) {
    return LoginPage();
  },
);

// 主页
Handler homePageHandler = Handler(
  handlerFunc: (
    BuildContext context,
    Map<String, List<String>> params,
  ) {
    return HomePage();
  },
);
