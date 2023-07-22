// import 'package:flutter/material.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:url_launcher/url_launcher.dart';
// //import 'package:flutter_inappwebview/flutter_inappwebview.dart';
// import 'package:webview_flutter/webview_flutter.dart';
// class Webview extends StatefulWidget {
//   const Webview({super.key});
//
//   @override
//   State<Webview> createState() => _WebviewState();
// }
//
// class _WebviewState extends State<Webview> {
//
//
//
//   Future<void> requestPermission() async {
//     final permission = Permission.location;
//     final permission1 = Permission.microphone;
//     if (await permission.isDenied) {
//       await permission.request();
//     }
//     if (await permission1.isDenied) {
//       await permission1.request();
//     }
//   }
//
//   _launchURL(String url) async {
//     if (await canLaunchUrl(url as Uri)) {
//       await launchUrl(url as Uri);
//     } else {
//       print("--------------------------------------------------");
//       throw 'Could not launch $url';
//     }}
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     requestPermission();
//   }
//
//   late WebViewController _controller;
//
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//         body: Center(
//           child: WebView(
//       initialUrl: 'https://web.ondispatch.com/',
//
//       javascriptMode: JavascriptMode.unrestricted,
//       onWebViewCreated: (WebViewController webViewController) {
//           _controller = webViewController;
//       },
//
//       //navigationDelegate: (NavigationRequest request)
//       // {
//       //   if (request.url.startsWith('https://my.redirect.url.com'))
//       //   {
//       //     print('blocking navigation to $request}');
//       //     _launchURL('https://my.redirect.url.com');
//       //     return NavigationDecision.prevent;
//       //   }
//       //
//       //   print('allowing navigation to $request');
//       //   return NavigationDecision.navigate;
//       // },
//     ),
//         ),
//     );
//   }
// }
