import 'package:hi_watch_app/configs/service_url_config.dart';
import 'package:dio/dio.dart';

/// 登录确认

Future checkUser(int id, String password) async {
  Dio dio = new Dio();
  try {
    Response response = await dio.get(ServiceUrlPath.checkUser,
      queryParameters: {"id": id, "password": password});
    return response.data;
  } catch (e) {
    return 3;
  }
}

/// 请求个人信息

Future requestPerInfo(int id) async {
  Dio dio = new Dio();
  try {
    Response response = await dio.get(ServiceUrlPath.getPerInfo+id.toString());
    return response.data;
  } catch (e) {
    return 0;
  }
}

// 获取座位状态信息列表

Future getSeatsList() async {
  Dio dio = new Dio();
  Response response = await dio.get(ServiceUrlPath.seatsList);
  return response.data;
}
