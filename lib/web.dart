// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';
// import 'package:permission_handler/permission_handler.dart';
//
// class webpage extends StatefulWidget {
//   const webpage({Key? key}) : super(key: key);
//
//   @override
//   State<webpage> createState() => _webpageState();
// }
//
// class _webpageState extends State<webpage> {
//   InAppWebViewController? inAppWebViewController;
//   late PullToRefreshController pullToRefreshController;
//   String pageurl = 'https://web.ondispatch.com/login.php';
//
//   List allBookmarks = [];
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
//   @override
//   void initState() {
//     super.initState();
//     requestPermission();
//     // pullToRefreshController = PullToRefreshController(
//     //     options: PullToRefreshOptions(color: Colors.red),
//     //     onRefresh: () async {
//     //       if (Platform.isAndroid) {
//     //         await inAppWebViewController!.reload();
//     //       } else if (Platform.isIOS) {
//     //         await inAppWebViewController!.loadUrl(
//     //             urlRequest: URLRequest(
//     //               url: await inAppWebViewController!.getUrl(),
//     //             ));
//     //       }
//     //     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   title: Text('Browser'),
//       //   //  centerTitle: true,
//       //   actions: [
//       //     IconButton(
//       //         onPressed: () async {
//       //           showDialog(
//       //               context: context,
//       //               builder: (context) => AlertDialog(
//       //                 title: Center(
//       //                   child: Text("all Booknarks link"),
//       //                 ),
//       //                 content: Column(
//       //                   mainAxisSize: MainAxisSize.min,
//       //                   children: allBookmarks
//       //                       .map(
//       //                         (e) => GestureDetector(
//       //                         onTap: () async {
//       //                           Navigator.of(context).pop();
//       //
//       //                           await inAppWebViewController!.loadUrl(
//       //                               urlRequest: URLRequest(url: e));
//       //                         },
//       //                         child: Text(
//       //                           e,
//       //                           style: TextStyle(color: Colors.blue),
//       //                         )),
//       //                   )
//       //                       .toList(),
//       //                 ),
//       //               ));
//       //         },
//       //         icon: Icon(Icons.bookmark)),
//       //     IconButton(
//       //       onPressed: () async {
//       //         if (await inAppWebViewController!.canGoBack()) {
//       //           await inAppWebViewController!.goBack();
//       //         }
//       //       },
//       //       icon: Icon(Icons.arrow_back_ios_new_rounded),
//       //     ),
//       //     IconButton(
//       //         onPressed: () async {
//       //           await inAppWebViewController!.loadUrl(
//       //               urlRequest:
//       //               URLRequest(url: Uri.parse("https://www.google.co.in")));
//       //         },
//       //         icon: Icon(Icons.home)),
//       //     IconButton(
//       //         onPressed: () async {
//       //           if (await inAppWebViewController!.canGoForward()) {
//       //             await inAppWebViewController!.goForward();
//       //           }
//       //         },
//       //         icon: Icon(Icons.arrow_forward_ios)),
//       //   ],
//       // ),
//       body: InAppWebView(
//         initialUrlRequest: URLRequest(
//           url: Uri.parse("$pageurl"),
//         ),
//         onWebViewCreated: (val) {
//           inAppWebViewController = val;
//         },
//         // pullToRefreshController: pullToRefreshController,
//         // onLoadStop: (controller, uri) async {
//         //   await pullToRefreshController.endRefreshing();
//         // },
//       ),
//       // floatingActionButton: FloatingActionButton(
//       //   child: Icon(Icons.bookmark_border_rounded),
//       //   onPressed: () async {
//       //     Uri? uri = await inAppWebViewController!.getUrl();
//       //
//       //     allBookmarks.add(uri!.toString());
//       //   },
//       // ),
//     );
//   }
// }