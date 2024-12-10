//ORIGINAL CODE

import 'package:coupon_app/utils/constants/colors.dart';
import 'package:coupon_app/utils/constants/sizes.dart';
import 'package:coupon_app/utils/devices/device_utility.dart';
import 'package:coupon_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TSearchContainer extends StatelessWidget {
  const TSearchContainer({
    super.key,
    required this.text,
    this.icon,
    this.showBackground = true,
    this.showBorder = true,
    this.onTap,
    this.padding = const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Container(
          width: TDeviceUtils.getScreenWidth(context),
          padding: const EdgeInsets.all(TSizes.md),
          decoration: BoxDecoration(
            color: showBackground
                ? dark
                    ? TColors.dark
                    : TColors.light.withOpacity(0.3)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
            border: showBackground ? Border.all(color: TColors.grey) : null,
          ),
          child: Row(
            children: [
              const Icon(Iconsax.search_normal, color: TColors.darkerGrey),
              const SizedBox(width: TSizes.spaceBtwItems),
              Text(text, style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ),
      ),
    );
  }
}


//-------------------------

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:coupon_app/utils/constants/colors.dart';
// import 'package:coupon_app/utils/constants/sizes.dart';
// import 'package:coupon_app/utils/devices/device_utility.dart';
// import 'package:coupon_app/utils/helpers/helper_function.dart';

// class TSearchContainer extends StatefulWidget {
//   final String text;
//   final IconData? icon;
//   final bool showBackground;
//   final bool showBorder;

//   const TSearchContainer({
//     Key? key,
//     required this.text,
//     this.icon,
//     this.showBackground = true,
//     this.showBorder = true,
//   }) : super(key: key);

//   @override
//   _TSearchContainerState createState() => _TSearchContainerState();
// }

// class _TSearchContainerState extends State<TSearchContainer> {
//   final TextEditingController _searchController = TextEditingController();
//   List<Map<String, dynamic>> searchResults = [];
//   bool isLoading = false;

//   void performSearch(String query) async {
//     if (query.isEmpty) {
//       setState(() => searchResults = []);
//       return;
//     }

//     setState(() => isLoading = true);

//     try {
//       final snapshot = await FirebaseFirestore.instance
//           .collection('market')
//           .where('companyName', isGreaterThanOrEqualTo: query)
//           .where('companyName', isLessThanOrEqualTo: query + '\uf8ff')
//           .get();

//       setState(() {
//         searchResults = snapshot.docs.map((doc) => doc.data()).toList();
//         isLoading = false;
//       });
//     } catch (e) {
//       debugPrint('Error searching: $e');
//       setState(() => isLoading = false);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final dark = THelperFunction.isDarkMode(context);

//     return Column(
//       children: [
//         Container(
//           padding: const EdgeInsets.all(TSizes.md),
//           decoration: BoxDecoration(
//             color: widget.showBackground
//                 ? dark
//                     ? TColors.dark
//                     : TColors.light.withOpacity(0.3)
//                 : Colors.transparent,
//             borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
//             border: widget.showBorder ? Border.all(color: TColors.grey) : null,
//           ),
//           child: Row(
//             children: [
//               const Icon(Iconsax.search_normal, color: TColors.darkerGrey),
//               const SizedBox(width: TSizes.spaceBtwItems),
//               Expanded(
//                 child: TextField(
//                   controller: _searchController,
//                   onChanged: performSearch,
//                   decoration: InputDecoration(
//                     hintText: widget.text,
//                     border: InputBorder.none,
//                   ),
//                   style: Theme.of(context).textTheme.bodySmall,
//                 ),
//               ),
//             ],
//           ),
//         ),
//         const SizedBox(height: 16),
//         isLoading
//             ? const CircularProgressIndicator()
//             : searchResults.isEmpty
//                 ? const Text('No results found')
//                 : ListView.builder(
//                     shrinkWrap: true,
//                     physics: const ClampingScrollPhysics(),
//                     itemCount: searchResults.length,
//                     itemBuilder: (context, index) {
//                       final result = searchResults[index];
//                       return ListTile(
//                         title: Text(result['companyName'] ?? 'Unknown'),
//                         subtitle:
//                             Text(result['description'] ?? 'No Description'),
//                         trailing: Text('₹${result['price'] ?? 'N/A'}'),
//                       );
//                     },
//                   ),
//       ],
//     );
//   }
// }
