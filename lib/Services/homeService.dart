import 'package:dio/dio.dart';

import '../environment.dart';

class HomeService {
  var dio = new Dio();
  Future<dynamic> gethomedetail() async {
    try {
      var resp = await this.dio.get(
            Config.url + "home/all",
          );
      return resp.data;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
