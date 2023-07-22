import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web_ondispatch/web.dart';
import 'package:web_ondispatch/web3.dart';
import 'package:web_ondispatch/web4.dart';
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
  //final Function onPageStarted;
  //final Function onPageFinished;
  WebViewContainer({
    Key? key,
    required this.initialUrl,
    //required this.onPageStarted,
    //required this.onPageFinished,
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
    //final status = await Permission.manageExternalStorage.request();
    if (await permission.isDenied) {
      await permission.request();
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
    //final status = await Permission.manageExternalStorage.request();
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
      // Android 13 (SDK 33), samsung SM-G990E --Galaxy S21
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
      // iOS 13.1, iPhone 11 Pro Max iPhone
      requestPermission();
    }
  }


  @override
   initState() {
    // TODO: implement initState
    super.initState();
    checkOS();
    //requestPermission();
   // _getStoragePermission();
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
        // onPageStarted: (String url) {
        //   widget.onPageStarted();
        // },
        // onPageFinished: (String url) {
        //   widget.onPageFinished();
        // },
        navigationDelegate: (NavigationRequest request) {
          print("${request.url}");
          // Check if the direction button URL is clicked
          // https://www.xyz.com/direction_button
          // 'https://www.google.com/maps/place//@21.2329514,72.8160973,15z/data=!3m1!4b1?entry=ttu
          // https://www.google.com/maps/search/?api=1&query=$query
          if (request.url.startsWith('https://www.google.com/maps')) {
            // Open Google Maps using url_launcher package
            //_launchGoogleMaps();
            launchMap();
            // Return NavigationDecision.prevent to prevent the WebView from loading the direction button URL
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    );
  }
  // void _launchGoogleMaps() async {
  //   //Uri finalUrl = Uri.parse("https://www.google.com/maps/search/?api=1&query=47.6,8.8796");
  //   String finalUrl = "https://www.google.com/maps/place//@21.2329514,72.8160973,15z/data=!3m1!4b1?entry=ttu  ";
  //     // Replace this with the desired Google Maps URL
  //   if (await canLaunch(finalUrl)) {
  //     await launch(finalUrl);
  //   } else {
  //     throw 'Could not launch $finalUrl';
  //   }
  // }
  void launchMap() async {
    //String query = Uri.encodeComponent(address);
    // comgooglemaps://@21.2329514,72.8160973,15z/data=!3m1!4b1?entry=ttu
    String googleUrl = "https://www.google.com/maps/search/?api=1&query=21.2329514,72.8160973";

    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    }
  }
}