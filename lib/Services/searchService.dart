import 'package:dio/dio.dart';
import '../environment.dart';

class SearchService {
  var dio = new Dio();

  Future<dynamic> getallsearch() async {
    try {
      var resp = await this.dio.get(
            Config.url + "search/all",
          );
      return resp.data;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
