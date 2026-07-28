import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const IbnMosferApp());
}

class IbnMosferApp extends StatelessWidget {
  const IbnMosferApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ابن مسفر للتجارة - مواد بناء',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const WebDesignScreen(),
    );
  }
}

class WebDesignScreen extends StatefulWidget {
  const WebDesignScreen({super.key});

  @override
  State<WebDesignScreen> createState() => _WebDesignScreenState();
}

class _WebDesignScreenState extends State<WebDesignScreen> {
  late final WebViewController _controller;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (String url) {
            setState(() {
              _isLoading = false;
            });
          },
        ),
      )
      ..loadRequest(Uri.parse('https://ibn-masfar-building-6lax.bolt.host/'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[800],
        title: const Text(
          'مؤسسة ابن مسفر للتجارة',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: _controller),
          if (_isLoading)
            const Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
}
