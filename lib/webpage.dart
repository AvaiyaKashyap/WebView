import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

class webpage extends StatefulWidget {
  const webpage({Key? key}) : super(key: key);

  @override
  State<webpage> createState() => _webpageState();
}

class _webpageState extends State<webpage> {
  InAppWebViewController? inAppWebViewController;
  late PullToRefreshController pullToRefreshController;
  String pageurl = 'https://web.ondispatch.com/';
  String mapsUrl = '';

  Future<void> requestPermissionAndroid13() async {
    final permission = Permission.location;
    final permission1 = Permission.microphone;
    final permission2 = Permission.photos;
    final permission3 = Permission.camera;
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
      String? release = androidInfo.version.release;
      var sdkInt = androidInfo.version.sdkInt;
      var manufacturer = androidInfo.manufacturer;
      var model = androidInfo.model;
      print('Android $release (SDK $sdkInt), $manufacturer $model');
      var androidVersion = int.parse(release!);
      print(androidVersion);
      if (androidVersion == 13) {
        requestPermissionAndroid13();
      } else {
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

  @override
  void initState() {
    super.initState();
    checkOS();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: InAppWebView(
          initialUrlRequest: URLRequest(
            url: Uri.parse("$pageurl"),
          ),
          initialOptions: InAppWebViewGroupOptions(
            crossPlatform: InAppWebViewOptions(
              javaScriptEnabled: true,
                useShouldOverrideUrlLoading: true,
               // javaScriptCanOpenWindowsAutomatically: true
            ),
          ),
          
          shouldOverrideUrlLoading: (controller, navigationAction) async {
            // You can access the URL like this
            var url = navigationAction.request.url.toString();
            //String mystring = 'https://www.google.com/maps/place/123%20Test%20Drive,%20West%20Palm%20Beach,%20FL%2033407,+EUA';
            String search = '';
            print("Navigation URL: $url");
            for (int i = 0; i < 22; i++) {
              search += url[i];
              //print(search);
            }
            // ignore: unused_local_variable
            String testUrl =
                "https://www.google.com/maps/place/123%20Test%20Drive,%20West%20Palm%20Beach,%20FL%2033407,+EUA";

            if (search == "https://www.google.com") {
              // This one means do not navigate
              // _filepicker();
              print("-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-");
              print(search);
              setState(() {
                mapsUrl = url;
              });
              _openMaps();
              print("Maps Url :- $mapsUrl");
              return NavigationActionPolicy.CANCEL;
            }

            // This one means navigate
            return NavigationActionPolicy.ALLOW;
          },
          onWebViewCreated: (val) {
            inAppWebViewController = val;
          },
        ),
      ),
    );
  }

  void _openMaps() async {
    // String googleMapsUrl =
    //     'https://www.google.com/maps/place/123%20Test%20Drive,%20West%20Palm%20Beach,%20FL%2033407,+EUA'; // Replace with your Google Maps URL
     if (await canLaunch(mapsUrl)) {
      await launch(mapsUrl);
    } else {
      throw 'Could not launch $mapsUrl';
    }
  }
}

void _filepicker() async {
  final ImagePicker _picker = ImagePicker();
  final XFile? pickedFile = await _picker.pickImage(
    source: ImageSource.camera, // Use ImageSource.gallery for file picker
  );
  if (pickedFile != null) {
    // Handle the picked file
    // You can send the picked file to the WebView if needed
  }
}

