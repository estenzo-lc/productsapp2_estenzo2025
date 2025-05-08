class Product {
  final String id; // Add this line
  final String image;
  final String name;
  final double price;
  final String description;
  final String category;
  final List<String> sizes;

  Product({
    required this.id, // Ensure this is included in the constructor
    required this.image,
    required this.name,
    required this.price,
    required this.description,
    required this.category,
    required this.sizes,
  });
}