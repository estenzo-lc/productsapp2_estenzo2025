// product.dart

class Product {
  final String name;
  final double price;
  final String description;
  final String category;
  final String image;
  final List<String> sizes;

  Product({
    required this.name,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.sizes,
  });
}
