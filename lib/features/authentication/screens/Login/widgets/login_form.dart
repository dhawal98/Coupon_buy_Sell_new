import 'package:coupon_app/features/authentication/screens/password_config/forget_password.dart';
import 'package:coupon_app/features/authentication/screens/signup_widgets/signup.dart';
import 'package:coupon_app/navigation_menu.dart';
import 'package:coupon_app/utils/constants/sizes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

class TLoginForm extends StatefulWidget {
  const TLoginForm({super.key});

  @override
  State<TLoginForm> createState() => _TLoginFormState();
}

class _TLoginFormState extends State<TLoginForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isPasswordHidden = true; // State variable to toggle password visibility

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
        child: Column(
          children: [
            // For email
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right4),
                labelText: 'E-Mail',
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFeild),

            // For password
            TextFormField(
              controller: passwordController,
              obscureText: isPasswordHidden, // Toggle visibility
              decoration: InputDecoration(
                prefixIcon: const Icon(Iconsax.password_check),
                labelText: 'Password',
                suffixIcon: IconButton(
                  icon: Icon(
                    isPasswordHidden ? Iconsax.eye_slash : Iconsax.eye,
                  ),
                  onPressed: () {
                    setState(() {
                      isPasswordHidden = !isPasswordHidden; // Toggle state
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFeild / 2),

            // Remember and forget password row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (value) {}),
                    const Text('Remember me'),
                  ],
                ),
                TextButton(
                  onPressed: () => Get.to(() => const ForgetPassword()),
                  child: const Text('Forget Password'),
                ),
              ],
            ),

            // Sign-in button
            const SizedBox(height: TSizes.spaceBtwSections),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  if (emailController.text.isEmpty ||
                      passwordController.text.isEmpty) {
                    Get.snackbar(
                      "Error",
                      "Email and password cannot be empty",
                      snackPosition: SnackPosition.BOTTOM,
                    );
                    return;
                  }

                  try {
                    final response = await FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                      email: emailController.text.trim(),
                      password: passwordController.text.trim(),
                    );

                    Get.to(() => const NavigationMenu());
                  } catch (e) {
                    Get.snackbar(
                      "Login Failed",
                      e.toString(),
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  }
                },
                child: const Text('Sign-IN'),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),

            // Create account button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Get.to(() => const SignUpScreen()),
                child: const Text('Create Account Here'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




// import 'package:coupon_app/features/authentication/screens/password_config/forget_password.dart';
// import 'package:coupon_app/features/authentication/screens/signup_widgets/signup.dart';
// import 'package:coupon_app/navigation_menu.dart';
// import 'package:coupon_app/utils/constants/sizes.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:iconsax/iconsax.dart';

// class TLoginForm extends StatelessWidget {
//   TLoginForm({
//     super.key,
//   });
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     bool isPasswordHidden = true;
//     return Form(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
//         child: Column(
//           children: [
//             //For email
//             TextFormField(
//               controller: emailController,
//               decoration: const InputDecoration(
//                   prefixIcon: Icon(Iconsax.direct_right4), labelText: 'E-Mail'),
//             ),
//             const SizedBox(height: TSizes.spaceBtwInputFeild),

//             //fro password

//             TextFormField(
//               controller: passwordController,
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
//                     onPressed: () => Get.to(() => const ForgetPassword()),
//                     child: const Text('Forget Password'))
//               ],
//             ),

//             //box chodna h
//             const SizedBox(height: TSizes.spaceBtwSections),

//             // ab sign in btn
//             SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                     onPressed: () async {
//                       if (emailController.text.isEmpty ||
//                           passwordController.text.isEmpty) {
//                         // Show an error message if email or password is empty
//                         Get.snackbar(
//                           "Error",
//                           "Email and password cannot be empty",
//                           snackPosition: SnackPosition.BOTTOM,
//                         );
//                         return;
//                       }

//                       try {
//                         // Attempt to sign in with Firebase Authentication
//                         // ignore: unused_local_variable
//                         final response = await FirebaseAuth.instance
//                             .signInWithEmailAndPassword(
//                           email: emailController.text.trim(),
//                           password: passwordController.text.trim(),
//                         );

//                         // print(response); // Log the response (optional)

//                         // Navigate to NavigationMenu on successful login
//                         Get.to(() => const NavigationMenu());
//                       } catch (e) {
//                         // Handle sign-in errors
//                         Get.snackbar(
//                           "Login Failed",
//                           e.toString(),
//                           snackPosition: SnackPosition.BOTTOM,
//                         );
//                       }
//                     },
//                     child: const Text('Sign-IN'))),
//             const SizedBox(
//               height: TSizes.spaceBtwItems,
//             ),
//             // ab create accnt btn
//             SizedBox(
//                 width: double.infinity,
//                 child: OutlinedButton(
//                     onPressed: () => Get.to(() => const SignUpScreen()),
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
