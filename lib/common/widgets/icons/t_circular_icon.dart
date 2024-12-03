import 'package:coupon_app/utils/constants/colors.dart';
import 'package:coupon_app/utils/constants/sizes.dart';
import 'package:coupon_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class TCircularIcon extends StatelessWidget {
  const TCircularIcon({
    super.key,
    this.width,
    this.height,
    this.size = TSizes.lg,
    required this.icon,
    this.color,
    this.backgroundColor,
    this.onPressed,
    // required this.dark,
  });

  final double? width, height, size;
  final IconData icon;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  // final bool dark;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      width: width,
      height: height,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor != null
              ? backgroundColor!
              : THelperFunction.isDarkMode(context)
                  ? TColors.block.withOpacity(0.9)
                  : TColors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(100),

          // borderRadius: BorderRadius.circular(100),
          // color: dark
          //     ? Colors.black.withOpacity(0.9)
          //     : Colors.white.withOpacity(0.9),
        ),
        child: IconButton(
            onPressed: onPressed,
            icon: Icon(
              icon,
              color: color,
              size: size,
            )),
      ),
    );
  }
}
