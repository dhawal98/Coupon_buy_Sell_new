import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TProductCardVertical extends StatefulWidget {
  final String companyName;
  final String title;
  final String price;
  final String imageUrl;

  const TProductCardVertical({
    super.key,
    required this.companyName,
    required this.title,
    required this.price,
    required this.imageUrl,
  });

  @override
  State<TProductCardVertical> createState() => _TProductCardVerticalState();
}

class _TProductCardVerticalState extends State<TProductCardVertical> {
  bool isFavorite = false; // Track the heart's state

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite; // Toggle the heart's state
    });
  }

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: () {
        // Optional: Handle onTap actions here.
      },
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              spreadRadius: 2,
              offset: const Offset(0, 2),
            ),
          ],
          borderRadius: BorderRadius.circular(16),
          color: dark ? Colors.grey[900] : Colors.white,
        ),
        child: Column(
          children: [
            // Image Section
            Container(
              height: 180,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: dark ? Colors.grey[800] : Colors.grey[200],
              ),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      widget.imageUrl,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                      errorBuilder: (context, error, stackTrace) => const Icon(
                        Icons.error,
                        size: 50,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.orange.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        '40%',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: toggleFavorite, // Toggle heart on tap
                      child: Icon(
                        isFavorite ? Iconsax.heart5 : Iconsax.heart,
                        color: isFavorite ? Colors.redAccent : Colors.white,
                        size: 24,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            // Details Section
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.companyName,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            // Price and Add to Cart Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    '₹${widget.price}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomRight: Radius.circular(16),
                    ),
                  ),
                  child: const SizedBox(
                    width: 48,
                    height: 48,
                    child: Center(
                      child: Icon(Iconsax.add, color: Colors.white),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

// .
// .
// .
// .
// .// // import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:iconsax/iconsax.dart';

// class TProductCardVertical extends StatelessWidget {
//   final String companyName;
//   final String title;
//   final String price;
//   final String imageUrl; // Add this field if you have image URLs in Firestore.

//   const TProductCardVertical({
//     super.key,
//     required this.companyName,
//     required this.title,
//     required this.price,
//     required this.imageUrl,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final dark = Theme.of(context).brightness == Brightness.dark;

//     return GestureDetector(
//       onTap: () {
//         // Optional: Handle onTap actions here.
//       },
//       child: Container(
//         width: 180,
//         padding: const EdgeInsets.all(1),
//         decoration: BoxDecoration(
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.1),
//               blurRadius: 4,
//               spreadRadius: 2,
//               offset: const Offset(0, 2),
//             ),
//           ],
//           borderRadius: BorderRadius.circular(16),
//           color: dark ? Colors.grey[900] : Colors.white,
//         ),
//         child: Column(
//           children: [
//             // Image Section
//             Container(
//               height: 180,
//               padding: const EdgeInsets.all(8),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(12),
//                 color: dark ? Colors.grey[800] : Colors.grey[200],
//               ),
//               child: Stack(
//                 children: [
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(12),
//                     child: Image.network(
//                       imageUrl,
//                       fit: BoxFit.cover,
//                       width: double.infinity,
//                       height: double.infinity,
//                       errorBuilder: (context, error, stackTrace) => const Icon(
//                         Icons.error,
//                         size: 50,
//                         color: Colors.red,
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     top: 12,
//                     child: Container(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 8, vertical: 4),
//                       decoration: BoxDecoration(
//                         color: Colors.orange.withOpacity(0.9),
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       child: const Text(
//                         '40%',
//                         style: TextStyle(color: Colors.black),
//                       ),
//                     ),
//                   ),
//                   const Positioned(
//                     top: 0,
//                     right: 0,
//                     child: Icon(Iconsax.heart5, color: Colors.redAccent),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 8),
//             // Details Section
//             Padding(
//               padding: const EdgeInsets.only(left: 8),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     title,
//                     style: const TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 4),
//                   Text(
//                     companyName,
//                     style: const TextStyle(
//                       fontSize: 12,
//                       color: Colors.grey,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const Spacer(),
//             // Price and Add to Cart Section
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(left: 8),
//                   child: Text(
//                     '₹$price',
//                     style: const TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//                 Container(
//                   decoration: const BoxDecoration(
//                     color: Colors.black,
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(12),
//                       bottomRight: Radius.circular(16),
//                     ),
//                   ),
//                   child: const SizedBox(
//                     width: 48,
//                     height: 48,
//                     child: Center(
//                       child: Icon(Iconsax.add, color: Colors.white),
//                     ),
//                   ),
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }


// YHA TAK OROGINAL CODE HAI

// class TBrandTitleWithVerifiedIcon extends StatelessWidget {
//   const TBrandTitleWithVerifiedIcon({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Text(
//           'ACER',
//           overflow: TextOverflow.ellipsis,
//           maxLines: 1,
//           style: Theme.of(context).textTheme.labelMedium,
//         ),
//         const SizedBox(width: TSizes.xs),
//         const Icon(
//           Iconsax.verify5,
//           color: TColors.primary,
//           size: TSizes.iconSm,
//         ),
//       ],
//     );
//   }
// }

// class TCircularIcon extends StatelessWidget {
//   const TCircularIcon({
//     super.key,
//     required this.dark,
//   });

//   final bool dark;

//   @override
//   Widget build(BuildContext context) {
//     return Positioned(
//       top: 12,
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(100),
//           color: dark
//               ? Colors.black.withOpacity(0.9)
//               : Colors.white.withOpacity(0.9),
//         ),
//         child: IconButton(
//             onPressed: () {}, icon: const Icon(Iconsax.heart)),
//       ),
//     );
//   }
// }
