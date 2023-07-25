import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
void main()
{
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(useMaterial3: true),
    home: WebViewContainer(initialUrl: 'https://web.ondispatch.com/',),
  ));
}
class WebViewContainer extends StatefulWidget {
  final String initialUrl;
  WebViewContainer({
    Key? key,
    required this.initialUrl,
  }) : super(key: key);
  @override
  WebViewContainerState createState() => WebViewContainerState();
}
class WebViewContainerState extends State<WebViewContainer> {
  late WebViewController _webViewController;

    Future<void> requestPermissionAndroid13() async {
    final permission = Permission.location;
    final permission1 = Permission.microphone;
    final permission2 = Permission.photos;
    final permission3 = Permission.camera;
    if (await permission.isDenied) { permission.request();
    }
    if (await permission1.isDenied) {
      await permission1.request();
    }
    if (await permission2.isDenied) {
      print("---photos permission---");
      await permission2.request();
    }
    if (await permission3.isDenied) {
      await permission3.request();
    }
    print("----13----");
  }
  Future<void> requestPermission() async {
    final permission = Permission.location;
    final permission1 = Permission.microphone;
    final permission2 = Permission.storage;
    final permission3 = Permission.camera;
    if (await permission.isDenied) {
      await permission.request();
    }
    if (await permission1.isDenied) {
      await permission1.request();
    }
    if (await permission2.isDenied) {
      print("---storage permission---");
      await permission2.request();
    }
    if (await permission3.isDenied) {
      await permission3.request();
    }
    print("----other----");
  }

  Future<void> checkOS() async {
    if (Platform.isAndroid) {
      var androidInfo = await DeviceInfoPlugin().androidInfo;
      String release = androidInfo.version.release;
      var sdkInt = androidInfo.version.sdkInt;
      var manufacturer = androidInfo.manufacturer;
      var model = androidInfo.model;
      print('Android $release (SDK $sdkInt), $manufacturer $model');
      var androidVersion = int.parse(release);
      assert(androidVersion is int);
      print(androidVersion);
      if(androidVersion == 13){
        requestPermissionAndroid13();
      }
      else{
        requestPermission();
      }
    }
    if (Platform.isIOS) {
      var iosInfo = await DeviceInfoPlugin().iosInfo;
      var systemName = iosInfo.systemName;
      var version = iosInfo.systemVersion;
      var name = iosInfo.name;
      var model = iosInfo.model;
      print('$systemName $version, $name $model');
      requestPermission();
    }
  }
   String googleUrl = "";

  @override
   initState() {
    // TODO: implement initState
    super.initState();
    checkOS();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WebView(
        initialUrl: widget.initialUrl,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController controller) {
          _webViewController = controller;
        },
        navigationDelegate: (NavigationRequest request) {
          print(request.url);
          setState(() {
            googleUrl = request.url;
            //request.url = googleUrl;
          });
          print(googleUrl);
          if (request.url.startsWith('https://www.google.com/maps')) {
            launchMap();

            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    );
  }
  void launchMap() async {
    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    }
  }
}