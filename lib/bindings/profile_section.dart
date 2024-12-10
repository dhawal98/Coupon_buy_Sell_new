import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:coupon_app/bindings/sellMyCoupon.dart';
import 'package:coupon_app/bindings/sell_my_coupon.dart';
// import 'package:coupon_app/bindings/sellmycoupon.dart';
import 'package:coupon_app/bindings/user_ki_profile.dart';
import 'package:coupon_app/features/authentication/screens/Login/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreenForHome extends StatefulWidget {
  const ProfileScreenForHome({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfileScreenForHomeState createState() => _ProfileScreenForHomeState();
}

class _ProfileScreenForHomeState extends State<ProfileScreenForHome> {
  String name = '';
  String email = '';
  String phoneNumber = '';

  @override
  void initState() {
    super.initState();
    getValues();
  }

  Future<void> getValues() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      email = user.email!;
      try {
        final docSnapshot = await FirebaseFirestore.instance
            .collection('users')
            .doc(email)
            .get();

        if (docSnapshot.exists) {
          setState(() {
            name = docSnapshot.data()?['name'] ?? '';
            phoneNumber = docSnapshot.data()?['phoneNumber'] ?? '';
          });
        }
      } catch (e) {
        // ignore: avoid_print
        print("Error fetching Firestore data: $e");
      }
    }
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
    Get.offAll(() => const LoginScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          'Profile',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
        )),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name.isNotEmpty
                  ? 'Hello - $name'
                  : 'Hello - Loading...', // Loading state
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text('Email: $email', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text(
              phoneNumber.isNotEmpty
                  ? 'Phone: $phoneNumber'
                  : 'Phone: Loading...', // Loading state
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.to(() => EditProfileScreenForHome());
              },
              child: const Text('Edit Profile'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.to(() => const AboutUserProfile());
              },
              child: const Text('My Orders'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.to(() => TrackOrderScreen());
              },
              child: const Text('Track Orders  --not useful now'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.to(() => const HelpSupportScreen());
              },
              child: const Text('Help & Support'),
            ),
            const SizedBox(height: 40),
            // CENTERED LOGOUT BUTTON
            Center(
              child: ElevatedButton(
                onPressed: logout,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 50, vertical: 22), // Center styling
                ),
                child: const Text(
                  'Log-out',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const Spacer(),
            // ADD MY COUPON IN MARKET BUTTON
            GestureDetector(
              onTap: () {
                Get.to(
                    () => const TSellMyCoupon()); // Navigate to TSellMyCoupon
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                decoration: BoxDecoration(
                  color: Colors.orange.shade400,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3), // Shadow positioning
                    ),
                  ],
                ),
                child: const Center(
                  child: Text(
                    'Add My Coupon in Market',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// /
// /
// /
// /
// /
// /
// /
// /
// /
// /
// /

// /
class EditProfileScreenForHome {}

// class YourOrdersScreen {}

class TrackOrderScreen {}

class HelpSupportScreen extends StatelessWidget {
  final String email = "cs21b1005@iiitr.ac.in";
  final String phone = "+917976451687";

  const HelpSupportScreen({super.key});

  // Function to launch email
  void _launchEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
    );
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      throw 'Could not launch $emailUri';
    }
  }

  // Function to launch phone
  void _launchPhone() async {
    final Uri phoneUri = Uri(
      scheme: 'tel',
      path: phone,
    );
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      throw 'Could not launch $phoneUri';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Help :-',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: _launchEmail,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.email, color: Colors.blue, size: 30),
                  const SizedBox(width: 10),
                  Text(
                    email,
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // Ab same for Mobile
            GestureDetector(
              onTap: _launchPhone,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.phone, color: Colors.green, size: 30),
                  const SizedBox(width: 10),
                  Text(
                    phone,
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
