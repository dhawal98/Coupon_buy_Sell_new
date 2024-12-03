import 'package:coupon_app/common/widgets/login_signup/form_divider.dart';
import 'package:coupon_app/common/widgets/login_signup/social_button.dart';
import 'package:coupon_app/features/authentication/screens/signup_widgets/signup_form.dart';
import 'package:coupon_app/utils/constants/sizes.dart';
import 'package:coupon_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Lets create your account',
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: TSizes.spaceBtwSections),

              //forms

              TSignupForm(),
              const SizedBox(height: TSizes.spaceBtwItems),

              TFormDivider(dark: dark),
              const SizedBox(height: TSizes.gridViewSpacing),

              const TSocialButton(),
            ],
          ),
        ),
      ),
    );
  }
}

// 