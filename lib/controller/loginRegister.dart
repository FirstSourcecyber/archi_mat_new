import 'dart:convert';

import 'package:archimat/Services/loginService.dart';
import 'package:archimat/pages/tab.dart';
import 'package:archimat/splash/registeration.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginRegisterController extends GetxController {
  var _googlesignin = GoogleSignIn();
  var googleAccount = Rx<GoogleSignInAccount>(null);
  var token = ''.obs;
  var user = {}.obs;
  var loader = true.obs;
  var image = ''.obs;

  tokenget() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    // pref.clear();
    if (pref.getString('user') != null) {
      user.value = jsonDecode(pref.getString('user'));
    }
    FirebaseMessaging.instance.getToken().then((tokeen) {
      print(tokeen);
      token.value = tokeen;
      // update();
      print('token------------------------');
      print(token.value);
      // ignore: invalid_use_of_protected_member
      print(user.value);
      print('token------------------------');
    });
  }

  getuser() {}

  signupgoogle(token) async {
    googleAccount.value = await _googlesignin.signIn();

    print(googleAccount.value);
    if (googleAccount.value != null) {
      var data = {
        'email': googleAccount.value.email,
        'id': googleAccount.value.id,
        'username': googleAccount.value.displayName,
        'image': googleAccount.value.photoUrl,
        'password': '',
        'mob_token': token,
        'google': true,
        'firstname': '',
        'lastname': '',
        'gender': '',
        'phone': '',
      };
      image.value = googleAccount.value.photoUrl;
      print(data);
      showAlert("Please fill all these field to complete the registration.",
          Colors.red);
      Get.to(() => RegisterationPage(
            login: true,
            data: data,
          ));
      // LoginService().signupWithGoogle(data).then((value) {
      //   print(value);
      //   if (value['message'] == 'success') {
      //     if (value['user']['role']['name'] == 'user') {
      //       print('user');
      //       prefs.remove('image');
      //       prefs.setString('user', jsonEncode(value['user']));

      //       Get.offAll(() => TabPage(
      //             index: 0,
      //             data: null,
      //           ));
      //     } else {
      //       showAlert('User not available', Colors.red);
      //       print('User not available');
      //     }
      //   } else {
      //     showAlert(value['message'], Colors.red);
      //   }
      // });
    }
  }

  signup() async {
    // var data = {
    //   'email': email.text.trim(),
    //   'username': uname.text.trim(),
    //   'password': pswd.text.trim(),
    //   'mob_token': token,
    //   'firstname': fname.text.trim(),
    //   'lastname': lname.text.trim(),
    //   'gender': gender != null ? gender : 'Male',
    //   // 'birthday': selectedDate.toString(),
    //   'google': true,
    //   'phone': countrycode + newphone,
    //   'image': prefs.getString('image')
    // };
    // print(data);
    // LoginService().signup(data).then((value) {
    //   print(value);
    //   if (value['message'] == 'success') {
    //     if (value['user']['role']['name'] == 'user') {
    //       print('user');
    //       prefs.remove('image');
    //       prefs.setString('user', jsonEncode(value['user']));

    //       Navigator.of(context).pushAndRemoveUntil(
    //           MaterialPageRoute(
    //               builder: (context) => TabPage(
    //                     index: 0,
    //                     data: null,
    //                   )),
    //           (Route<dynamic> route) => false);
    //     } else {
    //       setState(() {
    //         loader = false;
    //       });
    //       showAlert('User not available', Colors.red);
    //       print('User not available');
    //     }
    //   } else {
    //     setState(() {
    //       loader = false;
    //     });
    //     showAlert(value['message'], Colors.red);
    //   }
    // });
  }

  updateUser(value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('user', jsonEncode(value));
  }

  loginwithgoogle(token1) async {
    googleAccount.value = await _googlesignin.signIn();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var data = {'email': googleAccount.value.email.trim(), 'mob_token': token1};
    print(data);

    LoginService().loginwithgoogle(data).then((value) {
      print(value);
      if (value['message'] == 'success') {
        if (value['user']['role']['name'] == 'user') {
          print('user');
          prefs.setString('user', jsonEncode(value['user']));
          // prefs.setString('new', 'new');
          Get.offAll(TabPage(
            index: 0,
            data: null,
          ));
        } else if (value['user']['role']['name'] == 'shopOwner') {
          prefs.setString('user', jsonEncode(value['user']));
          prefs.setString('new', 'new');
          Get.offAll(() => TabPage(
                index: 0,
                data: value['user']['shop'],
              ));

          print('shop');
        } else {
          showAlert('User not available', Colors.red);
          print('user not available');
        }
      } else {
        showAlert('User not available', Colors.red);
        print('user not available');
      }
    });
  }

  showAlert(text, backcolor) {
    print('infunction');
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: backcolor,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
