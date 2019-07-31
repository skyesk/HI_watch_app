import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:hi_watch_app/pages/home/content/seats_list.dart';
import 'package:hi_watch_app/pages/home/content/title.dart';

import 'package:hi_watch_app/provider/home/content/seats_list_provider.dart';

import 'package:provider/provider.dart';
import 'package:hi_watch_app/provider/home/title_provider.dart';

import 'package:flutter_easyrefresh/easy_refresh.dart';

class HomePageContent extends StatefulWidget {
  @override
  _HomePageContentState createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent> {
  GlobalKey<EasyRefreshState> _easyRefreshKey = new GlobalKey<EasyRefreshState>();
  GlobalKey<RefreshHeaderState> _headerKey = new GlobalKey<RefreshHeaderState>();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: ScreenUtil().setSp(0),
      left: ScreenUtil().setSp(30),
      right: ScreenUtil().setSp(30),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: new BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black26,
              offset: Offset(-1.0, -3.0),
              blurRadius: 20.0,
            ),
            BoxShadow(
              color: Colors.black26,
              offset: Offset(-1.0, -3.0),
              blurRadius: 20.0,
            ),
          ],
        ),
        width: ScreenUtil().setWidth(700),
        height: ScreenUtil().setHeight(1550),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Container(
                decoration: UnderlineTabIndicator(
                  borderSide: BorderSide(color: Colors.black45),
                ),
                height: ScreenUtil().setHeight(100),
                child: HomePageContentTitle(),
              ),
            ),
            Expanded(
              child: EasyRefresh(
                key: _easyRefreshKey,
                onRefresh: () async {
                  String userName = Provider.of<HomePageTitleProvider>(context).name;
                  Provider.of<HomeContentSeatsListProvider>(context).refreshAllSeatsList(
                    userName,
                    context,
                  );
                },
                refreshHeader: ClassicsHeader(
                  key: _headerKey,
                  refreshedText: "刷新完成",
                  refreshingText: "正在加载",
                  refreshReadyText: "松手刷新列表",
                  refreshText: "下拉刷新列表",
                ),
                child: ListView.builder(
                  padding: EdgeInsets.all(0),
                  itemCount: Provider.of<HomeContentSeatsListProvider>(context).contentSeatsList.length,
                  itemBuilder: (BuildContext context, index) {
                    var item = Provider.of<HomeContentSeatsListProvider>(context).contentSeatsList[index];
                    return homePageSeatsListItem(
                      item['id'],
                      item['leader_name'],
                      item['status'],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
