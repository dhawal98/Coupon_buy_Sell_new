// import 'package:coupon_app/app.dart';
import 'package:coupon_app/features/authentication/screens/password_config/reset_password.dart';
import 'package:coupon_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Forget Password' , style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox( height: TSizes.spaceBtwItems),
            Text('Do not worry sometimes people can forget too.Enter yout email and we will send you a password reset link' , style: Theme.of(context).textTheme.labelMedium),
            const SizedBox( height: TSizes.spaceBtwSections*2),

            TextFormField(
              decoration: const InputDecoration(labelText: 'E-mail'  , prefixIcon: Icon(Iconsax.direct_right)),
            ),
            const SizedBox( height: TSizes.spaceBtwSections),

            SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => Get.to(() => const ResetPassword()), child: const Text('Submit')),)
          ],
        ),),
    );
  }
}