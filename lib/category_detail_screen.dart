import 'package:flutter/material.dart';
import 'product.dart';

class CategoryDetailScreen extends StatelessWidget {
  final String category;
  final List<Product> products;

  CategoryDetailScreen({required this.category, required this.products});

  @override
  Widget build(BuildContext context) {
    // Filter the products to only show those that match the category
    final filteredProducts = products.where((product) => product.category == category).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category),
        backgroundColor: Color(0xFFF7D2FF),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: filteredProducts.length,
          itemBuilder: (context, index) {
            final product = filteredProducts[index];
            return Card(
              margin: EdgeInsets.symmetric(vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 4,
              child: ListTile(
                leading: Image.network(product.image, width: 50, height: 50, fit: BoxFit.cover),
                title: Text(product.name),
                subtitle: Text('₱${product.price.toStringAsFixed(2)}'), // Format price as needed
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // You can navigate to a product detail screen if you have one
                },
              ),
            );
          },
        ),
      ),
    );
  }
}