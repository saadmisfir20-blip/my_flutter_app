import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/product_list_screen.dart';
import 'screens/cart_screen.dart';
import 'screens/checkout_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  static const baseUrl = 'http://10.0.2.2:4000';
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = Locale('ar');

  void setLocale(Locale l) => setState(()=> _locale = l);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Build Store',
      theme: ThemeData(primarySwatch: Colors.blue),
      locale: _locale,
      supportedLocales: [Locale('ar'), Locale('en')],
      localizationsDelegates: [
        // built-in delegates
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      routes: {
        '/': (_) => HomeScreen(baseUrl: MyApp.baseUrl, setLocale: setLocale),
        '/products': (_) => ProductListScreen(baseUrl: MyApp.baseUrl),
        '/cart': (_) => CartScreen(),
        '/checkout': (_) => CheckoutScreen(baseUrl: MyApp.baseUrl),
      },
    );
  }
}
