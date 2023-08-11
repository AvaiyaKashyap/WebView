import 'package:flutter/material.dart';
import 'package:web_ondispatch/webpage.dart';
// import 'package:webview_flutter/webview_flutter.dart';
void main()
{

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(useMaterial3: true),
    //home: WebViewContainer(initialUrl: 'https://web.ondispatch.com/',),
    home: const webpage(),
  ));
}
// class WebViewContainer extends StatefulWidget {
//   final String initialUrl;
//   WebViewContainer({
//     Key? key,
//     required this.initialUrl,
//   }) : super(key: key);
//   @override
//   WebViewContainerState createState() => WebViewContainerState();
// }
// class WebViewContainerState extends State<WebViewContainer> {
//   late WebViewController _webViewController;
//   final Completer<WebViewController> _controller = Completer<WebViewController>();
//
//   Future<void> requestPermissionAndroid13() async {
//     final permission = Permission.location;
//      final permission1 = Permission.microphone;
//     final permission2 = Permission.photos;
//     final permission3 = Permission.camera;
//     if (await permission.isDenied) { permission.request();
//     }
//     if (await permission1.isDenied) {
//       await permission1.request();
//     }
//     if (await permission2.isDenied) {
//       print("---photos permission---");
//       await permission2.request();
//     }
//     if (await permission3.isDenied) {
//       await permission3.request();
//     }
//     print("----13----");
//   }
//   Future<void> requestPermission() async {
//     final permission = Permission.location;
//      final permission1 = Permission.microphone;
//     final permission2 = Permission.storage;
//     final permission3 = Permission.camera;
//     if (await permission.isDenied) {
//       await permission.request();
//     }
//     if (await permission1.isDenied) {
//       await permission1.request();
//     }
//     if (await permission2.isDenied) {
//       print("---storage permission---");
//       await permission2.request();
//     }
//     if (await permission3.isDenied) {
//       await permission3.request();
//     }
//     print("----other----");
//   }
//
//   Future<void> checkOS() async {
//     if (Platform.isAndroid) {
//       var androidInfo = await DeviceInfoPlugin().androidInfo;
//       String? release = androidInfo.version.release;
//       var sdkInt = androidInfo.version.sdkInt;
//       var manufacturer = androidInfo.manufacturer;
//       var model = androidInfo.model;
//       print('Android $release (SDK $sdkInt), $manufacturer $model');
//       var androidVersion = int.parse(release!);
//       assert(androidVersion is int);
//       print(androidVersion);
//       if(androidVersion == 13){
//         requestPermissionAndroid13();
//       }
//       else{
//         requestPermission();
//       }
//     }
//     if (Platform.isIOS) {
//       var iosInfo = await DeviceInfoPlugin().iosInfo;
//       var systemName = iosInfo.systemName;
//       var version = iosInfo.systemVersion;
//       var name = iosInfo.name;
//       var model = iosInfo.model;
//       print('$systemName $version, $name $model');
//       requestPermission();
//     }
//   }
//   String googleUrl = "";
//
//   @override
//   initState() {
//     // TODO: implement initState
//     super.initState();
//     checkOS();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: WebView(
//         initialUrl: widget.initialUrl,
//         javascriptMode: JavascriptMode.unrestricted,
//         onWebViewCreated: (WebViewController controller) {
//           _webViewController = controller;
//         },
//         onPageFinished: (String url) {
//           print("on page finished: $url");
//           _addButtonClickListener();
//         },
//         onPageStarted: (String url){
//           print("on page Started: $url");
//         },
//         javascriptChannels: <JavascriptChannel>{
//           _filePickerJavascriptChannel(context),
//         },
//         navigationDelegate: (NavigationRequest request) {
//           print(request.url);
//           setState(() {
//             googleUrl = request.url;
//             //request.url = googleUrl;
//           });
//           print(googleUrl);
//           if (request.url.startsWith('https://www.google.com/maps')) {
//             launchMap();
//
//             return NavigationDecision.prevent;
//           }
//           return NavigationDecision.navigate;
//         },
//       ),
//     );
//   }
//   void launchMap() async {
//     if (await canLaunch(googleUrl)) {
//       await launch(googleUrl);
//     }
//   }
//   Future<void> _addButtonClickListener() async {
//     print("button pressed");
//     final String jsCode = '''
//       document.querySelector('fileUpload').addEventListener('click', function() {
//         window.FilePicker.postMessage('openFilePicker');
//       });
//     ''';
//     _controller.future.then((controller) => controller.runJavascript(jsCode));
//   }
//   JavascriptChannel _filePickerJavascriptChannel(BuildContext context) {
//     return JavascriptChannel(
//       name: 'FilePicker',
//       onMessageReceived: (JavascriptMessage message) {
//         if (message.message == 'openFilePicker') {
//           _openFilePicker();
//         }
//       },
//     );
//   }
//   Future _openFilePicker() async {
//     print("file picker opened");
//     FilePickerResult? result = await FilePicker.platform.pickFiles();
//     if (result != null) {
//       // Do something with the file
//       print(result.files.single.path);
//     } else {
//       // User canceled the picker
//     }
//   }
// }
