import 'package:coupon_app/bindings/selling_management.dart';
import 'package:flutter/material.dart';

class AboutUserProfile extends StatelessWidget {
  const AboutUserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'User Profile',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 70), // thoda gap dene ke liye
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TSellManagementProfile()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(vertical: 25, horizontal: 65),
                  backgroundColor: Colors.blueGrey,
                ),
                child: const Text(
                  'Selled Coupon',
                  style: TextStyle(fontSize: 18, color: Colors.amber),
                ),
              ),
            ),
            const SizedBox(height: 250),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(vertical: 25, horizontal: 65),
                backgroundColor: Colors.green,
              ),
              child: const Text(
                'Buyed Coupon',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
