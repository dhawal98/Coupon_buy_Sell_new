import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coupon_app/common/widgets/Appbar/appbar.dart';
import 'package:coupon_app/common/widgets/product_cart/cart_menu_icon.dart';
// import 'package:coupon_app/features/authentication/screens/Login/login.dart';
import 'package:coupon_app/utils/constants/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:get/get.dart';

class THomeAppBar extends StatefulWidget {
  const THomeAppBar({
    super.key,
  });

  @override
  State<THomeAppBar> createState() => _THomeAppBarState();
}

class _THomeAppBarState extends State<THomeAppBar> {
  @override
  void initState() {
    super.initState();
    getValues();
  }

  String name = "";

  Future<void> getValues() async {
    final email = FirebaseAuth.instance.currentUser!.email;
    final data =
        await FirebaseFirestore.instance.collection('users').doc(email).get();
    if (data.exists) {
      setState(() {
        name = '${data['name']} ${data['lastName']}';
      });
    }
    return;
  }

  @override
  Widget build(BuildContext context) {
    return TAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Good Day For Shopping',
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: Colors.grey),
          ),
          GestureDetector(
            child: Text(
              'Hello, $name',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .apply(color: Colors.white),
            ),
          ),
        ],
      ),
      actions: [
        TCartCounterIcon(
          onPressed: () {},
          iconColor: TColors.white,
        )
      ],
    );
  }
}
