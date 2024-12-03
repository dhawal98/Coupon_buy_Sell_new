import 'package:coupon_app/features/authentication/controllers/onboarding_controller.dart';
import 'package:coupon_app/features/authentication/screens/onboarding/onboard_dot_navigation.dart';
import 'package:coupon_app/features/authentication/screens/onboarding/onboarding_skip.dart';
import 'package:coupon_app/features/authentication/screens/onboarding/widget/onboarding_page.dart';
// import 'package:coupon_app/features/authentication/screens/onboarfing/onboarding/onboard_dot_navigation.dart';
// import 'package:coupon_app/features/authentication/screens/onboarfing/onboarding/onboarding_skip.dart';
// import 'package:coupon_app/features/authentication/screens/onboarfing/onboarding/widget/onboarding%20_page.dart';
import 'package:coupon_app/utils/constants/colors.dart';
// import 'package:coupon_app/utils/constants/colors.dart';
import 'package:coupon_app/utils/constants/image_strings.dart';
import 'package:coupon_app/utils/constants/sizes.dart';
// import 'package:coupon_app/utils/constants/sizes.dart';
// import 'package:coupon_app/utils/constants/sizes.dart';
import 'package:coupon_app/utils/constants/text_strings.dart';
import 'package:coupon_app/utils/devices/device_utility.dart';
import 'package:coupon_app/utils/helpers/helper_function.dart';
// import 'package:coupon_app/utils/devices/device_utility.dart';
// import 'package:coupon_app/utils/helpers/helper_function.dart';
// import 'package:coupon_app/utils/devices/device_utility.dart';
// import 'package:coupon_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // double widttth = THelperFunction.screenWidth();
    final controller = Get.put(OnboardingController());
    return Scaffold(
      body: Stack(
        children: [
          //horigontel scrol k liye
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: TImages.onBoardingImage1,
                title: TTests.onBoardingTitle1,
                subTitle: TTests.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage2,
                title: TTests.onBoardingTitle2,
                subTitle: TTests.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage3,
                title: TTests.onBoardingTitle3,
                subTitle: TTests.onBoardingSubTitle3,
              ),
            ],
          ),

          //

          // skip btn
          const OnBoardingSkip(),

          //
          //dot navigation smooth

          // SmoothPageIndicator(controller: PageController() , count: 3),
          const OnBoardingDotNavigation(),

          //Circular button
          const OnBoardingNextButton(),
        ],
      ),
    );
  }
}

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Positioned(
      right: TSizes.defaultSpace,
      bottom: TDeviceUtils.getBottomNavigationBarHeight(),
      child: ElevatedButton(
        onPressed: () => OnboardingController.instance.nextPage(),
        style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            backgroundColor: dark ? TColors.primary : Colors.black),
        child: const Icon(Iconsax.arrow_right_41),
      ),
    );
  }
}

// class OnBoardingDotNavigation extends StatelessWidget {
//   const OnBoardingDotNavigation({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final dark = THelperFunction.isDarkMode(context);
//     return Positioned(
//       bottom: TDeviceUtils.getBottomNavigationBarHeight() + 25,
//       left: TSizes.defaultSpace,
//       child: SmoothPageIndicator(
//         controller: PageController(),
//         count: 3,
//         effect: ExpandingDotsEffect(
//             activeDotColor: dark ? TColors.light : TColors.dark, dotHeight: 6),
//       ),
//     );
//   }
// }

// class OnBoardingSkip extends StatelessWidget {
//   const OnBoardingSkip({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Positioned(top: TDeviceUtils.getAppBarHieght(),right: TSizes.defaultSpace, child : TextButton(onPressed: (){}, child: const Text ('SKIP'),),);
//   }
// }

// class onBoardingPage extends StatelessWidget {
//   const onBoardingPage({
//     super.key, required this.image , required this.title , required this.subTitle,
//   });

//   final String image, title, subTitle;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(TSizes.defaultSpace),
//       child: Column(
//         children: [
//           Image(
//             width: THelperFunction.screenWidth() * 0.8,
//             height: THelperFunction.screenHeight() * 0.6,
//             image:  AssetImage(image),
//           ),
//           Text(
//             title,
//             style: Theme.of(context).textTheme.headlineMedium,
//             textAlign: TextAlign.center,
//           ),
//           const SizedBox(height: TSizes.spaceBtwItems),
//           Text(
//             subTitle,
//             style: Theme.of(context).textTheme.bodyMedium,
//             textAlign: TextAlign.center,
//           ),
//         ],
//       ),
//     );
//   }
// }
