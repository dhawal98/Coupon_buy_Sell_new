import 'package:coupon_app/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:flutter/material.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    // Define a list of image paths and titles
    final List<Map<String, dynamic>> categories = [
      {'image': 'assets/icons/categories/cash-payment.png', 'title': 'CASH'},
      {'image': 'assets/icons/categories/cheers.png', 'title': 'DIGITAL'},
      {
        'image': 'assets/icons/categories/groceries-store.png',
        'title': 'STOREs'
      },
      {'image': 'assets/icons/categories/shopping-mall.png', 'title': 'MALLs'},
      {'image': 'assets/icons/categories/travel.png', 'title': 'TRAVELs'},
      {'image': 'assets/icons/categories/kpdee.png', 'title': 'CLOTHs'},
      // {'image': 'assets/icons/categories/kpdee.png', 'title': 'Cat43', 'screen': Screen23()},
//
    ];

    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          final category = categories[index];
          return TVerticalImageText(
            image: category['image'] ?? '',
            title: category['title'] ?? '',
            onTop: () {
              // Navigator.push(context,
              // MaterialPageRoute(builder: (_) => category['screen']));
            },
          );
        },
      ),
    );
  }
}
