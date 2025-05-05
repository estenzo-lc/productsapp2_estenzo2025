import 'package:flutter/material.dart';
import 'main.dart'; // To access Product class

class ProductDetail extends StatelessWidget {
  final Product product;

  const ProductDetail({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        backgroundColor: Color(0xFFC8B3FF),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.network(product.image, height: 200, fit: BoxFit.cover),
            SizedBox(height: 16),
            Text(product.name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text('₱${product.price.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 20, color: Colors.deepPurple)),
            SizedBox(height: 10),
            Text(product.description),
            SizedBox(height: 10),
            Text('Category: ${product.category}'),
            if (product.sizes.isNotEmpty)
              Text('Available Sizes: ${product.sizes.join(', ')}'),
          ],
        ),
      ),
    );
  }
}
