import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:hi_watch_app/widgets/home_page_content_title_item.dart';

import 'package:provider/provider.dart';
import 'package:hi_watch_app/provider/home/content/title_provider.dart';

class HomePageContentTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        homePageContentTitleItem(
          context,
          0,
          "全部",
          Provider.of<HomeContentTitleItemProvider>(context).itemsStatus[0],
        ),
        Container(color: Colors.black87, width: ScreenUtil().setWidth(1)),
        homePageContentTitleItem(
          context,
          1,
          "关于我的",
          Provider.of<HomeContentTitleItemProvider>(context).itemsStatus[1],
        ),
        Container(color: Colors.black87, width: ScreenUtil().setWidth(1)),
        homePageContentTitleItem(
          context,
          2,
          "空闲座位",
          Provider.of<HomeContentTitleItemProvider>(context).itemsStatus[2],
        ),
      ],
    );
  }
}
