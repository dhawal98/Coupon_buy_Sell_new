import 'package:coupon_app/utils/constants/image_strings.dart';
import 'package:coupon_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TLoginHeader extends StatelessWidget {
  const TLoginHeader({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          height: 150,
          image: AssetImage(
              dark ? TImages.lightAppLogo : TImages.darkAppLogo),
        ),
        Text('Welcome back',
            style: Theme.of(context).textTheme.bodyMedium),
        const SizedBox(height: TSizes.sm),
        Text('Discover limitless choices & unmatched convinence',
            style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}
