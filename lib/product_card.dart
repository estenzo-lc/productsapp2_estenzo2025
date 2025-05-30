import 'package:flutter/material.dart';
import 'product.dart';
import 'config.dart';

class ProductCardWidget extends StatelessWidget {
  final Product product;
  final double width;

  const ProductCardWidget({
    super.key,
    required this.product,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    // Your pastel color palette
    const Color cardBackground = Color(0xFFC3F9FF); // Light cyan
    const Color priceBackground = Color(0xFFF7D2FF); // Light pink
    const Color borderColor = Color(0xFFC8B3FF); // Soft purple
    const Color shadowColor = Color.fromARGB(
      100,
      200,
      179,
      255,
    ); // Transparent purple

    return Container(
      width: width,
      margin: const EdgeInsets.only(right: 12, bottom: 10),
      decoration: BoxDecoration(
        color: cardBackground,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: borderColor.withOpacity(0.5)),
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            child: SizedBox(
              height: width * 0.6,
              width: double.infinity,
              child:
                  (product.imagePath != null && product.imagePath!.isNotEmpty)
                      ? Image.network(
                        '${AppConfig.baseUrl}/storage/${product.imagePath}',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                            'assets/placeholder.png',
                            fit: BoxFit.cover,
                          );
                        },
                      )
                      : Image.asset(
                        'assets/placeholder.png',
                        fit: BoxFit.cover,
                      ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                Text(
                  product.description,
                  style: const TextStyle(fontSize: 13, color: Colors.black87),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 14, right: 14, bottom: 12),
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: priceBackground,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: shadowColor,
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: const Text(
                  '₱0.00', // Placeholder, replaced dynamically below
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
