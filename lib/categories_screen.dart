import 'package:flutter/material.dart';
import 'category_service.dart';
import 'product_service.dart';
import 'product.dart';
import 'product_card.dart';
import '/models/background_model.dart';
import '/models/language_model.dart';
import 'package:provider/provider.dart';

class CategoriesScreen extends StatefulWidget {
  final int initialCategoryId;
  final String initialCategoryName;
  const CategoriesScreen({
    super.key,
    required this.initialCategoryId,
    required this.initialCategoryName,
  });

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  late int selectedCategoryId;
  late String selectedCategoryName;
  late Future<List<Map<String, dynamic>>> _categoriesFuture;
  int _currentPage = 1;
  bool _isLoadingMore = false;
  bool _hasMore = true;
  List<Product> _products = [];
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    selectedCategoryId = widget.initialCategoryId;
    selectedCategoryName = widget.initialCategoryName;
    _categoriesFuture = CategoryService.getCategories();
    _fetchInitialProducts();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _fetchInitialProducts() async {
    setState(() {
      _currentPage = 1;
      _products = [];
      _hasMore = true;
      _isLoadingMore = false;
    });
    await _fetchProductsPage();
  }

  Future<void> _fetchProductsPage() async {
    if (!_hasMore || _isLoadingMore) return;
    setState(() {
      _isLoadingMore = true;
    });
    try {
      final result = await ProductService.fetchProductsByCategoryPaginated(
        selectedCategoryId,
        _currentPage,
      );
      setState(() {
        _products.addAll(result['products']);
        _hasMore = result['hasMore'];
        _isLoadingMore = false;
        _currentPage++;
      });
    } catch (e) {
      setState(() {
        _isLoadingMore = false;
      });
    }
  }

  void _onCategorySelected(int id, String name) {
    setState(() {
      selectedCategoryId = id;
      selectedCategoryName = name;
    });
    _fetchInitialProducts();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 200 &&
        !_isLoadingMore &&
        _hasMore) {
      _fetchProductsPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    final backgroundModel = Provider.of<Backgroundmodel>(context);
    final languageModel = Provider.of<LanguageModel>(context);
    final isFilipino = languageModel.isFilipino();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          isFilipino ? 'Mga Produkto ng Kategorya' : 'Category Products',
        ),
        backgroundColor: backgroundModel.appBar,
      ),
      backgroundColor: backgroundModel.background,
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _categoriesFuture,
        builder: (context, catSnapshot) {
          if (catSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (catSnapshot.hasError) {
            return Center(child: Text('Error: ${catSnapshot.error}'));
          } else if (!catSnapshot.hasData || catSnapshot.data!.isEmpty) {
            return const Center(child: Text('No categories found.'));
          }

          final categories = catSnapshot.data!;
          final dropdownItems =
              categories
                  .map<DropdownMenuItem<int>>(
                    (cat) => DropdownMenuItem<int>(
                      value: cat['id'],
                      child: Text(cat['name']),
                    ),
                  )
                  .toList();

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                child: DropdownButtonFormField<int>(
                  value: selectedCategoryId,
                  decoration: InputDecoration(
                    labelText:
                        isFilipino ? 'Pumili ng Kategorya' : 'Select Category',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  items: dropdownItems,
                  onChanged: (int? newValue) {
                    if (newValue != null) {
                      final selected = categories.firstWhere(
                        (element) => element['id'] == newValue,
                      );
                      _onCategorySelected(selected['id'], selected['name']);
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  selectedCategoryName,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: GridView.builder(
                  controller: _scrollController,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 0.70,
                  ),
                  itemCount: _products.length + (_isLoadingMore ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index < _products.length) {
                      return ProductCardWidget(
                        product: _products[index],
                        width: (MediaQuery.of(context).size.width - 64) / 2,
                      );
                    } else {
                      return const Center(
                        child: Padding(
                          padding: EdgeInsets.all(16),
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
