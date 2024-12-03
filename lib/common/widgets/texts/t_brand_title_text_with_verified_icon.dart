import 'package:coupon_app/common/widgets/texts/t_brand_title_text.dart';
import 'package:coupon_app/utils/constants/colors.dart';
import 'package:coupon_app/utils/constants/enums.dart';
import 'package:flutter/material.dart';

class TBrandTitleWithVerifiedIcon extends StatelessWidget {
  const TBrandTitleWithVerifiedIcon({
    super.key, 
    required this.title, 
    this.maxLines = 1, 
    this.textColor, 
    this.iconColor = TColors.primary, 
    this.textAlign = TextAlign.center, 
    this.brandTextSize = TextSizes.small,
  });

  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
            child: TBrandTitleText(
          title: title,
          color: textColor,
          maxLines: maxLines,
          textAlign: textAlign,
          brandTextSize: brandTextSize,
        ))
        // Text(
        //   'ACER',
        //   overflow: TextOverflow.ellipsis,
        //   maxLines: 1,
        //   style: Theme.of(context).textTheme.labelMedium,
        // ),
        // const SizedBox(width: TSizes.xs),
        // const Icon(
        //   Iconsax.verify5,
        //   color: TColors.primary,
        //   size: TSizes.iconSm,
        // ),
      ],
    );
  }
}
