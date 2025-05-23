import 'package:flutter/material.dart';
import 'product.dart';
import 'product_detail.dart';
import 'drawer_menu.dart';
import 'cart_screen.dart';

class HomeScreen extends StatelessWidget {
  final List<Product> products = [
     Product(
      id: 'p1',
      image: 'https://cdn.pixabay.com/photo/2017/03/28/17/53/hoodie-2182849_640.jpg',
      name: 'Hoodie',
      price: 499.00,
      description: 'This hoodie is designed for both comfort and style. Made from high-quality cotton blend, it provides warmth during chilly weather.',
      category: 'Hoodies',
      sizes: ['S', 'M', 'L', 'XL'],
    ),
    Product(
      id: 'p2',
      image: 'https://cdn.pixabay.com/photo/2016/06/03/17/35/shoes-1433925_640.jpg',
      name: 'Sneakers',
      price: 799.00,
      description: 'These sneakers are built for comfort and durability. The breathable mesh upper keeps your feet cool and dry all day long.',
      category: 'Shoes',
      sizes: ['38', '39', '40', '41', '42', '43'],
    ),
    Product(
      id: 'p3',
      image: 'https://cdn.pixabay.com/photo/2014/08/26/21/49/jeans-428614_640.jpg',
      name: 'Denim Jeans',
      price: 699.00,
      description: 'These denim jeans offer a perfect balance of style and comfort. Crafted from high-quality denim fabric, they provide a snug yet flexible fit.',
      category: 'Jeans',
      sizes: ['28', '30', '32', '34', '36'],
    ),
    Product(
      id: 'p4',
      image: 'https://cdn.pixabay.com/photo/2015/11/20/03/53/package-1052370_640.jpg',
      name: 'Leather Bag',
      price: 899.00,
      description: 'A stylish and durable leather bag crafted from premium materials. Spacious compartments provide ample storage, making it perfect for work, travel, or daily use.',
      category: 'Accessories',
      sizes: [],
    ),
    Product(
      id: 'p5',
      image: 'https://cdn.pixabay.com/photo/2015/11/19/08/45/bag-1050607_640.jpg',
      name: 'Purses',
      price: 799.00,
      description: 'Lightweight yet durable, it’s the perfect addition to your accessory collection.',
      category: 'Accessories',
      sizes: [],
    ),
    Product(
      id: 'p6',
      image: 'https://cdn.pixabay.com/photo/2024/09/14/14/24/ai-generated-9047225_640.png',
      name: 'Handbag Purse',
      price: 599.00,
      description: 'This chic handbag purse exudes sophistication and style. Its structured design ensures durability while offering enough space for your daily essentials.',
      category: 'Accessories',
      sizes: [],
    ),
    Product(
      id: 'p7',
      image: 'https://cdn.pixabay.com/photo/2017/10/29/20/27/earrings-2900740_640.jpg',
      name: 'Earring Swallows',
      price: 299.00,
      description: 'A delicate and artistic pair of earrings inspired by nature. Featuring a unique swallow design, these earrings add a touch of elegance to any outfit.',
      category: 'Accessories',
      sizes: [],
    ),
    Product(
      id: 'p8',
      image: 'https://cdn.pixabay.com/photo/2016/12/01/14/39/rose-gold-1875469_1280.jpg',
      name: 'Rose Gold Jewellery',
      price: 399.00,
      description: 'A stunning collection of rose gold jewelry crafted for a timeless look. Each piece showcases intricate detailing and a radiant shine. Ideal for special occasions, this jewelry set adds a touch of glamour to any outfit.',
      category: 'Accessories',
      sizes: [],
    ),
    Product(
      id: 'p9',
      image: 'https://cdn.pixabay.com/photo/2023/09/02/11/43/woman-8228714_640.jpg',
      name: 'Summer Blouse',
      price: 250.00,
      description: 'A light and breezy blouse perfect for warm days. Features a flowy design with soft fabric that keeps you comfortable all day.',
      category: 'Tops',
      sizes: ['XS', 'S', 'M', 'L', 'XL'],
    ),
    Product(
      id: 'p10',
      image: 'https://cdn.pixabay.com/photo/2015/09/04/23/28/boots-923189_640.jpg',
      name: 'Boots',
      price: 799.00,
      description: 'Durable and stylish boots perfect for any season. Made with high-quality leather, they provide excellent support and protection against the elements.',
      category: 'Shoes',
      sizes: ['38', '39', '40', '41', '42', '43'],
    ),
      Product(
         id: 'p11',
      image: 'https://cdn.pixabay.com/photo/2015/01/03/17/58/shoes-587648_1280.jpg',
      name: 'Merrell Shoes',
      price: 999.00,
      description: 'Built for adventure, these shoes offer maximum comfort and support. Featuring a rugged sole for excellent grip, they are ideal for hiking, walking, or casual wear.',
      category: 'Shoes',
      sizes: ['38', '39', '40', '41', '42', '43'],
    ),
     Product(
       id: 'p12',
      image: 'https://cdn.pixabay.com/photo/2013/09/25/18/35/sandals-186437_640.jpg',
      name: 'Beach Sandals',
      price: 299.00,
      description: 'Lightweight and breathable sandals ideal for summer vacations. Their slip-on design ensures convenience, making them perfect for beach trips or casual outings.',
      category: 'Shoes',
      sizes: ['38', '39', '40', '41', '42', '43'],
    ),
      Product(
         id: 'p13',
      image: 'https://cdn.pixabay.com/photo/2014/05/30/05/00/shoes-357897_640.jpg',
      name: 'Leather Sandals',
      price: 399.00,
      description: 'Classic and comfortable leather sandals designed for all-day wear. The cushioned sole provides excellent support, while the stylish straps enhance the look.',
      category: 'Shoes',
      sizes: ['38', '39', '40', '41', '42', '43'],
    ),
      Product(
         id: 'p14',
      image: 'https://cdn.pixabay.com/photo/2016/08/20/21/37/jaffa-1608610_640.jpg',
      name: 'Jaffa Jeans',
      price: 599.00,
      description: ' Stylish and comfortable jeans with a relaxed fit. The high-quality denim fabric ensures durability while providing a soft, flexible feel.',
      category: 'Jeans',
      sizes: ['36', '37', '38', '39', '40', '41', '42', '43'],
    ),
    Product(
       id: 'p15',
      image: 'https://cdn.pixabay.com/photo/2017/11/26/19/50/jeans-2979818_640.jpg',
      name: 'Jean Trousers',
      price: 699.00,
      description: 'A perfect blend of casual and formal style. These jean trousers offer a sleek silhouette while maintaining comfort throughout the day.',
      category: 'Jeans',
      sizes: ['36', '37', '38', '39', '40', '41', '42', '43'],
    ),
    Product(
       id: 'p16',
      image: 'https://cdn.pixabay.com/photo/2017/06/27/07/51/summer-2446567_640.jpg',
      name: 'Summer Flower Jeans',
      price: 699.00,
      description: 'Unique and trendy jeans featuring floral prints for a fresh summer look. Lightweight and breathable, they add a fun twist to your denim collection.',
      category: 'Jeans',
      sizes: ['36', '37', '38', '39', '40', '41', '42', '43'],
    ),
    Product(
       id: 'p17',
      image: 'https://cdn.pixabay.com/photo/2017/10/16/14/28/style-2857387_640.jpg',
      name: 'Style Tall Heel',
      price: 699.00,
      description: 'Elegant high-heeled shoes that exude confidence and sophistication. The sleek design makes them ideal for formal events or nights out.',
      category: 'Shoes',
      sizes: ['36', '37', '38', '39', '40', '41', '42', '43'],
    ),
     Product(
       id: 'p18',
      image: 'https://cdn.pixabay.com/photo/2018/05/22/09/46/vest-3420937_640.jpg',
      name: 'Fur Coat',
      price: 999.00,
      description: 'Elevate your winter fashion with this luxurious fur coat. Made with soft and warm materials, it provides insulation without compromising style. Perfect for formal events or adding an elegant touch to everyday outfits.',
      category: 'Hoodies',
      sizes: ['XS', 'S', 'M', 'L', 'XL'],
    ),
    Product(
       id: 'p19',
      image: 'https://cdn.pixabay.com/photo/2015/09/19/15/47/jacket-947395_640.jpg',
      name: 'Leather Coat',
      price: 1000.00,
      description: 'A bold and timeless statement piece for any wardrobe. This leather coat offers a sleek, structured fit while providing warmth and durability. The soft inner lining ensures comfort, making it ideal for both casual and formal settings.',
      category: 'Hoodies',
      sizes: ['XS', 'S', 'M', 'L', 'XL'],
    ),
    Product(
       id: 'p20',
      image: 'https://cdn.pixabay.com/photo/2018/02/02/04/48/sweater-3124635_640.jpg',
      name: 'Woolen Sweater',
      price: 500.00,
      description: 'tay warm and stylish with this cozy woolen sweater. Made from premium-quality wool, it provides excellent insulation while remaining soft and comfortable.',
      category: 'Sweaters',
      sizes: ['XS', 'S', 'M', 'L', 'XL'],
    ),
    Product(
       id: 'p21',
      image: 'https://cdn.pixabay.com/photo/2022/09/27/07/40/sweater-7482269_640.jpg',
      name: 'Sweater Knitting Warm',
      price: 600.00,
      description: 'This beautifully knitted sweater is designed to keep you warm and stylish. Crafted from soft, high-quality wool, it offers a cozy feel without being too heavy. The intricate knit pattern adds a touch of elegance, making it perfect for both casual and semi-formal occasions. With a relaxed fit and ribbed cuffs, it ensures maximum comfort during chilly days. A must-have staple for your winter wardrobe!',
      category: 'Sweaters',
      sizes: ['XS', 'S', 'M', 'L', 'XL'],
    ),
    Product(
       id: 'p22',
      image: 'https://cdn.pixabay.com/photo/2014/08/26/21/49/sweater-428616_640.jpg',
      name: 'Sweater Shirts',
      price: 499.00,
      description: 'A perfect blend of warmth and casual style, these sweater shirts offer comfort and versatility. Made from a soft cotton-wool blend, they provide insulation while remaining breathable. The lightweight design makes them ideal for layering or wearing alone in cooler weather.',
      category: 'Sweaters',
      sizes: ['XS', 'S', 'M', 'L', 'XL'],
    ),
     Product(
       id: 'p23',
      image: 'https://cdn.pixabay.com/photo/2023/07/01/13/21/woman-8100157_640.jpg',
      name: 'Beach Blouse',
      price: 350.00,
      description: 'Light, breezy, and effortlessly stylish, this beach blouse is perfect for warm, sunny days. Made from breathable, flowy fabric, it keeps you cool and comfortable while adding a touch of elegance to your beachwear. ',
      category: 'Tops',
      sizes: ['XS', 'S', 'M', 'L', 'XL'],
    ),
  ];

  void _logout(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Logout'),
        content: Text('Are you sure you want to log out?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pushReplacementNamed(context, '/'),
            child: Text('Logout'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerMenu(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('ESTENZO STORE', style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {
              // Search functionality (optional)
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.black),
            onPressed: () => Navigator.pushNamed(context, '/cart'),
          ),
          IconButton(
            icon: Icon(Icons.logout, color: Colors.black),
            onPressed: () => _logout(context),
          ),
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            // Background Image
            Positioned.fill(
              child: Image.network(
                'https://cdn.pixabay.com/photo/2013/12/04/12/24/window-223391_1280.jpg',
                fit: BoxFit.cover,
              ),
            ),
            // Content Area
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(16.0),
                    color: Colors.black54,
                    child: Column(
                      children: [
                        Text(
                          'Welcome to Our Clothing Store!',
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            // Optional: Scroll to products or open category
                          },
                          child: Text('Shop Now'),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  GridView.builder(
                    padding: EdgeInsets.all(16.0),
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16.0,
                      mainAxisSpacing: 16.0,
                      childAspectRatio: 0.75,
                    ),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetail(product: product),
                            ),
                          );
                        },
                        child: Card(
                          elevation: 3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.network(product.image, height: 100, fit: BoxFit.cover),
                              SizedBox(height: 8),
                              Text(product.name, style: TextStyle(fontSize: 18)),
                              SizedBox(height: 4),
                              Text('₱${product.price.toStringAsFixed(2)}', style: TextStyle(fontSize: 16)),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: "Categories"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Cart"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          switch (index) {
            case 1:
              Navigator.pushNamed(context, '/categories');
              break;
            case 2:
              Navigator.pushNamed(context, '/cart');
              break;
            case 3:
              Navigator.pushNamed(context, '/profile'); // ✅ Navigate to Profile screen
              break;
            default:
              break;
          }
        },
      ),
    );
  }
}
