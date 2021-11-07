import 'package:archimat/Services/homeService.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var category = [].obs,
      product = [].obs,
      service = [].obs,
      slider = [].obs,
      slider2 = [].obs,
      slider3 = [].obs,
      shop = [].obs,
      material = [].obs;
  var loader = true.obs;

  @override
  void onInit() {
    home();
    super.onInit();
  }

  home() async {
    if (category.length == 0) {
      HomeService().gethomedetail().then((value) {
        print(value);

        if (value != null) {
          var data = value;
          product.value = data['vrproduct'];
          material.value = data['allmaterial'];
          category.value = data['allcategory'];
          shop.value = data['vrshop'];
          service.value = data['allservice'];
          slider.value = data['slider1'];
          slider2.value = data['slider2'];
          print(data['slider3'].length.toString());
          slider3.value = data['slider3'];
          // slider3 = [];
          loader.value = false;
          print('vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv');
          // ignore: invalid_use_of_protected_member
          print(product.value);
          print('vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv');
        }
      });
    } else {
      Future.delayed(Duration(microseconds: 1000000), () {
        loader.value = false;
      });
    }
  }
}
