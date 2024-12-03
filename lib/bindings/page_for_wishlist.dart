import 'package:coupon_app/common/widgets/Appbar/appbar.dart';
// import 'package:coupon_app/common/widgets/product_cart/cart_menu_icon.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class PageForWishlist extends StatelessWidget {
  const PageForWishlist({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
          title: Text('Wishlist',
              style: Theme.of(context).textTheme.headlineMedium),
          actions: const [
            Icon(
              Iconsax.heart5,
              color: Colors.red,
            ),
          ]),
    );
  }
}
