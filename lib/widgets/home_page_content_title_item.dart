import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:hi_watch_app/provider/home/content/seats_list_provider.dart';
import 'package:hi_watch_app/provider/home/content/title_provider.dart';
import 'package:provider/provider.dart';

Widget homePageContentTitleItem(BuildContext context, int id, String text, bool isClicked) {
  return new InkWell(
    onTap: (){
      itemClicked(context, id);
    },
    child: Container(
      height: ScreenUtil().setHeight(100),
      width: ScreenUtil().setWidth(190),
      alignment: Alignment.center,
      child: Text(
        "$text",
        style: TextStyle(
          color: isClicked ? Colors.lightBlue : Colors.black,
          fontSize: isClicked ? ScreenUtil().setSp(40) : ScreenUtil().setSp(30),
          fontWeight: isClicked ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    ),
  );
}

void itemClicked(BuildContext context, int id) {
  Provider.of<HomeContentTitleItemProvider>(context).setItemsStatus(id);
  switch (id) {
    case 0:
      Provider.of<HomeContentSeatsListProvider>(context).requestAllSeatsList();
      break;
    case 1:
      Provider.of<HomeContentSeatsListProvider>(context).requestMySeatsList();
      break;
    case 2:
    Provider.of<HomeContentSeatsListProvider>(context).requestEmptySeatsList();
    break;
    default:
  }
}
