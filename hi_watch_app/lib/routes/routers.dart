import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

import 'package:hi_watch_app/routes/router_handler.dart';

class Routes {
  static String root = "/";
  static String homePage = root + "homePage";
  static String loginPage = root + "loginPage";

  static void configureRoutes(Router router){
    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context,Map<String,List<String>> params){
          print('ERROR');
          return;
        },
    );

    router.define(homePage, handler: homePageHandler);
    router.define(loginPage, handler: loginPageHandler);
  }
}