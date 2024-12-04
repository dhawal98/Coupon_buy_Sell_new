import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coupon_app/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:coupon_app/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:coupon_app/features/authentication/screens/home/coupon_details.dart';
import 'package:flutter/material.dart';
import 'package:coupon_app/common/widgets/layouts/grid_layout.dart';
import 'package:coupon_app/common/widgets/products/products_cards/product_card_vertical.dart';
import 'package:coupon_app/common/widgets/texts/section_heading.dart';
import 'package:coupon_app/features/authentication/screens/home/widgets/home_appbar.dart';
import 'package:coupon_app/features/authentication/screens/home/widgets/home_categories.dart';
import 'package:coupon_app/features/authentication/screens/home/widgets/promo_slider.dart';
import 'package:coupon_app/utils/constants/image_strings.dart';
import 'package:coupon_app/utils/constants/sizes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> coupons = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchCoupons();
  }

  Future<void> fetchCoupons() async {
    try {
      final snapshot =
          await FirebaseFirestore.instance.collection('market').get();
      final List<Map<String, dynamic>> loadedCoupons = snapshot.docs.map((doc) {
        final data = doc.data();
        return {
          'companyName': data['company'] ?? 'Unknown',
          'title': data['type'] ?? 'No Type',
          'price': data['price'] ?? 'N/A',
          'imageUrl': data['link'] ?? '', // Ensure image URLs are valid
          'code': data['Code'] ?? 'No Code',
          'description': data['description'] ?? 'No Description',
        };
      }).toList();

      setState(() {
        coupons = loadedCoupons;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      // Log or show error
      debugPrint('Error fetching coupons: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TPrimaryHeaderContainer(
              child: Column(
                children: [
                  THomeAppBar(),
                  SizedBox(height: TSizes.spaceBtwInputFeild),
                  TSearchContainer(text: 'Search in Store'),
                  SizedBox(height: TSizes.spaceBtwSections),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: TSizes.defaultSpace / 2),
                    child: Column(
                      children: [
                        TSectionHeading(
                          title: 'Popular Categories',
                          showActionButton: false,
                          textColor: Colors.white,
                        ),
                        SizedBox(height: TSizes.spaceBtwItems),
                        THomeCategories(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  const TPromoSlider(banners: [
                    TImages.baner1,
                    TImages.baner2,
                    TImages.baner3,
                  ]),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  TSectionHeading(
                    title: 'Popular Products',
                    onPressed: () {},
                    showActionButton: false,
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : // Update in TGridLayout inside _HomeScreenState
                      TGridLayout(
                          itemCount: coupons.length,
                          itemBuilder: (_, index) {
                            final coupon = coupons[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        CouponDetailScreen(coupon: coupon),
                                  ),
                                );
                              },
                              child: CouponCard(coupon: coupon),
                            );
                          },
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Custom CouponCard for attractive display
class CouponCard extends StatelessWidget {
  final Map<String, dynamic> coupon;

  const CouponCard({required this.coupon, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            'https://img.freepik.com/premium-vector/discount-coupon-voucher-3d-style-sale_649512-2001.jpg',
            height: 120,
            width: double.infinity,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => const Icon(
              Icons.image_not_supported,
              size: 100,
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  coupon['companyName'],
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  coupon['title'],
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${coupon['price']}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Handle "Get Code" button action
                      },
                      child: const Text('Get Code'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
