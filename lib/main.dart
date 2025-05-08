import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app_state.dart';
import 'login_screen.dart';
import 'home_screen.dart';
import 'add_product.dart';
import 'category_screen.dart';     // Category screen
import 'product_data.dart';       // Product list
import 'cart_provider.dart';      // Cart state
import 'cart_screen.dart';        // Cart screen
import 'profile_screen.dart';     // ✅ Profile screen

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppState()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: const FashionShopApp(),
    ),
  );
}

class FashionShopApp extends StatelessWidget {
  const FashionShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    return MaterialApp(
      title: 'Fashion Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: appState.themeColor,
        appBarTheme: AppBarTheme(
          backgroundColor: appState.themeColor,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(backgroundColor: appState.themeColor),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: appState.themeColor,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
        '/add': (context) => AddProduct(),
        '/categories': (context) => CategoriesScreen(products: products),
        '/cart': (context) => CartScreen(),
        '/profile': (context) => ProfileScreen(), // ✅ Added Profile screen route
      },
    );
  }
}
