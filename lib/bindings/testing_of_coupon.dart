import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class CouponVerifier {
  final String couponCode;
  final String companyApiUrl; // URL of the company's coupon verification API
  final String imageUrl; // Optional proof, like a screenshot

  CouponVerifier({
    required this.couponCode,
    required this.companyApiUrl,
    this.imageUrl = "",
  });

  /// Method to verify coupon via API
  Future<Map<String, dynamic>> verifyViaApi() async {
    try {
      // API request payload
      final Map<String, dynamic> payload = {
        'coupon_code': couponCode,
      };

      // Make an HTTP POST request
      final response = await http.post(
        Uri.parse(companyApiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(payload),
      );

      // Handle API response
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return {
          'isValid': data['isValid'] ?? false,
          'message': data['message'] ?? "No message provided",
        };
      } else {
        return {
          'isValid': false,
          'message': 'API Error: ${response.statusCode}',
        };
      }
    } catch (e) {
      return {
        'isValid': false,
        'message': 'Error occurred: $e',
      };
    }
  }

  /// Method to verify via uploaded image (Proof)
  Future<Map<String, dynamic>> verifyViaImage() async {
    if (imageUrl.isEmpty) {
      return {
        'isValid': false,
        'message': 'No proof provided for verification.',
      };
    }

    // Example of image verification logic
    // In a real-world scenario, use APIs or machine learning for OCR
    // Here, we'll simulate a basic check.
    if (imageUrl.contains("http")) {
      return {
        'isValid': true,
        'message': 'Image proof appears valid.',
      };
    } else {
      return {
        'isValid': false,
        'message': 'Invalid image proof URL.',
      };
    }
  }
}




class VerifyCouponScreen extends StatefulWidget {
  const VerifyCouponScreen({super.key});

  @override
  State<VerifyCouponScreen> createState() => _VerifyCouponScreenState();
}

class _VerifyCouponScreenState extends State<VerifyCouponScreen> {
  final TextEditingController couponCodeController = TextEditingController();
  bool isVerifying = false;
  String verificationMessage = '';

  Future<void> handleVerifyCoupon() async {
    setState(() {
      isVerifying = true;
      verificationMessage = '';
    });

    // Example company API URL (Replace with a real one)
    const String companyApiUrl = "https://api.example.com/verify-coupon";

    // Instantiate the verifier
    final verifier = CouponVerifier(
      couponCode: couponCodeController.text,
      companyApiUrl: companyApiUrl,
    );

    // Verify via API
    final result = await verifier.verifyViaApi();

    setState(() {
      isVerifying = false;
      verificationMessage = result['message'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify Coupon'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Coupon Code Input
            TextField(
              controller: couponCodeController,
              decoration: const InputDecoration(
                labelText: 'Enter Coupon Code',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // Verify Button
            ElevatedButton(
              onPressed: isVerifying ? null : handleVerifyCoupon,
              child: isVerifying
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text('Verify Coupon'),
            ),

            // Verification Result
            if (verificationMessage.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  verificationMessage,
                  style: TextStyle(
                    color: verificationMessage.contains('valid') ? Colors.green : Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
