import 'package:coupon_app/utils/constants/image_strings.dart';
import 'package:coupon_app/utils/constants/sizes.dart';
import 'package:coupon_app/utils/helpers/helper_function.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        automaticallyImplyLeading: false,
        actions: [IconButton(onPressed: () => Get.back(), icon: const Icon(CupertinoIcons.clear))],
      ),
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            Image(image: const AssetImage(TImages.ani3) , width: THelperFunction.screenWidth()*0.6),
            const SizedBox(height: TSizes.spaceBtwSections),
            Text('Password Reset Email Send' , style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
            const SizedBox(height: TSizes.spaceBtwItems),
            Text('Your account security is our priority! We have sent you a Secure link to safty change your password and keep YOur account Protected', style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),
            const SizedBox(height: TSizes.spaceBtwSections),
            

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: (){}, child: const Text('Done')),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
             SizedBox(
              width: double.infinity,
              child: TextButton(onPressed: (){}, child: const Text('Resend Email')),
            ),

          ],
        ),),
      ),
    );
  }
}