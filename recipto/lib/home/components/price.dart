import 'package:flutter/material.dart';

class PriceDisplay extends StatelessWidget {
  final double originalPrice;
  final double discountedPrice;
  final double? discountAmount; // Optional discount amount

  const PriceDisplay({
    super.key,
    required this.originalPrice,
    required this.discountedPrice,
    this.discountAmount,
  });

  @override
  Widget build(BuildContext context) {
    final discount = discountAmount ??
        originalPrice - discountedPrice; // Calculate discount if not provided.

    return Row(
      mainAxisSize:
          MainAxisSize.min, // Important: Make Row take only necessary space
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Text(
          '₹${discountedPrice.toStringAsFixed(0)}', // Format discounted price
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(width: 4), // Small space
        Text(
          '₹${originalPrice.toStringAsFixed(0)}', // Format original price
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
            decoration: TextDecoration.lineThrough,
          ),
        ),
        const SizedBox(width: 8), // Slightly larger space
        Text(
          '₹${discount.toStringAsFixed(0)} OFF', // Format discount
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.pink, // Or any color you want
          ),
        ),
      ],
    );
  }
}

// Example usage:
class ExampleWidget extends StatelessWidget {
  const ExampleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Price Display Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const PriceDisplay(
              originalPrice: 145,
              discountedPrice: 120,
            ),
            const SizedBox(height: 20), //spacing
            const PriceDisplay(
              originalPrice: 200,
              discountedPrice: 150,
              discountAmount: 50, // Providing discount amount directly
            ),
            const SizedBox(height: 20), //spacing
            PriceDisplay(
              originalPrice: 99.99, // using double values
              discountedPrice: 79.99,
            ),
          ],
        ),
      ),
    );
  }
}
