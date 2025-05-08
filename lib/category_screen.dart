import 'package:flutter/material.dart';
import 'product.dart';
import 'category_detail_screen.dart';

class CategoriesScreen extends StatelessWidget {
  final List<Product> products;

  CategoriesScreen({required this.products});

  final List<Map<String, String>> categories = [
    {'name': 'Hoodies', 'icon': '🧥'},
    {'name': 'Shoes', 'icon': '👟'},
    {'name': 'Jeans', 'icon': '👖'},
    {'name': 'Sweaters', 'icon': '🧶'},
    {'name': 'Accessories', 'icon': '👜'},
    {'name': 'Tops', 'icon': '👚'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        title: Text('Categories', style: TextStyle(color: Colors.black)),
        backgroundColor: Color(0xFFF7D2FF),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      backgroundColor: Color(0xFFC0D7FF),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            childAspectRatio: 1.3,
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = categories[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CategoryDetailScreen(
                      category: category['name']!,
                      products: products,
                    ),
                  ),
                );
              },
              child: Card(
                color: Color(0xFFBEC1FF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      category['icon']!,
                      style: TextStyle(fontSize: 40),
                    ),
                    SizedBox(height: 10),
                    Text(
                      category['name']!,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
