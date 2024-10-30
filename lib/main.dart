import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

WebUri url = WebUri(
  'https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/capture',
);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Permission.camera.request();
  await Permission.microphone.request();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final GlobalKey webViewKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: InAppWebView(
          key: webViewKey,
          initialUrlRequest: URLRequest(url: url),
        ),
      ),
    );
  }
}
