import 'package:coupon_app/utils/constants/colors.dart';
import 'package:coupon_app/utils/constants/sizes.dart';
import 'package:coupon_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class TTermandconditioncheckbox extends StatelessWidget {
  const TTermandconditioncheckbox({
    super.key,
    //required this.dark,
  });

  //final bool dark;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Row(
      children: [
        SizedBox(
            width: 24,
            height: 24,
            child: Checkbox(value: true, onChanged: (value) {})),
        const SizedBox(height: TSizes.spaceBtwItems),
        Text.rich(TextSpan(children: [
          TextSpan(
              text: 'Agree to  ', style: Theme.of(context).textTheme.bodySmall),
          TextSpan(
              text: 'PrivacyPolicy',
              style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: dark ? TColors.white : TColors.primary,
                  )),
          TextSpan(
              text: '  and  ', style: Theme.of(context).textTheme.bodySmall),
          TextSpan(
              text: 'Terms of use',
              style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: dark ? TColors.white : TColors.primary,
                  )),
        ]))
      ],
    );
  }
}
