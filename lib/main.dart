import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'home_screen.dart';
import 'add_product.dart';
import 'product_detail.dart';
import 'product.dart';

void main() {
  runApp(FashionShopApp());
}

class FashionShopApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fashion Shop',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
        '/add': (context) => AddProduct(),
      },
    );
  }
}
