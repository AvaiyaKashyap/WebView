// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';
//
// class MyApp extends StatefulWidget {
//   const MyApp({super.key});
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: AppPage());
//   }
// }
//
// class AppPage extends StatefulWidget {
//   const AppPage({super.key});
//
//   @override
//   State<AppPage> createState() => _AppPageState();
// }
//
// class _AppPageState extends State<AppPage> {
//   bool _showWebView = false;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         alignment: Alignment.center,
//         children: [
//           if (_showWebView) const WebviewExample(),
//           Container(
//             color: Colors.transparent
//           ),
//           TextButton(
//             onPressed: () {
//               setState(() {
//                 _showWebView = !_showWebView;
//               });
//             },
//             child: const Text(
//               "Show Webview",
//               style: TextStyle(color: Colors.black),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class WebviewExample extends StatefulWidget {
//   const WebviewExample({super.key});
//
//   @override
//   State<WebviewExample> createState() => _WebviewExampleState();
// }
//
// class _WebviewExampleState extends State<WebviewExample> {
//   // final controller = WebViewController.fromPlatformCreationParams(
//   //     const PlatformWebViewControllerCreationParams());
//
//   @override
//   void initState() {
//     super.initState();
//
//     // controller
//     //   ..setNavigationDelegate(
//     //     NavigationDelegate(
//           onPageFinished: (String url) {},
//         ),
//       )
//       ..loadRequest(Uri.parse("https://web.ondispatch.com/"));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // return WebViewWidget(controller: controller);
//   }
// }
