import 'package:flutter/material.dart';
import 'drawer_menu.dart';
import 'product_detail.dart';
import 'product.dart';


class HomeScreen extends StatelessWidget {
  final List<Product> products = [
   Product(
      image: 'https://cdn.pixabay.com/photo/2017/03/28/17/53/hoodie-2182849_640.jpg',
      name: 'Hoodie',
      price: 499.00,
      description: 'This hoodie is designed for both comfort and style. Made from high-quality cotton blend, it provides warmth during chilly weather.',
      category: 'Hoodies',
      sizes: ['S', 'M', 'L', 'XL'],
    ),
    Product(
      image: 'https://cdn.pixabay.com/photo/2016/06/03/17/35/shoes-1433925_640.jpg',
      name: 'Sneakers',
      price: 799.00,
      description: 'These sneakers are built for comfort and durability. The breathable mesh upper keeps your feet cool and dry all day long.',
      category: 'Shoes',
      sizes: ['38', '39', '40', '41', '42', '43'],
    ),
    Product(
      image: 'https://cdn.pixabay.com/photo/2014/08/26/21/49/jeans-428614_640.jpg',
      name: 'Denim Jeans',
      price: 699.00,
      description: 'These denim jeans offer a perfect balance of style and comfort. Crafted from high-quality denim fabric, they provide a snug yet flexible fit.',
      category: 'Jeans',
      sizes: ['28', '30', '32', '34', '36'],
    ),
     Product(
      image: 'https://cdn.pixabay.com/photo/2015/11/20/03/53/package-1052370_640.jpg',
      name: 'Leather Bag',
      price: 899.00,
      description: 'A stylish and durable leather bag crafted from premium materials. Spacious compartments provide ample storage, making it perfect for work, travel, or daily use.',
      category: 'Accessories',
      sizes: [],
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fashion Shop"),
        backgroundColor: Colors.deepPurple,
      ),
      drawer: DrawerMenu(),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage("https://cdn.pixabay.com/photo/2017/08/06/00/03/fashion-2581014_1280.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.builder(
          padding: EdgeInsets.all(16),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (_) => ProductDetail(product: product),
                ));
              },
              child: Card(
                color: Colors.white70,
                margin: EdgeInsets.symmetric(vertical: 10),
                child: ListTile(
                  leading: Image.network(product.image, width: 60),
                  title: Text(product.name),
                  subtitle: Text("₱${product.price}"),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
