// product_detail.dart
import 'package:flutter/material.dart';
import 'product.dart';

class ProductDetail extends StatelessWidget {
  final Product product;

  const ProductDetail({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(product.image, height: 200, fit: BoxFit.cover),
            SizedBox(height: 16),
            Text(product.name, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text("₱${product.price.toStringAsFixed(2)}", style: TextStyle(fontSize: 20, color: Colors.deepPurple)),
            SizedBox(height: 10),
            Text(product.description),
            SizedBox(height: 10),
            Text('Category: ${product.category}'),
            if (product.sizes.isNotEmpty)
              Text('Available Sizes: ${product.sizes.join(', ')}'),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    // Add to cart action
                  },
                  icon: Icon(Icons.add_shopping_cart),
                  label: Text("Add to Cart"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                  ),
                ),
                SizedBox(width: 16),
                ElevatedButton.icon(
                  onPressed: () {
                    // Buy now action
                  },
                  icon: Icon(Icons.shopping_bag),
                  label: Text("Buy Now"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pinkAccent,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
