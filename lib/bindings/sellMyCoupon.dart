import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TSellMyCoupon extends StatefulWidget {
  const TSellMyCoupon({super.key});

  @override
  State<TSellMyCoupon> createState() => _TSellMyCouponState();
}

class _TSellMyCouponState extends State<TSellMyCoupon> {
  final TextEditingController companyNameController = TextEditingController();
  final TextEditingController couponTypeController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController imageUrlController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController codeController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  bool isLoading = false;

  // Function to check if all fields are filled
  bool get isFormValid {
    return companyNameController.text.isNotEmpty &&
        couponTypeController.text.isNotEmpty &&
        priceController.text.isNotEmpty &&
        imageUrlController.text.isNotEmpty &&
        codeController.text.isNotEmpty &&
        descriptionController.text.isNotEmpty;
  }

  void submitCoupon(BuildContext context) async {
    setState(() {
      isLoading = true; // Show loading indicator
    });

    // Prepare coupon data
    final Map<String, dynamic> couponData = {
      'company': companyNameController.text,
      'type': couponTypeController.text,
      'price': priceController.text,
      'link': imageUrlController.text, // Image URL field
      'Code': codeController.text,
      'date': dateController.text,
      'description': descriptionController.text,
      'email': 'user@example.com', // Add user email if applicable
      'timestamp': FieldValue.serverTimestamp(),
    };

    try {
      // Store coupon in Firestore
      await FirebaseFirestore.instance.collection('market').add(couponData);

      // Show confirmation message using SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Coupon Submitted Successfully')),
      );

      // Go back to the previous screen after a brief delay
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.pop(context); // Go back to the previous screen
      });

      // Clear form fields
      clearForm();
    } catch (e) {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error while submitting: $e')),
      );
    } finally {
      setState(() {
        isLoading = false; // Hide loading indicator
      });
    }
  }

  void clearForm() {
    companyNameController.clear();
    couponTypeController.clear();
    priceController.clear();
    imageUrlController.clear();
    descriptionController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // Ensure layout adjusts to keyboard
      appBar: AppBar(
        title: const Text('Sell My Coupon'),
        automaticallyImplyLeading: true, // Enable back button
      ),
      body: SingleChildScrollView(
        // Make the whole form scrollable
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Company Name TextField
            SizedBox(
              width: double.infinity, // Ensure the text field takes full width
              child: TextField(
                controller: companyNameController,
                decoration: const InputDecoration(labelText: 'Company Name'),
                onChanged: (value) {
                  setState(() {}); // Trigger UI update
                },
              ),
            ),
            const SizedBox(height: 10),

            // Coupon Type TextField
            SizedBox(
              width: double.infinity, // Ensure the text field takes full width
              child: TextField(
                controller: couponTypeController,
                decoration: const InputDecoration(labelText: 'Coupon Type'),
                onChanged: (value) {
                  setState(() {}); // Trigger UI update
                },
              ),
            ),
            const SizedBox(height: 10),

            // Price TextField
            SizedBox(
              width: double.infinity, // Ensure the text field takes full width
              child: TextField(
                controller: priceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Price'),
                onChanged: (value) {
                  setState(() {}); // Trigger UI update
                },
              ),
            ),
            const SizedBox(height: 10),

            SizedBox(
              width: double.infinity, // Ensure the text field takes full width
              child: TextField(
                controller: codeController,
                decoration: const InputDecoration(labelText: 'Coupon Code'),
                onChanged: (value) {
                  setState(() {}); // Trigger UI update
                },
              ),
            ),
            const SizedBox(height: 10),

            SizedBox(
              width: double.infinity,
              child: TextField(
                controller: dateController,
                decoration: const InputDecoration(
                  labelText: 'Coupon Exp Date',
                  hintText: 'DD-MM-YYYY',
                ),
                keyboardType: TextInputType.text, // Only numeric keyboard
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                      RegExp(r'\d|-')), // Allow digits and "-"
                  LengthLimitingTextInputFormatter(
                      10), // Limit to 10 characters
                ],
                onChanged: (value) {
                  // Validate date format dynamically
                  if (!_isValidDate(value)) {
                    setState(() {
                      // Invalid date formatting
                      dateController.text = value;
                      dateController.selection = TextSelection.fromPosition(
                        TextPosition(offset: value.length),
                      );
                    });
                  }
                },
              ),
            ),
            const SizedBox(height: 10),

            // Image URL TextField
            SizedBox(
              width: double.infinity, // Ensure the text field takes full width
              child: TextField(
                controller: imageUrlController,
                decoration: const InputDecoration(labelText: 'Coupon URL'),
                onChanged: (value) {
                  setState(() {}); // Trigger UI update
                },
              ),
            ),
            const SizedBox(height: 10),

            // Description TextField
            SizedBox(
              width: double.infinity, // Ensure the text field takes full width
              child: TextField(
                controller: descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
                maxLines: 3,
                onChanged: (value) {
                  setState(() {}); // Trigger UI update
                },
              ),
            ),
            const SizedBox(height: 70),
            //const Spacer(),

            // Submit Button
            ElevatedButton(
              onPressed: isFormValid && !isLoading
                  ? () => submitCoupon(context)
                  : null, // Disable if form is invalid or loading
              child: isLoading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text(
                      'Submit Coupon',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

bool _isValidDate(String input) {
  // Regex to validate DD-MM-YYYY format
  final RegExp dateRegex = RegExp(
    r'^([0-2][0-9]|3[0-1])-(0[1-9]|1[0-2])-\d{4}$',
  );
  return dateRegex.hasMatch(input);
}


// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:coupon_app/common/widgets/products/products_cards/product_card_vertical.dart';
// import 'package:flutter/material.dart';

// class TSellMyCoupon extends StatefulWidget {
//   const TSellMyCoupon({Key? key}) : super(key: key);

//   @override
//   State<TSellMyCoupon> createState() => _TSellMyCouponState();
// }

// class _TSellMyCouponState extends State<TSellMyCoupon> {
//   final TextEditingController companyNameController = TextEditingController();
//   final TextEditingController couponTypeController = TextEditingController();
//   final TextEditingController priceController = TextEditingController();
//   final TextEditingController imageUrlController = TextEditingController();
//   final TextEditingController descriptionController = TextEditingController();

//   bool isLoading = false;

//   // Function to check if all fields are filled
//   bool get isFormValid {
//     return companyNameController.text.isNotEmpty &&
//         couponTypeController.text.isNotEmpty &&
//         priceController.text.isNotEmpty &&
//         imageUrlController.text.isNotEmpty &&
//         descriptionController.text.isNotEmpty;
//   }

//   void submitCoupon(BuildContext context) async {
//     setState(() {
//       isLoading = true; // Show loading indicator
//     });

//     // Prepare coupon data
//     final Map<String, dynamic> couponData = {
//       'company': companyNameController.text,
//       'type': couponTypeController.text,
//       'price': priceController.text,
//       'link': imageUrlController.text, // Image URL field
//       'description': descriptionController.text,
//       'email': 'user@example.com', // Add user email if applicable
//       'timestamp': FieldValue.serverTimestamp(),
//     };

//     try {
//       // Store coupon in Firestore
//       await FirebaseFirestore.instance.collection('market').add(couponData);

//       // Navigate to the next screen with submitted data
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => CouponGridScreen(couponData: couponData),
//         ),
//       );

//       // Clear form fields
//       clearForm();
//     } catch (e) {
//       // Show error message
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error while submitting: $e')),
//       );
//     } finally {
//       setState(() {
//         isLoading = false; // Hide loading indicator
//       });
//     }
//   }

//   void clearForm() {
//     companyNameController.clear();
//     couponTypeController.clear();
//     priceController.clear();
//     imageUrlController.clear();
//     descriptionController.clear();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Sell My Coupon'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             const SizedBox(height: 16),
//             const SizedBox(height: 16),
//             TextField(
//               controller: companyNameController,
//               decoration: const InputDecoration(labelText: 'Company Name'),
//               onChanged: (value) {
//                 setState(() {}); // Trigger UI update
//               },
//             ),
//             const SizedBox(height: 16),
//             TextField(
//               controller: couponTypeController,
//               decoration: const InputDecoration(labelText: 'Coupon Type'),
//               onChanged: (value) {
//                 setState(() {}); // Trigger UI update
//               },
//             ),
//             const SizedBox(height: 16),
//             TextField(
//               controller: priceController,
//               keyboardType: TextInputType.number,
//               decoration: const InputDecoration(labelText: 'Price'),
//               onChanged: (value) {
//                 setState(() {}); // Trigger UI update
//               },
//             ),
//             const SizedBox(height: 16),
//             TextField(
//               controller: imageUrlController,
//               decoration: const InputDecoration(labelText: 'Image URL'),
//               onChanged: (value) {
//                 setState(() {}); // Trigger UI update
//               },
//             ),
//             const SizedBox(height: 16),
//             TextField(
//               controller: descriptionController,
//               decoration: const InputDecoration(labelText: 'Description'),
//               maxLines: 3,
//               onChanged: (value) {
//                 setState(() {}); // Trigger UI update
//               },
//             ),
//             const SizedBox(height: 20),
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 onPressed: isFormValid && !isLoading
//                     ? () => submitCoupon(context)
//                     : null,
//                 // style: Colors.blue, // Disable if form is invalid or loading
//                 child: isLoading
//                     ? const CircularProgressIndicator(color: Colors.white)
//                     : const Text('Submit Coupon'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class CouponGridScreen extends StatelessWidget {
//   final Map<String, dynamic> couponData;

//   const CouponGridScreen({Key? key, required this.couponData})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Submitted Coupons'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TProductCardVertical(
//               companyName: couponData['company'] ?? 'N/A',
//               title: couponData['type'] ?? 'N/A',
//               price: couponData['price'] ?? '0',
//               imageUrl: couponData['link'] ?? '',
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }













// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class TSellMyCoupon extends StatefulWidget {
//   const TSellMyCoupon({super.key});

//   @override
//   _TSellMyCouponState createState() => _TSellMyCouponState();
// }

// class _TSellMyCouponState extends State<TSellMyCoupon> {
//   final TextEditingController companyController = TextEditingController();
//   final TextEditingController typeController = TextEditingController();
//   final TextEditingController expiryDateController = TextEditingController();
//   final TextEditingController infoController = TextEditingController();
//   final TextEditingController priceController = TextEditingController();
//   final TextEditingController linkController = TextEditingController();

//   bool isLoading = false;

//   // Function to validate the form and submit data
//   Future<void> submitCoupon() async {
//     // Check if all fields are filled
//     if (companyController.text.trim().isEmpty ||
//         typeController.text.trim().isEmpty ||
//         expiryDateController.text.trim().isEmpty ||
//         infoController.text.trim().isEmpty ||
//         priceController.text.trim().isEmpty ||
//         linkController.text.trim().isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Please fill out all fields.')),
//       );
//       return;
//     }

//     final user = FirebaseAuth.instance.currentUser;
//     if (user == null) return;

//     final email = user.email;

//     final couponData = {
//       'company': companyController.text.trim(),
//       'type': typeController.text.trim(),
//       'expiryDate': expiryDateController.text.trim(),
//       'info': infoController.text.trim(),
//       'price': priceController.text.trim(),
//       'link': linkController.text.trim(),
//       'ownerEmail': email,
//       'createdAt': Timestamp.now(),
//     };

//     setState(() {
//       isLoading = true;
//     });

//     try {
//       // Store the coupon in the global market collection
//       await FirebaseFirestore.instance.collection('market').add(couponData);

//       // Also store it in the user's database
//       await FirebaseFirestore.instance
//           .collection('users')
//           .doc(email)
//           .collection('myCoupons')
//           .add(couponData);

//       // Clear the form and show success
//       clearForm();
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Coupon added successfully!')),
//       );
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error: $e')),
//       );
//     } finally {
//       setState(() {
//         isLoading = false;
//       });
//     }
//   }

//   void clearForm() {
//     companyController.clear();
//     typeController.clear();
//     expiryDateController.clear();
//     infoController.clear();
//     priceController.clear();
//     linkController.clear();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Add Your Coupon'),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text(
//                 'Add Coupon Details',
//                 style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 16),
//               // Company Input
//               TextField(
//                 controller: companyController,
//                 decoration: InputDecoration(
//                   labelText: 'Company',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               // Type Input
//               TextField(
//                 controller: typeController,
//                 decoration: InputDecoration(
//                   labelText: 'Type',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               // Expiry Date Input
//               TextField(
//                 controller: expiryDateController,
//                 decoration: InputDecoration(
//                   labelText: 'Expiry Date',
//                   hintText: 'e.g., 2024-12-31',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               // Information About Coupon
//               TextField(
//                 controller: infoController,
//                 maxLines: 3,
//                 decoration: InputDecoration(
//                   labelText: 'Information About Coupon',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               // Price Input
//               TextField(
//                 controller: priceController,
//                 keyboardType: TextInputType.number,
//                 decoration: InputDecoration(
//                   labelText: 'Price',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16),

//               TextField(
//                 controller: linkController,
//                 decoration: InputDecoration(
//                   labelText: 'Link',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 32),
//               // Submit Button
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   onPressed: isLoading ? null : submitCoupon,
//                   style: ElevatedButton.styleFrom(
//                     padding: const EdgeInsets.symmetric(vertical: 16),
//                     backgroundColor: Colors.green,
//                   ),
//                   child: isLoading
//                       ? const CircularProgressIndicator(color: Colors.white)
//                       : const Text(
//                           'Submit Coupon',
//                           style: TextStyle(fontSize: 18),
//                         ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
