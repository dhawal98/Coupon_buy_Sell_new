import 'package:coupon_app/common/styles/spacing_style.dart';
import 'package:coupon_app/common/widgets/login_signup/form_divider.dart';
import 'package:coupon_app/common/widgets/login_signup/social_button.dart';
import 'package:coupon_app/features/authentication/screens/Login/widgets/login_form.dart';
import 'package:coupon_app/features/authentication/screens/Login/widgets/login_header.dart';
import 'package:coupon_app/utils/constants/sizes.dart';
import 'package:coupon_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              ////logo or title or sub tile likha
              TLoginHeader(dark: dark),

              TLoginForm(),

              // divider
              TFormDivider(dark: dark),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              // ab footer
              const TSocialButton(),
            ],
          ),
        ),
      ),
    );
  }
}

// class TSocialButton extends StatelessWidget {
//   const TSocialButton({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Container(
//           decoration: BoxDecoration(border: Border.all(color: TColors.grey),borderRadius: BorderRadius.circular(100)),
//           child: IconButton(
//             onPressed: (){},
//             icon: const Image(
//               width: TSizes.iconMd,
//               height: TSizes.iconMd,
//               image: AssetImage(TImages.google),
//             ),
//           ),
//         ),
//         const SizedBox(width: TSizes.spaceBtwItems,),
//           Container(
//           decoration: BoxDecoration(border: Border.all(color: TColors.grey),borderRadius: BorderRadius.circular(100)),
//           child: IconButton(
//             onPressed: (){},
//             icon: const Image(
//               width: TSizes.iconMd,
//               height: TSizes.iconMd,
//               image: AssetImage(TImages.facebook),
//             ),
//           ),
//         ),

//       ],
//     );
//   }
// }

// class TFormDivider extends StatelessWidget {
//   const TFormDivider({
//     super.key,
//     required this.dark,
//   });

//   final bool dark;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Flexible(
//           child: Divider(
//               color: dark ? TColors.darkGrey : TColors.grey,
//               thickness: 0.5,
//               indent: 60,
//               endIndent: 5),
//         ),
//         Text('Or Sign-In With',
//             style: Theme.of(context).textTheme.labelMedium),
//         Flexible(
//           child: Divider(
//               color: dark ? TColors.darkGrey : TColors.grey,
//               thickness: 0.5,
//               indent: 60,
//               endIndent: 5),
//         ),
//       ],
//     );
//   }
// }

// class TLoginForm extends StatelessWidget {
//   const TLoginForm({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(
//             vertical: TSizes.spaceBtwSections),
//         child: Column(
//           children: [
//             //For email
//             TextFormField(
//               decoration: const InputDecoration(
//                   prefixIcon: Icon(Iconsax.direct_right4),
//                   labelText: 'E-Mail'),
//             ),
//             const SizedBox(height: TSizes.spaceBtwInputFeild),

//             //fro password

//             TextFormField(
//               decoration: const InputDecoration(
//                 prefixIcon: Icon(Iconsax.password_check),
//                 labelText: 'Password',
//                 suffixIcon: Icon(Iconsax.eye_slash),
//               ),
//             ),
//             const SizedBox(height: TSizes.spaceBtwInputFeild / 2),

//             //ab remembr or forgot k liye password
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 //for rember me
//                 Row(
//                   children: [
//                     Checkbox(value: true, onChanged: (value) {}),
//                     const Text('Remember me'),
//                   ],
//                 ),
//                 // ab forget k liye
//                 TextButton(
//                     onPressed: () {},
//                     child: const Text('Forget Password'))
//               ],
//             ),

//             //box chodna h
//             const SizedBox(height: TSizes.spaceBtwSections),

//             // ab sign in btn
//             SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                     onPressed: () {}, child: const Text('Sign-IN'))),
//             const SizedBox(
//               height: TSizes.spaceBtwItems,
//             ),
//             // ab create accnt btn
//             SizedBox(
//                 width: double.infinity,
//                 child: OutlinedButton(
//                     onPressed: () {},
//                     child: const Text('Create Account Here'))),
//             // const SizedBox(
//             //   height: TSizes.spaceBtwItems,
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class TLoginHeader extends StatelessWidget {
//   const TLoginHeader({
//     super.key,
//     required this.dark,
//   });

//   final bool dark;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Image(
//           height: 150,
//           image: AssetImage(
//               dark ? TImages.lightAppLogo : TImages.darkAppLogo),
//         ),
//         Text('Welcome back',
//             style: Theme.of(context).textTheme.bodyMedium),
//         const SizedBox(height: TSizes.sm),
//         Text('Discover limitless choices & unmatched convinence',
//             style: Theme.of(context).textTheme.bodyMedium),
//       ],
//     );
//   }
// }
