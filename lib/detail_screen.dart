import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'product.dart';
import '/models/language_model.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Product product =
        ModalRoute.of(context)!.settings.arguments as Product;
    final languageModel = Provider.of<LanguageModel>(context);
    final isFilipino = languageModel.isFilipino();

    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.4,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          isFilipino ? 'Detalye' : 'Details',
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.pinkAccent),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Product Image
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            clipBehavior: Clip.antiAlias,
            elevation: 4,
            child:
                product.imagePath != null
                    ? Image.network(
                      product.imagePath!,
                      height: 240,
                      fit: BoxFit.cover,
                      errorBuilder:
                          (_, __, ___) => Image.asset(
                            'assets/placeholder.png',
                            height: 240,
                            fit: BoxFit.cover,
                          ),
                    )
                    : Image.asset(
                      'assets/placeholder.png',
                      height: 240,
                      fit: BoxFit.cover,
                    ),
          ),
          const SizedBox(height: 18),

          // Name, Price, Rating
          Row(
            children: [
              Expanded(
                child: Text(
                  product.name,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.pink[50],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  "₱${product.price}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 116, 131), // Corrected color
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              Icon(Icons.star, color: Colors.amber[700], size: 20),
              const SizedBox(width: 4),
              const Text("4.8", style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(width: 6),
              const Text(
                "(1.2k reviews)",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Action Buttons
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  icon: const Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.white,
                  ),
                  label: Text(
                    isFilipino ? "Idagdag sa Cart" : "Add to Cart",
                    style: const TextStyle(color: Colors.white),
                  ),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pinkAccent,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: const BorderSide(color: Colors.pinkAccent),
                  padding: const EdgeInsets.all(14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Icon(
                  Icons.favorite_border,
                  color: Colors.pinkAccent,
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),

          // Comments Section
          Text(
            isFilipino ? "Mga Komento at Rating" : "Comments & Ratings",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 12),
          _buildComment(
            "Angelove D.",
            5,
            isFilipino ? "Napakagandang produkto!" : "Amazing product!",
            "2025-05-20",
          ),
          _buildComment(
            "Grace L.",
            4,
            isFilipino ? "Sulit sa presyo." : "Worth the price.",
            "2025-05-18",
          ),
          _buildComment(
            "Annie S.",
            5,
            isFilipino ? "Bibilhin ko ulit!" : "Will buy again!",
            "2025-05-15",
          ),
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.add_comment, color: Colors.lightBlue),
            label: Text(
              isFilipino ? "Magdagdag ng Komento" : "Add a Comment",
              style: const TextStyle(color: Colors.lightBlue),
            ),
          ),

          const SizedBox(height: 30),

          // Description Section at the End
          Text(
            isFilipino ? 'Deskripsyon ng Produkto' : 'Product Description',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 8),
          Text(
            product.description.isNotEmpty
                ? product.description
                : (isFilipino
                    ? 'Walang deskripsyon.'
                    : 'No description available.'),
            style: const TextStyle(fontSize: 15, height: 1.4),
          ),
        ],
      ),
    );
  }

  Widget _buildComment(String user, int rating, String comment, String date) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(user, style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(width: 8),
              ...List.generate(
                rating,
                (index) =>
                    const Icon(Icons.star, color: Colors.amber, size: 16),
              ),
              ...List.generate(
                5 - rating,
                (index) => const Icon(
                  Icons.star_border,
                  color: Colors.amber,
                  size: 16,
                ),
              ),
              const Spacer(),
              Text(
                date,
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(comment),
        ],
      ),
    );
  }
}
