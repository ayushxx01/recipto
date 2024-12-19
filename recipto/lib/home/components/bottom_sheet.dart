import 'package:flutter/material.dart';

// Reusable Bottom Navigation Bar Widget
class MyBottomNavigationBar extends StatelessWidget {
  const MyBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 5.0,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Proof of transaction',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const Text(
            'Scan Receipt/share payment screenshot to earn',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.grey)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Share Payment Image',
                        style: TextStyle(color: Color(0xFF5764DA)),
                      ),
                      SizedBox(width: 5),
                      Image.asset(
                        'assets/images/upi.png',
                        height: 15,
                        width: 55,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: const Color(0xFF5764DA), // Blue background color
            ),
            child: const Center(
              child: Text(
                'Scan Receipt',
                style: TextStyle(color: Colors.white), // White text color
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Example usage in a screen widget
class MyScreen extends StatelessWidget {
  const MyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Screen'),
      ),
      body: const Center(
        child: Text('Main Content'),
      ),
      bottomNavigationBar:
          const MyBottomNavigationBar(), // Use the imported widget
    );
  }
}
