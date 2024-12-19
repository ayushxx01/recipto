import 'package:flutter/material.dart';
import 'package:recipto/home/components/app_bar_content.dart';
import 'package:recipto/home/components/coin_price.dart';
import 'package:recipto/home/components/bottom_sheet.dart';
import 'package:recipto/widgets/coupon_card.dart';
import 'package:recipto/widgets/product_card.dart'; // Import ProductCard

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isStoreView = true; // Define the isStoreView variable

  final List<CouponData> couponDataList = [
    CouponData(
      imagePath: 'assets/images/party_popper.png',
      imageHeight: 100,
      imageWidth: 150,
      title1: 'Claim your gift',
      title2: 'of 250',
      color: [Color(0xFFEBFAFF), Color(0xFFB8E5FF)],
      button: 'Claim',
    ),
    CouponData(
      imagePath: 'assets/images/cash_back.png',
      imageHeight: 100,
      imageWidth: 150,
      title1: 'Buy ',
      title2: 'For just ₹450',
      color: [Color(0xFFF8EFFC), Color(0xFFEAD3F7)],
      button: 'Get for ₹450',
    ),
    CouponData(
      imagePath: 'assets/images/cash_back_offer.png',
      imageHeight: 100,
      imageWidth: 150,
      title1: 'Shop above ₹899',
      title2: '& get ',
      color: [Color(0xFFFEF9F0), Color(0xFFFFF5E0)],
      button: 'Applied',
    ),
    CouponData(
      imagePath: 'assets/images/store_cash_back.png',
      imageHeight: 100,
      imageWidth: 150,
      title1: 'Purchase in store',
      title2: '& get 5% back',
      color: [Color(0xFFEBFAFF), Color(0xFFB8E5FF)],
      button: 'Applied',
    ),
  ];

  final List<ProductData> productDataList = [
    ProductData(
      imagePath: 'assets/images/product_pedigree.png',
      imageHeight: 100,
      imageWidth: 150,
      title1: 'Drools chicken & egg Adult Dog food',
      title2: '₹120  ₹25 OFF',
      button: 'Claim',
      coins: '110 ',
      originalPrice: 120,
      discountedPrice: 25,
    ),
    ProductData(
      imagePath: 'assets/images/product_squeaky_balls.png',
      imageHeight: 100,
      imageWidth: 150,
      title1: 'ADIDOG Combo if 3 Active Squeaky Balls',
      title2: '₹60  ₹10 OFF',
      button: 'Claim',
      coins: '40 ',
      originalPrice: 60,
      discountedPrice: 10,
    ),
    ProductData(
      imagePath: 'assets/images/product_drools.png',
      imageHeight: 100,
      imageWidth: 150,
      title1: 'Pedigree Dry Dog Food for Puppy (Pack of 2)',
      title2: '₹120 ₹25OFF',
      button: 'Claim',
      coins: '300 ',
      originalPrice: 145,
      discountedPrice: 120,
    ),
    ProductData(
      imagePath: 'assets/images/product_farmina_dog_food.png',
      imageHeight: 100,
      imageWidth: 150,
      title1: 'Farmina vetlife Renal Dog Food',
      title2: '₹120 ₹25 OFF',
      button: 'CLaim',
      coins: '400 ',
      originalPrice: 145,
      discountedPrice: 120,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Colors.white,
              pinned: true,
              floating: true,
              expandedHeight: 50,
              leading: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_back),
              ),
              title: AppBarContent(),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isStoreView = true;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: isStoreView
                                  ? Colors.blue
                                  : Colors.transparent,
                              width: 2.0,
                            ),
                          ),
                        ),
                        child: Text(
                          "Store Visit",
                          style: TextStyle(
                            color: isStoreView ? Colors.blue : Colors.black,
                            fontWeight: isStoreView
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isStoreView = false;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: !isStoreView
                                  ? Colors.blue
                                  : Colors.transparent,
                              width: 2.0,
                            ),
                          ),
                        ),
                        child: Text(
                          "Online",
                          style: TextStyle(
                            color: !isStoreView ? Colors.blue : Colors.black,
                            fontWeight: !isStoreView
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  if (index < couponDataList.length) {
                    return CouponCard(
                      imagePath: couponDataList[index].imagePath,
                      imageHeight: couponDataList[index].imageHeight,
                      imageWidth: couponDataList[index].imageWidth,
                      title1: couponDataList[index].title1,
                      title2: couponDataList[index].title2,
                      color: couponDataList[index].color,
                      button: couponDataList[index].button,
                    );
                  } else if (index <
                      couponDataList.length + productDataList.length) {
                    final productIndex = index - couponDataList.length;
                    return ProductCard(
                      imagePath: productDataList[productIndex].imagePath,
                      imageHeight: productDataList[productIndex].imageHeight,
                      imageWidth: productDataList[productIndex].imageWidth,
                      title1: productDataList[productIndex].title1,
                      title2: productDataList[productIndex].title2,
                      button: productDataList[productIndex].button,
                      coins: productDataList[productIndex].coins,
                      originalPrice:
                          productDataList[productIndex].originalPrice,
                      discountedPrice:
                          productDataList[productIndex].discountedPrice,
                    );
                  } else {
                    return const SizedBox
                        .shrink(); // Handle unexpected data type
                  }
                },
                childCount: couponDataList.length + productDataList.length,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const MyBottomNavigationBar(),
    );
  }
}

class CouponData {
  final String imagePath;
  final double imageHeight;
  final double imageWidth;
  final String title1;
  final String title2;
  final List<Color> color;
  final String button;

  CouponData({
    required this.imagePath,
    required this.imageHeight,
    required this.imageWidth,
    required this.title1,
    required this.title2,
    required this.color,
    required this.button,
  });
}

class ProductData {
  final double originalPrice;
  final double discountedPrice;
  final String imagePath;
  final double imageHeight;
  final double imageWidth;
  final String title1;
  final String title2;
  final String coins;
  final String button;

  ProductData({
    required this.originalPrice,
    required this.discountedPrice,
    required this.imagePath,
    required this.imageHeight,
    required this.imageWidth,
    required this.title1,
    required this.title2,
    required this.button,
    required this.coins,
  });
}
