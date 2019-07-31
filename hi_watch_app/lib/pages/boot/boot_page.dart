import 'package:flutter/material.dart';
import 'package:hi_watch_app/pages/boot/data.dart';
import 'package:hi_watch_app/pages/boot/indicator.dart';
import 'package:gradient_text/gradient_text.dart';
import 'package:hi_watch_app/routes/application.dart';
import 'package:hi_watch_app/routes/routers.dart';

import 'package:hi_watch_app/provider/home/content/seats_list_provider.dart';
import 'package:provider/provider.dart';

import 'package:shared_preferences/shared_preferences.dart';

class BootPage extends StatefulWidget {
  @override
  _BootPageState createState() => new _BootPageState();
}

class _BootPageState extends State<BootPage> with TickerProviderStateMixin {
  PageController _controller;
  int currentPage = 0;
  bool lastPage = false;
  AnimationController animationController;
  Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = PageController(
      initialPage: currentPage,
    );
    animationController = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );
    _scaleAnimation = Tween(begin: 0.6, end: 1.0).animate(animationController);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Color(0xFF485563), Color(0xFF29323C)],
            tileMode: TileMode.clamp,
            begin: Alignment.topCenter,
            stops: [0.0, 1.0],
            end: Alignment.bottomCenter),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: new Stack(
          fit: StackFit.expand,
          children: <Widget>[
            PageView.builder(
              itemCount: pageList.length,
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                  if (currentPage == pageList.length - 1) {
                    lastPage = true;
                    animationController.forward();
                  } else {
                    lastPage = false;
                    animationController.reset();
                  }
                });
              },
              itemBuilder: (context, index) {
                return AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    var page = pageList[index];
                    var delta;
                    var y = 1.0;

                    if (_controller.position.haveDimensions) {
                      delta = _controller.page - index;
                      y = 1 - delta.abs().clamp(0.0, 1.0);
                    }
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Image.asset(page.imageUrl),
                        Container(
                          margin: EdgeInsets.only(left: 12.0),
                          height: 120.0,
                          child: Stack(
                            children: <Widget>[
                              Opacity(
                                opacity: .10,
                                child: GradientText(
                                  page.title,
                                  gradient: LinearGradient(
                                    colors: pageList[index].titleGradient,
                                  ),
                                  style: TextStyle(
                                    fontSize: 100.0,
                                    fontFamily: "Montserrat-Black",
                                    letterSpacing: 1.0,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 30.0,
                                  left: 22.0,
                                ),
                                child: GradientText(
                                  page.title,
                                  gradient: LinearGradient(
                                    colors: pageList[index].titleGradient,
                                  ),
                                  style: TextStyle(
                                    fontSize: 70.0,
                                    fontFamily: "Montserrat-Black",
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 34.0, top: 12.0),
                          child: Transform(
                            transform: Matrix4.translationValues(0, 50.0 * (1 - y), 0),
                            child: Text(
                              page.body,
                              style: TextStyle(
                                fontSize: 20.0,
                                fontFamily: "Montserrat-Medium",
                                color: Color(0xFF9B9B9B),
                              ),
                            ),
                          ),
                        )
                      ],
                    );
                  },
                );
              },
            ),
            Positioned(
              left: 30.0,
              bottom: 55.0,
              child: Container(
                width: 160.0,
                child: PageIndicator(currentPage, pageList.length),
              ),
            ),
            Positioned(
              right: 30.0,
              bottom: 30.0,
              child: ScaleTransition(
                scale: _scaleAnimation,
                child: lastPage
                    ? FloatingActionButton(
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.black,
                        ),
                        onPressed: () async {
                          Application.router.navigateTo(context, Routes.loginPage);
                          SharedPreferences prefs = await SharedPreferences.getInstance();
                          prefs.setBool("isFirstUse", false);
                          //Provider.of<HomeContentSeatsListProvider>(context).requestAllSeatsList();
                        })
                    : Container(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
