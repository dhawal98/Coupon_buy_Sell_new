import 'package:coupon_app/features/authentication/controllers/onboarding_controller.dart';
import 'package:coupon_app/utils/constants/sizes.dart';
import 'package:coupon_app/utils/devices/device_utility.dart';
import 'package:flutter/material.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: TDeviceUtils.getAppBarHieght(),
      right: TSizes.defaultSpace,
      child: TextButton(
        onPressed: () => OnboardingController.instance.skipPage(),
        child: const Text('SKIP'),
      ),
    );
  }
}
