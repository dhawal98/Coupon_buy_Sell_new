import 'package:coupon_app/common/widgets/sucess_screen/success_screen.dart';
import 'package:coupon_app/features/authentication/screens/Login/login.dart';
import 'package:coupon_app/features/authentication/screens/signup_widgets/term_and_condition_checkbox.dart';
import 'package:coupon_app/utils/constants/image_strings.dart';
import 'package:coupon_app/utils/constants/sizes.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:coupon_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class TSignupForm extends StatelessWidget {
  TSignupForm({
    super.key,
    //required this.dark,
  });
  final TextEditingController emailContoller = TextEditingController();
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController phonenumberController = TextEditingController();

  // final bool dark;

  @override
  Widget build(BuildContext context) {
    // final dark = THelperFunction.isDarkMode(context);
    return Form(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  expands: false,
                  controller: firstnameController,
                  decoration: const InputDecoration(
                      labelText: 'First Name', prefixIcon: Icon(Iconsax.user)),
                ),
              ),
              const SizedBox(
                width: TSizes.spaceBtwInputFeild,
              ),
              Expanded(
                child: TextFormField(
                  expands: false,
                  controller: lastnameController,
                  decoration: const InputDecoration(
                      labelText: 'Last Name', prefixIcon: Icon(Iconsax.user)),
                ),
              )
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwInputFeild),

          // username
          TextFormField(
            expands: false,
            controller: usernameController,
            decoration: const InputDecoration(
                labelText: 'Username', prefixIcon: Icon(Iconsax.user_edit)),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFeild),

          TextFormField(
            expands: false,
            controller: emailContoller,
            decoration: const InputDecoration(
                labelText: 'Email', prefixIcon: Icon(Iconsax.user_edit)),
          ),

          const SizedBox(height: TSizes.spaceBtwInputFeild),

          TextFormField(
            expands: false,
            controller: phonenumberController,
            decoration: const InputDecoration(
                labelText: 'PhoneNumber', prefixIcon: Icon(Iconsax.user_edit)),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFeild),

          // password

          TextFormField(
            controller: passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'Password',
              prefixIcon: Icon(Iconsax.password_check),
              suffixIcon: Icon(Iconsax.eye_slash),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwSections),

          const TTermandconditioncheckbox(),
          const SizedBox(height: TSizes.spaceBtwSections),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () async {
                  print("dhjhdfjgjgk...............${emailContoller.text}");
                  print(passwordController.text);
                  await FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: emailContoller.text,
                      password: passwordController.text);
                  // Validate fields
                  if (firstnameController.text.isEmpty ||
                      lastnameController.text.isEmpty ||
                      usernameController.text.isEmpty ||
                      phonenumberController.text.isEmpty ||
                      passwordController.text.isEmpty) {
                    print("All fields are required!");
                    return;
                  }

                  try {
                    // Create a map for data
                    Map<String, dynamic> userData = {
                      "name": firstnameController.text.trim(),
                      "lastName": lastnameController.text.trim(),
                      "username": usernameController.text.trim(),
                      "phoneNumber": phonenumberController.text.trim(),
                      "password": passwordController.text
                          .trim(), // Note: Avoid saving plain text passwords!
                    };

                    // Save data to Firestore
                    await FirebaseFirestore.instance
                        .collection("users")
                        .doc(emailContoller.text)
                        .set(userData);

                    print("Data saved successfully!");
                  } catch (e) {
                    print("Error saving data: $e");
                  }
                  Get.to(() => SuccessScreen(
                        image: TImages.ani1,
                        onPressed: () => Get.to(() => const LoginScreen()),
                      ));
                },
                child: const Text(' Create Account')),
          )
        ],
      ),
    );
  }
}
