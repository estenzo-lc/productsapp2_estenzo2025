import 'package:flutter/material.dart';
import 'product_detail.dart';
import 'product.dart'; // Product class

class ProductListPage extends StatelessWidget {
  final List<Product> products = [
    Product(
      image: 'https://cdn.pixabay.com/photo/2017/03/28/17/53/hoodie-2182849_640.jpg',
      name: 'Hoodie',
      price: 499.00,
      description: 'Comfortable cotton hoodie.',
      category: 'Hoodies',
      sizes: ['S', 'M', 'L', 'XL'],
    ),
    Product(
      image: 'https://cdn.pixabay.com/photo/2016/06/03/17/35/shoes-1433925_640.jpg',
      name: 'Sneakers',
      price: 799.00,
      description: 'Durable running shoes.',
      category: 'Shoes',
      sizes: ['38', '39', '40', '41'],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => ProductDetail(product: product)), // ✅ fixed name
            ),
            child: Card(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ListTile(
                leading: Image.network(product.image, width: 60, height: 60, fit: BoxFit.cover),
                title: Text(product.name),
                subtitle: Text('₱${product.price.toStringAsFixed(2)}'),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),
          );
        },
      ),
    );
  }
}
