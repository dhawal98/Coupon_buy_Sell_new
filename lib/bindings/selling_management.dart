// import 'package:cloud_firestore/cloud_firestore.dart';
// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

class TSellManagementProfile extends StatefulWidget {
  const TSellManagementProfile({super.key});

  @override
  State<TSellManagementProfile> createState() => _TSellManagementProfileState();
}

class _TSellManagementProfileState extends State<TSellManagementProfile> {
  final String? userEmail = FirebaseAuth.instance.currentUser?.email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage My Coupons'),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users') // 'users' collection
            .doc(userEmail) // User document by email
            .collection('myCoupons') // Accessing 'myCoupons' sub-collection
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('No coupons found.'));
          }

          final coupons = snapshot.data!.docs;

          return ListView.builder(
            itemCount: coupons.length,
            itemBuilder: (context, index) {
              final coupon = coupons[index];
              return Card(
                margin: const EdgeInsets.all(10),
                child: ListTile(
                  title: Text(coupon['company'] ?? 'Unknown Company'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Type: ${coupon['type'] ?? 'N/A'}'),
                      Text('Price: ₹${coupon['price'] ?? '0'}'),
                      Text('Code: ${coupon['Code'] ?? 'N/A'}'),
                      Text('Expiry: ${coupon['date'] ?? 'N/A'}'),
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit, color: Colors.blue),
                        onPressed: () {
                          _editCoupon(context, coupon.id,
                              coupon.data() as Map<String, dynamic>);
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          _deleteCoupon(context, coupon.id);
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }


  void _deleteCoupon(BuildContext context, String couponId) async {
    // Show confirmation dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Deletion'),
          content: const Text('Are you sure you want to delete this coupon?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                // Close the dialog if 'Cancel' is pressed
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                try {
                  // Delete from 'users/myCoupons' collection
                  await FirebaseFirestore.instance
                      .collection('users')
                      .doc(userEmail) // Assuming userEmail is defined somewhere
                      .collection('myCoupons')
                      .doc(couponId)
                      .delete();

                  // Delete from 'market' collection
                  await FirebaseFirestore.instance
                      .collection('market')
                      .doc(couponId)
                      .delete();

                  // Close the dialog and show success message
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Coupon deleted successfully.')),
                  );
                } catch (e) {
                  // Handle any error during deletion
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Error deleting coupon: $e')),
                  );
                }
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  // Function to edit a coupon in both 'myCoupons' and 'market' collection
  void _editCoupon(
      BuildContext context, String couponId, Map<String, dynamic> couponData) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            EditCouponScreen(couponId: couponId, initialData: couponData),
      ),
    );
  }
}



class EditCouponScreen extends StatefulWidget {
  final String couponId;
  final Map<String, dynamic> initialData;

  const EditCouponScreen({
    super.key,
    required this.couponId,
    required this.initialData,
  });

  @override
  State<EditCouponScreen> createState() => _EditCouponScreenState();
}

class _EditCouponScreenState extends State<EditCouponScreen> {
  late TextEditingController companyController;
  late TextEditingController typeController;
  late TextEditingController priceController;
  late TextEditingController codeController;
  late TextEditingController dateController;
  late TextEditingController descriptionController;

  @override
  void initState() {
    super.initState();
    companyController =
        TextEditingController(text: widget.initialData['company']);
    typeController = TextEditingController(text: widget.initialData['type']);
    priceController = TextEditingController(text: widget.initialData['price']);
    codeController = TextEditingController(text: widget.initialData['Code']);
    dateController = TextEditingController(text: widget.initialData['date']);
    descriptionController =
        TextEditingController(text: widget.initialData['description']);
  }

  @override
  void dispose() {
    companyController.dispose();
    typeController.dispose();
    priceController.dispose();
    codeController.dispose();
    dateController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  void _updateCoupon(BuildContext context) async {
    try {
      final userEmail = FirebaseAuth.instance.currentUser?.email;

      if (userEmail == null) {
        throw 'User email not found!';
      }

      // Data to update
      final updatedData = {
        'company': companyController.text,
        'type': typeController.text,
        'price': priceController.text,
        'Code': codeController.text,
        'date': dateController.text,
        'description': descriptionController.text,
      };

      // Update the 'users/myCoupons' collection
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userEmail)
          .collection('myCoupons')
          .doc(widget.couponId)
          .update(updatedData);

      // Update the 'market' collection
      await FirebaseFirestore.instance
          .collection('market')
          .doc(widget.couponId)
          .update(updatedData);

      // Show success message and go back
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Coupon updated successfully.')),
      );
      Navigator.pop(context); // Returning to the previous screen
    } catch (e) {
      // Handle errors during update
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error updating coupon: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Coupon')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: companyController,
                decoration: const InputDecoration(labelText: 'Company'),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: typeController,
                decoration: const InputDecoration(labelText: 'Type'),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: priceController,
                decoration: const InputDecoration(labelText: 'Price'),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: codeController,
                decoration: const InputDecoration(labelText: 'Code'),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: dateController,
                decoration: const InputDecoration(labelText: 'Date'),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () => _updateCoupon(context),
                child: const Text('Update Coupon'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




// class EditCouponScreen extends StatefulWidget {
//   final String couponId;
//   final Map<String, dynamic> initialData;

//   const EditCouponScreen({
//     super.key,
//     required this.couponId,
//     required this.initialData,
//   });

//   @override
//   State<EditCouponScreen> createState() => _EditCouponScreenState();
// }

// class _EditCouponScreenState extends State<EditCouponScreen> {
//   late TextEditingController companyController;
//   late TextEditingController typeController;
//   late TextEditingController priceController;
//   late TextEditingController codeController;
//   late TextEditingController dateController;
//   late TextEditingController descriptionController;

//   @override
//   void initState() {
//     super.initState();
//     companyController =
//         TextEditingController(text: widget.initialData['company']);
//     typeController = TextEditingController(text: widget.initialData['type']);
//     priceController = TextEditingController(text: widget.initialData['price']);
//     codeController = TextEditingController(text: widget.initialData['Code']);
//     dateController = TextEditingController(text: widget.initialData['date']);
//     descriptionController =
//         TextEditingController(text: widget.initialData['description']);
//   }

//   @override
//   void dispose() {
//     companyController.dispose();
//     typeController.dispose();
//     priceController.dispose();
//     codeController.dispose();
//     dateController.dispose();
//     descriptionController.dispose();
//     super.dispose();
//   }

//   void _updateCoupon(BuildContext context) async {
//     try {
//       // Check if the coupon document exists in the 'users/myCoupons' collection
//       var couponDoc = await FirebaseFirestore.instance
//           .collection('users')
//           .doc(FirebaseAuth.instance.currentUser?.email)
//           .collection('myCoupons')
//           .doc(widget.couponId)
//           .get();

//       // If the document does not exist, show an error
//       if (!couponDoc.exists) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Coupon not found.')),
//         );
//         return;
//       }

//       // Update the 'users/myCoupons' collection
//       await FirebaseFirestore.instance
//           .collection('users')
//           .doc(FirebaseAuth.instance.currentUser?.email)
//           .collection('myCoupons')
//           .doc(widget.couponId)
//           .update({
//         'company': companyController.text,
//         'type': typeController.text,
//         'price': priceController.text,
//         'Code': codeController.text,
//         'date': dateController.text,
//         'description': descriptionController.text,
//       });

//       // Update the 'market' collection
//       await FirebaseFirestore.instance
//           .collection('market')
//           .doc(widget.couponId)
//           .update({
//         'company': companyController.text,
//         'type': typeController.text,
//         'price': priceController.text,
//         'Code': codeController.text,
//         'date': dateController.text,
//         'description': descriptionController.text,
//       });

//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Coupon updated successfully.')),
//       );
//       Navigator.pop(context); // Returning to the previous screen
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error updating coupon: $e')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Edit Coupon')),
//       body: SingleChildScrollView(
//         // Make the screen scrollable
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               TextField(
//                 controller: companyController,
//                 decoration: const InputDecoration(labelText: 'Company'),
//               ),
//               const SizedBox(height: 20),
//               TextField(
//                 controller: typeController,
//                 decoration: const InputDecoration(labelText: 'Type'),
//               ),
//               const SizedBox(height: 20),
//               TextField(
//                 controller: priceController,
//                 decoration: const InputDecoration(labelText: 'Price'),
//               ),
//               const SizedBox(height: 20),
//               TextField(
//                 controller: codeController,
//                 decoration: const InputDecoration(labelText: 'Code'),
//               ),
//               const SizedBox(height: 20),
//               TextField(
//                 controller: dateController,
//                 decoration: const InputDecoration(labelText: 'Date'),
//               ),
//               const SizedBox(height: 20),
//               TextField(
//                 controller: descriptionController,
//                 decoration: const InputDecoration(labelText: 'Description'),
//               ),
//               const SizedBox(height: 40),
//               ElevatedButton(
//                 onPressed: () => _updateCoupon(context),
//                 child: const Text('Update Coupon'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }




// ---------------

// void _deleteCoupon(BuildContext context, String couponId) async {
//   // Show confirmation dialog
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: const Text('Confirm Deletion'),
//         content: const Text('Are you sure you want to delete this coupon?'),
//         actions: <Widget>[
//           TextButton(
//             onPressed: () {
//               // Close the dialog if 'Cancel' is pressed
//               Navigator.of(context).pop();
//             },
//             child: const Text('Cancel'),
//           ),
//           TextButton(
//             onPressed: () async {
//               try {
//                 // Delete from 'users/myCoupons' collection
//                 await FirebaseFirestore.instance
//                     .collection('users')
//                     .doc(userEmail) // Assuming userEmail is defined somewhere
//                     .collection('myCoupons')
//                     .doc(couponId)
//                     .delete();

//                 // Fetch the coupon document from 'users/myCoupons' to get marketCouponId
//                 var couponDoc = await FirebaseFirestore.instance
//                     .collection('users')
//                     .doc(userEmail)
//                     .collection('myCoupons')
//                     .doc(couponId)
//                     .get();

//                 // Assuming the market coupon ID is stored in a field like 'marketCouponId'
//                 String marketCouponId = couponDoc['marketCouponId']; // Adjust field name accordingly

//                 // Now delete from 'market' collection using the correct marketCouponId
//                 await FirebaseFirestore.instance
//                     .collection('market')
//                     .doc(marketCouponId)
//                     .delete();

//                 // Close the dialog and show success message
//                 Navigator.of(context).pop();
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   const SnackBar(content: Text('Coupon deleted successfully.')),
//                 );
//               } catch (e) {
//                 // Handle any error during deletion
//                 Navigator.of(context).pop();
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(content: Text('Error deleting coupon: $e')),
//                 );
//               }
//             },
//             child: const Text('Delete'),
//           ),
//         ],
//       );
//     },
//   );
// }