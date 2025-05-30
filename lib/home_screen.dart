import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'product_card.dart';
import 'product.dart';
import 'create_new_product.dart';
import 'user_preference.dart';
import 'myproduct_screen.dart';
import '/models/background_model.dart';
import '/models/language_model.dart';
import 'product_service.dart';
import 'category_service.dart';
import 'categories_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'config.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Product>> _productsFuture;
  int? userId;
  String? userName;
  String? userEmail;

  @override
  void initState() {
    super.initState();
    _productsFuture = ProductService.fetchProducts();
    _loadUserInfo();
  }

  void _loadUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    final id = prefs.getInt('user_id');
    final name = prefs.getString('user_name');
    final email = prefs.getString('user_email');
    setState(() {
      userId = id;
      userName = name;
      userEmail = email;
    });
  }

  @override
  Widget build(BuildContext context) {
    final backgroundModel = Provider.of<Backgroundmodel>(context);
    final languageModel = Provider.of<LanguageModel>(context);
    final themeColor = backgroundModel.accent;
    final bool isFilipino = languageModel.isFilipino();
    final String createProductText =
        isFilipino ? "Lumikha ng Produkto" : "Create Product";
    final String userPreferencesText =
        isFilipino ? "Mga Setting ng User" : "User Preferences";
    final String myProductsText =
        isFilipino ? "Aking mga Produkto" : "My Products";

    return Scaffold(
      backgroundColor: backgroundModel.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundModel.appBar,
        title: const Text(
          "Angels Fashion App",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_bag_outlined),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: backgroundModel.drawerHeader),
              accountName: Text(
                userName ?? 'User',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              accountEmail: Text(userEmail ?? ''),
              currentAccountPicture: CircleAvatar(
                backgroundColor: themeColor,
                child: Text(
                  (userName != null && userName!.isNotEmpty)
                      ? userName![0].toUpperCase()
                      : 'U',
                  style: const TextStyle(fontSize: 32, color: Colors.white),
                ),
              ),
            ),
            _buildDrawerListTile(
              context,
              createProductText,
              Icons.add_circle_outline,
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CreateNewProduct(),
                  ),
                );
              },
            ),
            _buildDrawerListTile(
              context,
              userPreferencesText,
              Icons.settings,
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserPreferencePage()),
                );
              },
            ),
            _buildDrawerListTile(context, myProductsText, Icons.list, () {
              if (userId != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyProductsScreen(userId: userId!),
                  ),
                );
              }
            }),
            _buildDrawerListTile(context, 'Logout', Icons.logout, () async {
              final prefs = await SharedPreferences.getInstance();
              final url = Uri.parse('${AppConfig.baseUrl}/api/auth/logout');
              try {
                await http.post(url, headers: {'Accept': 'application/json'});
              } catch (_) {}
              await prefs.clear();
              if (!mounted) return;
              Navigator.of(
                context,
              ).pushNamedAndRemoveUntil('/login', (route) => false);
            }),
          ],
        ),
      ),
      body: FutureBuilder<List<Product>>(
        future: _productsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: \\${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No products found.'));
          }

          final products = List<Product>.from(snapshot.data!);
          products.shuffle();
          final bestSellers = products.take(8).toList();
          products.shuffle();
          final trending = products.take(4).toList();
          products.shuffle();
          final newArrivals = products.take(3).toList();
          products.shuffle();
          final staffPicks = products.take(4).toList();
          products.shuffle();
          final featured = products.take(3).toList();

          return FutureBuilder<List<Map<String, dynamic>>>(
            future: CategoryService.getCategories(),
            builder: (context, catSnapshot) {
              if (catSnapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (catSnapshot.hasError) {
                return Center(child: Text('Error: \\${catSnapshot.error}'));
              } else if (!catSnapshot.hasData || catSnapshot.data!.isEmpty) {
                return const Center(child: Text('No categories found.'));
              }
              final categories = catSnapshot.data!;

              return ListView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                children: [
                  _buildCategoryChips(categories, backgroundModel, themeColor),
                  const SizedBox(height: 18),
                  _modernSection('Best Sellers', bestSellers, themeColor),
                  _modernSection(
                    'Trending Now',
                    trending,
                    themeColor,
                    grid: true,
                  ),
                  _modernSection('New Arrivals', newArrivals, themeColor),
                  _modernSection(
                    'Staff Picks',
                    staffPicks,
                    themeColor,
                    grid: true,
                  ),
                  _modernSection('Featured', featured, themeColor),
                  const SizedBox(height: 32),
                ],
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildCategoryChips(
    List<Map<String, dynamic>> categories,
    Backgroundmodel backgroundModel,
    Color themeColor,
  ) {
    return SizedBox(
      height: 48,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final cat = categories[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => CategoriesScreen(
                        initialCategoryId: cat['id'],
                        initialCategoryName: cat['name'],
                      ),
                ),
              );
            },
            child: Chip(
              label: Text(cat['name'], style: TextStyle(color: themeColor)),
              backgroundColor: themeColor.withOpacity(0.13),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              side: BorderSide(color: themeColor.withOpacity(0.3)),
            ),
          );
        },
      ),
    );
  }

  Widget _modernSection(
    String title,
    List<Product> products,
    Color themeColor, {
    bool grid = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 6,
              height: 24,
              decoration: BoxDecoration(
                color: themeColor,
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            const SizedBox(width: 10),
            Text(
              title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 12),
        grid
            ? _modernProductGrid(products, themeColor)
            : _modernProductList(products, themeColor),
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _modernProductList(List<Product> products, Color themeColor) {
    return SizedBox(
      height: 250,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        separatorBuilder: (context, index) => const SizedBox(width: 18),
        itemBuilder: (ctx, index) {
          return _modernProductCard(products[index], 180, themeColor, context);
        },
      ),
    );
  }

  Widget _modernProductGrid(List<Product> products, Color themeColor) {
    // Use a fixed card width for grid items
    const double gridCardWidth = 160;
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 0.75,
      ),
      itemCount: products.length > 4 ? 4 : products.length,
      itemBuilder: (ctx, index) {
        return _modernProductCard(
          products[index],
          gridCardWidth, // Use fixed width
          themeColor,
          context,
        );
      },
    );
  }

  Widget _modernProductCard(
    Product product,
    double itemWidth,
    Color themeColor,
    BuildContext context,
  ) {
    return GestureDetector(
      onTap:
          () => Navigator.pushNamed(
            context,
            '/product-details',
            arguments: product,
          ),
      child: Container(
        width: itemWidth,
        margin: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
          boxShadow: [
            BoxShadow(
              color: themeColor.withOpacity(0.10),
              blurRadius: 16,
              offset: const Offset(0, 6),
            ),
          ],
          border: Border.all(color: themeColor.withOpacity(0.13)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: itemWidth * 0.6, // Use proportional height for image area
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(22),
                ),
                child: ProductCardWidget(product: product, width: itemWidth),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    product.description,
                    style: const TextStyle(fontSize: 13, color: Colors.black54),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '₱${product.price.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: themeColor,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerListTile(
    BuildContext context,
    String title,
    IconData icon,
    VoidCallback onTap,
  ) {
    return ListTile(leading: Icon(icon), title: Text(title), onTap: onTap);
  }
}
