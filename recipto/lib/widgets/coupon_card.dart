import 'package:flutter/material.dart';

class CouponCard extends StatelessWidget {
  final String imagePath;
  final double imageHeight;
  final double imageWidth;
  final String title1;
  final String title2;
  final List<Color> color;
  final String button;

  const CouponCard({
    super.key,
    required this.imagePath,
    required this.imageHeight,
    required this.imageWidth,
    required this.title1,
    required this.title2,
    required this.color,
    required this.button,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        height: 300, // Adjusted height of the container
        width: 50,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: color,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(8),
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
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Flexible(
              flex: 1,
              child: Text(
                title2,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Flexible(child: Image.asset('assets/images/dotted.png')),
            const SizedBox(
              height: 10,
            ),
            Flexible(
              flex: 1,
              child: ElevatedButton(
                onPressed: () {
                  print(button);
                },
                child: Text(button),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
