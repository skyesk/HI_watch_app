/// 本机地址
const serviceUrl = 'http://localhost:8080/hi_watch/';

/// mac在实验室的地址
//const serviceUrl = 'http://192.168.1.111:8080/hi_watch/';

const caremanModleUrl = "care_mans/";
const seatsModleUrl = "seats/";

class ServiceUrlPath {
  static String checkUser = serviceUrl + caremanModleUrl + "check_user"; // 验证登陆密码
  static String seatsList = serviceUrl + seatsModleUrl; // 座椅信息列表
  static String getPerInfo = serviceUrl + caremanModleUrl; // 获取用户信息
}
