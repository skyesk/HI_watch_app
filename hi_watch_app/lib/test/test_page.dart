import 'package:flutter/material.dart';
import 'package:hi_watch_app/service/service_method.dart';

class TestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlatButton(
          onPressed: () async{
            //Provider.of<HomeContentSeatsListProvider>(context).requestAllSeatsList();
            requestPerInfo(1).then((value){
              print(value);
              print(value['name']);
            });
          },
          child: Text("aaaa"),
        ),
      ),
    );
  }
}
