import 'package:flutter/material.dart';
import 'package:recipto/widgets/my_button.dart';

class ProductCard extends StatelessWidget {
  final String imagePath;
  final double imageHeight;
  final double imageWidth;
  final String title1;
  final String title2;
  final String coins;
  final String button;

  const ProductCard({
    super.key,
    required this.imagePath,
    required this.imageHeight,
    required this.imageWidth,
    required this.title1,
    required this.title2,
    required this.button,
    required this.coins,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        height: 300, // Adjusted height of the container
        width: 156,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2), // Shadow color
              spreadRadius: 2, // Spread radius
              blurRadius: 5, // Blur radius
              offset: Offset(0, 3), // Offset in x and y direction
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              flex: 2,
              child: Center(
                child: Image.asset(
                  imagePath,
                  height: imageHeight,
                  width: imageWidth,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Flexible(
              flex: 1,
              child: Text(
                title1,
                style: const TextStyle(
                  fontSize: 14,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            Flexible(
              flex: 1,
              child: Text(
                title2,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            const SizedBox(height: 5),
            Flexible(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/coins.png'),
                  Text(coins),
                  const Spacer(),
                  MyButton(title: button),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
