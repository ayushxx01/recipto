import 'package:flutter/material.dart';

// CoinDisplay widget (now with static asset)
class CoinDisplay extends StatelessWidget {
  final int coins;

  const CoinDisplay({super.key, required this.coins});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/coin.png', // Static asset path
          height: 16,
          width: 16,
        ),
        const SizedBox(width: 4),
        Text(
          coins.toString(),
          style: const TextStyle(fontSize: 14),
        ),
      ],
    );
  }
}
