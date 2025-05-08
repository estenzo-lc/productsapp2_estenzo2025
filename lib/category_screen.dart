import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'product.dart';
import 'category_detail_screen.dart';
import 'app_state.dart'; // <-- import your app state

class CategoriesScreen extends StatelessWidget {
  final List<Product> products;

  CategoriesScreen({required this.products});

  // Translations
  final Map<String, Map<String, String>> localizedTexts = {
    'en': {
      'title': 'Categories',
      'Hoodies': 'Hoodies',
      'Shoes': 'Shoes',
      'Jeans': 'Jeans',
      'Sweaters': 'Sweaters',
      'Accessories': 'Accessories',
      'Tops': 'Tops',
    },
    'fil': {
      'title': 'Mga Kategorya',
      'Hoodies': 'Hudy',
      'Shoes': 'Sapatos',
      'Jeans': 'Maong',
      'Sweaters': 'Panglamig',
      'Accessories': 'Aksesorya',
      'Tops': 'Pang-itaas',
    },
  };

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
    return Consumer<AppState>(
      builder: (context, appState, _) {
        final lang = appState.language;
        final themeColor = appState.themeColor;

        return Scaffold(
          appBar: AppBar(
            leading: BackButton(color: Colors.black),
            title: Text(
              localizedTexts[lang]!['title']!,
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: themeColor.withOpacity(0.4),
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.black),
          ),
          backgroundColor: themeColor.withOpacity(0.2),
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
                final translatedName = localizedTexts[lang]![category['name']!] ?? category['name']!;

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
                    color: themeColor.withOpacity(0.3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(category['icon']!, style: TextStyle(fontSize: 40)),
                        SizedBox(height: 10),
                        Text(
                          translatedName,
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
      },
    );
  }
}
