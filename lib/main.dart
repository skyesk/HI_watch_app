import 'package:flutter/material.dart';

import 'package:hi_watch_app/provider/home/title_provider.dart';
import 'package:hi_watch_app/pages/boot/boot_page.dart';
import 'package:hi_watch_app/pages/login/login_page.dart';

import 'package:provider/provider.dart';
import 'package:hi_watch_app/provider/home/content/seats_list_provider.dart';
import 'package:hi_watch_app/provider/home/content/title_provider.dart';

import 'package:fluro/fluro.dart';
import 'package:hi_watch_app/routes/application.dart';
import 'package:hi_watch_app/routes/routers.dart';
import 'package:shared_preferences/shared_preferences.dart';

main() {
  runApp(
    MyApp(),
  );
}


class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    
    final router = Router();
    Routes.configureRoutes(router);
    Application.router = router;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          builder: (_) => HomeContentTitleItemProvider([true, false, false, false]),
        ),
        ChangeNotifierProvider(
          builder: (_) => HomeContentSeatsListProvider(),
        ),
        ChangeNotifierProvider(
          builder: (_) => HomePageTitleProvider("NaN"),
        ),
      ],
      child: MaterialApp(
        title: 'Hi_Watch',
        showSemanticsDebugger: false,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:  LoginPage()
      ),
    );
  }
}
