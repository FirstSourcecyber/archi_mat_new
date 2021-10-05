import 'package:dio/dio.dart';

import '../environment.dart';

class ShopService {
  var dio = new Dio();
  Future<dynamic> getshop(id) async {
    try {
      print(id);
      var resp = await this.dio.post(
            Config.url + "shop/shopdetail",
            data: id,
          );
      return resp.data;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
