import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Product {
  final String image;
  final String name;
  final double price;
  final String description;
  final String category;
  final List<String> sizes;

  Product({
    required this.image,
    required this.name,
    required this.price,
    required this.description,
    required this.category,
    required this.sizes,
  });
}

class MyApp extends StatelessWidget {
  final List<Color> cardColors = [
    Color(0xFFF7D2FF),
    Color(0xFFC0D7FF),
    Color(0xFFBEC1FF),
    Color(0xFFC8B3FF),
    Color(0xFFC3F9FF),
  ];

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
      description: 'These sneakers are built for comfort and durability.',
      category: 'Shoes',
      sizes: ['38', '39', '40', '41', '42', '43'],
    ),
    Product(
      image: 'https://cdn.pixabay.com/photo/2014/08/26/21/49/jeans-428614_640.jpg',
      name: 'Denim Jeans',
      price: 699.00,
      description: 'These denim jeans offer a perfect balance of style and comfort.',
      category: 'Jeans',
      sizes: ['28', '30', '32', '34', '36'],
    ),
    Product(
      image: 'https://cdn.pixabay.com/photo/2015/11/20/03/53/package-1052370_640.jpg',
      name: 'Leather Bag',
      price: 899.00,
      description: 'A stylish and durable leather bag crafted from premium materials.',
      category: 'Accessories',
      sizes: [],
    ),
    Product(
      image: 'https://cdn.pixabay.com/photo/2015/11/19/08/45/bag-1050607_640.jpg',
      name: 'Purses',
      price: 799.00,
      description: 'Lightweight yet durable, the perfect addition to your accessories.',
      category: 'Accessories',
      sizes: [],
    ),
    Product(
      image: 'https://cdn.pixabay.com/photo/2024/09/14/14/24/ai-generated-9047225_640.png',
      name: 'Handbag Purse',
      price: 599.00,
      description: 'This chic handbag purse exudes sophistication and style.',
      category: 'Accessories',
      sizes: [],
    ),
    Product(
      image: 'https://cdn.pixabay.com/photo/2017/10/29/20/27/earrings-2900740_640.jpg',
      name: 'Earring Swallows',
      price: 299.00,
      description: 'A delicate and artistic pair of earrings inspired by nature.',
      category: 'Accessories',
      sizes: [],
    ),
    Product(
      image: 'https://cdn.pixabay.com/photo/2016/12/01/14/39/rose-gold-1875469_1280.jpg',
      name: 'Rose Gold Jewellery',
      price: 399.00,
      description: 'A stunning collection of rose gold jewelry crafted for a timeless look.',
      category: 'Accessories',
      sizes: [],
    ),
    Product(
      image: 'https://cdn.pixabay.com/photo/2023/09/02/11/43/woman-8228714_640.jpg',
      name: 'Summer Blouse',
      price: 250.00,
      description: 'A light and breezy blouse perfect for warm days.',
      category: 'Tops',
      sizes: ['XS', 'S', 'M', 'L', 'XL'],
    ),
    Product(
      image: 'https://cdn.pixabay.com/photo/2015/09/04/23/28/boots-923189_640.jpg',
      name: 'Boots',
      price: 799.00,
      description: 'Durable and stylish boots perfect for any season.',
      category: 'Shoes',
      sizes: ['38', '39', '40', '41', '42', '43'],
    ),
    Product(
      image: 'https://cdn.pixabay.com/photo/2015/01/03/17/58/shoes-587648_1280.jpg',
      name: 'Merrell Shoes',
      price: 999.00,
      description: 'Built for adventure, these shoes offer maximum comfort and support.',
      category: 'Shoes',
      sizes: ['38', '39', '40', '41', '42', '43'],
    ),
    Product(
      image: 'https://cdn.pixabay.com/photo/2013/09/25/18/35/sandals-186437_640.jpg',
      name: 'Beach Sandals',
      price: 299.00,
      description: 'Lightweight and breathable sandals ideal for summer vacations.',
      category: 'Shoes',
      sizes: ['38', '39', '40', '41', '42', '43'],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product List',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Product List'),
          backgroundColor: cardColors[3],
        ),
        body: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            final bgColor = cardColors[index % cardColors.length];

            return Card(
              color: bgColor,
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  contentPadding: EdgeInsets.all(8),
                  leading: Image.network(
                    product.image,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                  title: Text(product.name,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 4),
                      Text(product.description,
                          maxLines: 2, overflow: TextOverflow.ellipsis),
                      Text('Category: ${product.category}'),
                      Text('Price: ₱${product.price.toStringAsFixed(2)}'),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
