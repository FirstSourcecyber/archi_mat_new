import 'dart:io';

// import 'package:Archimat/Services/fallowService.dart';
import 'package:Archimat/Services/fallowService.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
// import 'package:easy_localization/easy_localization.dart';

import 'package:vibration/vibration.dart';

import '../theme.dart';

class ShopQr extends StatefulWidget {
  final bool shopside;
  final dynamic shopdata;
  const ShopQr({Key key, this.shopdata, this.shopside}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _ShopQrState();
}

class _ShopQrState extends State<ShopQr> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode result;
  int i = 2;
  QRViewController controller;

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller.pauseCamera();
    } else if (Platform.isIOS) {
      controller.resumeCamera();
    }
  }

  getHomeData() {
    setState(() {
      // this.loading = true;
    });
    // Storage.getUser().then((i) {
    //   setState(() {
    //     userId = i['_id'];
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: FloatingActionButton(
            backgroundColor: Colors.white,
            child: SvgPicture.asset(
              'assets/images/torch.svg',
              width: 30,
              color: AppTheme().black,
            ),
            onPressed: () async {
              await controller.toggleFlash();
            },
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              padding: EdgeInsets.all(20),
              child: widget.shopside
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              i = 1;
                            });
                          },
                          child: Container(
                            width: 150,
                            height: 60,
                            alignment: Alignment.center,
                            padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                            decoration: BoxDecoration(
                                color: i == 1
                                    ? AppTheme().purple
                                    : AppTheme().lightgrey,
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                    color: AppTheme().lblack, width: 1)),
                            child: Text(
                              'My Code',
                              style: TextStyle(
                                color: i == 1
                                    ? AppTheme().white
                                    : AppTheme().black,
                                fontFamily: 'Nexa',
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              i = 2;
                            });
                          },
                          child: Container(
                            width: 150,
                            height: 60,
                            alignment: Alignment.center,
                            padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                            decoration: BoxDecoration(
                                color: i == 2
                                    ? AppTheme().purple
                                    : AppTheme().lightgrey,
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                    color: AppTheme().lblack, width: 1)),
                            child: Text(
                              'Scan Code',
                              style: TextStyle(
                                color: i == 2
                                    ? AppTheme().white
                                    : AppTheme().black,
                                fontFamily: 'Nexa',
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : Container(),
            ),
            // widget.shopside?
            Column(
              children: [
                i == 1
                    ? Center(
                        child: QrImage(
                          data: widget.shopdata['id'],
                          version: QrVersions.auto,
                          size: 350.0,
                        ),
                      )
                    : Column(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              height: 300,
                              child: QRView(
                                key: qrKey,
                                onQRViewCreated: _onQRViewCreated,
                              ),
                            ),
                          ),
                          Text("Its the best way to grow your ",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontFamily: 'Nexa',
                              )),
                          Text("follower and reach more buyers. ",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontFamily: 'Nexa',
                              )),
                        ],
                      ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller1) {
    this.controller = controller1;
    controller.scannedDataStream.listen((scanData) async {
      setState(() {
        result = scanData;
      });
      if (controller1.toString() != '') {
        controller.pauseCamera();
        print('result.code===============================');
        print(result.code);
        print("result.code===============================");
        var data = {'user': widget.shopdata['id'], 'shop': result.code};
        print(data);
        FallowService().fallow(data).then((value) {
          showAlert(value['message'], Colors.green);
        });
        // FallowService().fallow(controller).then((data) {
        //   print("+++++++++++++++++++++++++++++++++++++++++++++++++++");
        //   print(data);
        //   if (data['message'] == 'success') {
        //     // Toast.show('Voucher Successfully Use', context, duration: 4);
        //   } else if (data['message'] == 'Already Use') {
        //     // Toast.show('Already Use', context, duration: 4);
        //   } else if (data['message'] == 'fail') {
        //     // Toast.show('Expired', context, duration: 4);
        //   } else {
        //     // Toast.show("Wrong QR, Try Again", context,
        //     //     duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
        //   }
        controller.resumeCamera();
        // });

        // var shopId = link.queryParameters["shop"];

      } else {
        if (await Vibration.hasVibrator()) {
          Vibration.vibrate();
        }
        // Toast.show("Wrong QR, Try Again", context,
        //     duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
        this.controller.resumeCamera();
      }
      // qrText = controller;
    });
  }

  showAlert(text, backcolor) {
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
