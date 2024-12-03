import 'package:coupon_app/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:coupon_app/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:coupon_app/common/widgets/layouts/grid_layout.dart';
import 'package:coupon_app/common/widgets/products/products_cards/product_card_vertical.dart';
import 'package:coupon_app/common/widgets/texts/section_heading.dart';
import 'package:coupon_app/features/authentication/screens/home/widgets/home_appbar.dart';
import 'package:coupon_app/features/authentication/screens/home/widgets/home_categories.dart';
import 'package:coupon_app/features/authentication/screens/home/widgets/promo_slider.dart';
import 'package:coupon_app/utils/constants/image_strings.dart';
import 'package:coupon_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, String>> couponData = [
    {
      'companyName': 'Acer',
      'title': 'Keyboard',
      'price': '50',
      'imageUrl': 'https://example.com/keyboard_image.jpg',
    },
    {
      'companyName': 'Samsung',
      'title': 'Phone',
      'price': '500',
      'imageUrl': 'https://example.com/phone_image.jpg',
    },
    // Add more dynamic data as required.
  ];

  HomeScreen({super.key});

//    Center(
//       child: Image.network(
//         'https://example.com/sample-image.jpg', // Replace with your image URL
//         loadingBuilder: (context, child, loadingProgress) {
//           if (loadingProgress == null) {
//            return child; // Image loaded successfully
//          } else {
//            return CircularProgressIndicator(); // Show a loader until the image is loaded
//          }
//        },
//          errorBuilder: (context, error, stackTrace) {
//          return Text('Failed to load image'); // Show an error message if image fails to load
//         },
//       ),
//     ),

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TPrimaryHeaderContainer(
              child: Column(
                children: [
                  THomeAppBar(),

                  SizedBox(
                    height: TSizes.spaceBtwInputFeild,
                  ),

                  // Search bar
                  TSearchContainer(
                    text: 'Search in Store',
                  ),

                  SizedBox(height: TSizes.spaceBtwSections),

                  Padding(
                    padding: EdgeInsets.only(
                        left: TSizes.defaultSpace / 2,
                        right: TSizes.defaultSpace / 2),
                    child: Column(
                      children: [
                        TSectionHeading(
                          title: 'Popular Categories',
                          showActionButton: false,
                          textColor: Colors.white,
                        ),
                        SizedBox(height: TSizes.spaceBtwItems),
                        THomeCategories(),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Bottom section
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  const TPromoSlider(banners: [
                    TImages.baner1,
                    TImages.baner2,
                    TImages.baner3,
                  ]),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  TSectionHeading(
                    title: 'Popular Products',
                    onPressed: () {},
                    showActionButton: false,
                  ),

                  const SizedBox(height: TSizes.spaceBtwSections),

                  // Displaying dynamic product data
                  TGridLayout(
                    itemCount: couponData.length,
                    itemBuilder: (_, index) {
                      final coupon = couponData[index];
                      return TProductCardVertical(
                        companyName: coupon['companyName']!,
                        price: coupon['price']!,
                        title: coupon['title']!,
                        imageUrl: coupon['imageUrl']!,
                      );
                    },
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




// yha tk code h original ---------
// // import 'package:coupon_app/common/widgets/Appbar/appBar.dart';
// // import 'package:coupon_app/common/widgets/custom_shapes/containers/circular_container.dart';
// // import 'package:coupon_app/common/widgets/custom_shapes/containers/curved_edges/curved_edge_widget.dart';
// // import 'package:coupon_app/common/widgets/custom_shapes/containers/curved_edges/curved_edges.dart';
// // import 'package:carousel_slider/carousel_slider.dart';
// // import 'package:coupon_app/common/widgets/custom_shapes/containers/circular_container.dart';
// import 'package:coupon_app/common/widgets/custom_shapes/containers/primary_header_container.dart';
// import 'package:coupon_app/common/widgets/custom_shapes/containers/search_container.dart';
// import 'package:coupon_app/common/widgets/layouts/grid_layout.dart';
// import 'package:coupon_app/common/widgets/products/products_cards/product_card_vertical.dart';
// // import 'package:coupon_app/common/widgets/images/t_rounded_image.dart';
// // import 'package:coupon_app/common/widgets/image_text_widgets/vertical_image_text.dart';
// import 'package:coupon_app/common/widgets/texts/section_heading.dart';
// // import 'package:coupon_app/common/widgets/product_cart/cart_menu_icon.dart';
// import 'package:coupon_app/features/authentication/screens/home/widgets/home_appbar.dart';
// import 'package:coupon_app/features/authentication/screens/home/widgets/home_categories.dart';
// import 'package:coupon_app/features/authentication/screens/home/widgets/promo_slider.dart';
// // import 'package:coupon_app/utils/constants/colors.dart';
// import 'package:coupon_app/utils/constants/image_strings.dart';
// // import 'package:coupon_app/utils/constants/colors.dart';
// // import 'package:coupon_app/utils/constants/image_strings.dart';
// import 'package:coupon_app/utils/constants/sizes.dart';
// // import 'package:coupon_app/utils/helpers/helper_function.dart';
// // import 'package:coupon_app/utils/constants/colors.dart';
// // import 'package:coupon_app/utils/constants/colors.dart';
// import 'package:flutter/material.dart';
// // import 'package:iconsax/iconsax.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             const TPrimaryHeaderContainer(
//               child: Column(
//                 children: [
//                   THomeAppBar(),

//                   SizedBox(
//                     height: TSizes.spaceBtwInputFeild,
//                   ),

//                   // ab search bar
//                   TSearchContainer(
//                     text: 'Search in Store',
//                   ),

//                   SizedBox(height: TSizes.spaceBtwSections),

//                   Padding(
//                     padding: EdgeInsets.only(
//                         left: TSizes.defaultSpace / 2,
//                         right: TSizes.defaultSpace / 2),
//                     child: Column(
//                       children: [
//                         TSectionHeading(
//                           title: 'Popular Categories',
//                           showActionButton: false,
//                           textColor: Colors.white,
//                         ),
//                         SizedBox(height: TSizes.spaceBtwItems),
//                         THomeCategories(),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             // ab niche ka part
//             Padding(
//               padding: const EdgeInsets.all(TSizes.defaultSpace),
//               child: Column(
//                 children: [
//                   const TPromoSlider(banners: [
//                     TImages.baner1,
//                     TImages.baner2,
//                     TImages.baner3,
//                   ]),
//                   const SizedBox(height: TSizes.spaceBtwSections),

//                   TSectionHeading(
//                     title: 'popular products',
//                     onPressed: () {},
//                     showActionButton: false,
//                   ),

//                   const SizedBox(height: TSizes.spaceBtwSections),

//                   // popular products-- new products
//                   TGridLayout(
//                     itemCount: 1,
//                     itemBuilder: (_, index) => const TProductCardVertical(
//                       companyName: 'acer',
//                       price: '50',
//                       title: 'keyboard',
//                       imageUrl: ' ',
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


// // YHA SE MAIN CODE HAI

// // class TGridLayout extends StatelessWidget {
// //   const TGridLayout({
// //     super.key,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     return GridView.builder(
// //         itemCount: 4,
// //         shrinkWrap: true,
// //         padding: EdgeInsets.zero,
// //         physics: const NeverScrollableScrollPhysics(),
// //         gridDelegate:
// //             const SliverGridDelegateWithFixedCrossAxisCount(
// //           crossAxisCount: 2,
// //           mainAxisSpacing: TSizes.gridViewSpacing,
// //           crossAxisSpacing: TSizes.gridViewSpacing,
// //           mainAxisExtent: 288,
// //         ),
// //         itemBuilder: (_, index) => const TProductCardVertical());
// //   }
// // }

// // class TPromoSlider extends StatelessWidget {
// //   const TPromoSlider({
// //     super.key,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     return Column(
// //       children: [
// //         CarouselSlider(
// //           options: CarouselOptions(
// //             viewportFraction: 0.7,
// //           ),
// //           items: const [
// //             TRoundedImage(imageUrl: TImages.baner1),
// //             TRoundedImage(imageUrl: TImages.baner2),
// //             TRoundedImage(imageUrl: TImages.baner3),
// //           ],
// //         ),
// //         const SizedBox(height: TSizes.spaceBtwItems),
    
// //         Row(
// //           children: [
// //             for (int i = 0; i < 3; i++)
// //               const TCircularContainer(
// //                 width: 20,
// //                 hight: 4,
// //                 margin: EdgeInsets.only(right: 10),
// //                 backgroundColor: Colors.black,
// //               ),
// //           ],
// //         ),
    
// //         // Row(
// //         //   children: [
// //         //     for (int i = 0; i < 3; i++)
// //         //       TCircularContainer(
// //         //         width: 20,
// //         //         hight: 20,
// //         //         margin: EdgeInsets.only(right: 10),
// //         //         backgroundColor: Colors.black,
// //         //       ),
// //         //   ],
// //         // )
// //       ],
// //     );
// //   }
// // }

// // class TRoundedImage extends StatelessWidget {
// //   const TRoundedImage({
// //     super.key,
// //     this.width,
// //     this.height,
// //     required this.imageUrl,
// //     this.applyImageRadius = true,
// //     this.border,
// //     this.backgroundColor = TColors.light,
// //     this.fit = BoxFit.contain,
// //     this.padding,
// //     this.isNetworkImage = false,
// //     this.onPressed,
// //     this.borderRadius = TSizes.md,
// //   });

// //   final double? width, height;
// //   final String imageUrl;
// //   final bool applyImageRadius;
// //   final BoxBorder? border;
// //   final Color backgroundColor;
// //   final BoxFit? fit;
// //   final EdgeInsetsGeometry? padding;
// //   final bool isNetworkImage;
// //   final VoidCallback? onPressed;
// //   final double borderRadius;

// //   @override
// //   Widget build(BuildContext context) {
// //     return GestureDetector(
// //       onTap: onPressed,
// //       child: Container(
// //         width: width,
// //         height: height,
// //         padding: padding,
// //         decoration: BoxDecoration(
// //           border: border,
// //           color: backgroundColor,
// //           borderRadius: BorderRadius.circular(borderRadius),
// //         ),
// //         child: ClipRRect(
// //             borderRadius: applyImageRadius
// //                 ? BorderRadius.circular(borderRadius)
// //                 : BorderRadius.zero,
// //             child: Image(
// //               fit: fit,
// //               image: isNetworkImage
// //                   ? NetworkImage(imageUrl)
// //                   : AssetImage(imageUrl) as ImageProvider,
// //             )),
// //       ),
// //     );
// //   }
// // }

// // class THomeCategories extends StatelessWidget {
// //   const THomeCategories({
// //     super.key,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     return SizedBox(
// //       height: 80,
// //       child: ListView.builder(
// //         shrinkWrap: true,
// //         itemCount: 6,
// //         scrollDirection: Axis.horizontal,
// //         itemBuilder: (_, index) {
// //           return TVerticalImageText(
// //             image: TImages.cashpay,
// //             title: 'category',
// //             onTop: () {},
// //           );
// //         },
// //       ),
// //     );
// //   }
// // }

// // class TVerticalImageText extends StatelessWidget {
// //   const TVerticalImageText({
// //     super.key,
// //     required this.image,
// //     required this.title,
// //     this.textColor = Colors.white,
// //     this.backgroundColor = TColors.white,
// //     this.onTop,
// //   });

// //   final String image, title;
// //   final Color textColor;
// //   final Color? backgroundColor;
// //   final void Function()? onTop;

// //   @override
// //   Widget build(BuildContext context) {
// //     final dark = THelperFunction.isDarkMode(context);
// //     return GestureDetector(
// //       onTap: onTop,
// //       child: Padding(
// //         padding: const EdgeInsets.only(right: TSizes.spaceBtwItems),
// //         child: Column(
// //           children: [
// //             Container(
// //               width: 56,
// //               height: 56,
// //               padding: const EdgeInsets.all(TSizes.sm),
// //               decoration: BoxDecoration(
// //                 color: backgroundColor ?? (dark ? Colors.black : Colors.white),
// //                 borderRadius: BorderRadius.circular(100),
// //               ),
// //               child: Center(
// //                 child: Image(
// //                   image: AssetImage(image),
// //                   fit: BoxFit.cover,
// //                   color: dark ? TColors.light : TColors.dark,
// //                 ),
// //               ),
// //             ),
// //             const SizedBox(height: TSizes.spaceBtwItems / 2),
// //             SizedBox(
// //               width: 55,
// //               child: Text(
// //                 title,
// //                 style: Theme.of(context)
// //                     .textTheme
// //                     .labelMedium!
// //                     .apply(color: textColor),
// //                 maxLines: 1,
// //                 overflow: TextOverflow.ellipsis,
// //               ),
// //             )
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class TSectionHeading extends StatelessWidget {
// //   const TSectionHeading({
// //     super.key,
// //     this.textColor,
// //     this.showActionButton = false,
// //     required this.title,
// //     this.buttonTitle = 'View all',
// //     this.onPressed,
// //   });

// //   final Color? textColor;
// //   final bool showActionButton;
// //   final String title, buttonTitle;
// //   final void Function()? onPressed;

// //   @override
// //   Widget build(BuildContext context) {
// //     return Row(
// //       children: [
// //         Text(
// //           title,
// //           style: Theme.of(context).textTheme.headlineSmall!.apply(color: textColor),
// //           maxLines: 1,
// //           overflow: TextOverflow.ellipsis,
// //         ),
// //         if(showActionButton) TextButton(onPressed: () {}, child: Text(buttonTitle))
// //       ],
// //     );
// //   }
// // }

// // class TSearchContainer extends StatelessWidget {
// //   const TSearchContainer({
// //     super.key,
// //     required this.text,
// //     this.icon,
// //     this.showBackground = true,
// //     this.showBorder = true,
// //   });

// //   final String text;
// //   final IconData? icon;
// //   final bool showBackground, showBorder;

// //   @override
// //   Widget build(BuildContext context) {
// //     final dark = THelperFunction.isDarkMode(context);
// //     return Padding(
// //       padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
// //       child: Container(
// //         width: TDeviceUtils.getScreenWidth(context),
// //         padding: const EdgeInsets.all(TSizes.md),
// //         decoration: BoxDecoration(
// //           color: showBackground
// //               ? dark
// //                   ? TColors.dark
// //                   : TColors.light.withOpacity(0.3)
// //               : Colors.transparent,
// //           borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
// //           border: showBackground ? Border.all(color: TColors.grey) : null,
// //         ),
// //         child: Row(
// //           children: [
// //             const Icon(Iconsax.search_normal, color: TColors.darkerGrey),
// //             const SizedBox(width: TSizes.spaceBtwItems),
// //             Text(text, style: Theme.of(context).textTheme.bodySmall),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class THomeAppBar extends StatelessWidget {
// //   const THomeAppBar({
// //     super.key,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     return TAppBar(
// //       title: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           Text(
// //             'Good Day For Shopping',
// //             style: Theme.of(context)
// //                 .textTheme
// //                 .labelMedium!
// //                 .apply(color: Colors.grey),
// //           ),
// //           Text(
// //             'Mr/Mrs xyz',
// //             style: Theme.of(context)
// //                 .textTheme
// //                 .headlineSmall!
// //                 .apply(color: Colors.white),
// //           ),
// //         ],
// //       ),
// //       actions: [
// //         TCartCounterIcon(
// //           onPressed: () {},
// //           iconColor: TColors.white,
// //         )
// //       ],
// //     );
// //   }
// // }

// // class TCartCounterIcon extends StatelessWidget {
// //   const TCartCounterIcon({
// //     super.key,
// //     required this.onPressed,
// //     required this.iconColor,
// //   });

// //   final VoidCallback onPressed;
// //   final Color iconColor;

// //   @override
// //   Widget build(BuildContext context) {
// //     return Stack(
// //       children: [
// //         IconButton(
// //           onPressed: onPressed,
// //           icon: Icon(Iconsax.shopping_bag, color: iconColor),
// //         ),
// //         Positioned(
// //           right: 0,
// //           child: Container(
// //             width: 18,
// //             height: 18,
// //             decoration: BoxDecoration(
// //               color: TColors.block,
// //               borderRadius: BorderRadius.circular(100),
// //             ),
// //             child: Center(
// //               child: Text(
// //                 'x',
// //                 style: Theme.of(context)
// //                     .textTheme
// //                     .labelLarge!
// //                     .apply(color: TColors.white, fontSizeFactor: 0.8),
// //               ),
// //             ),
// //           ),
// //         ),
// //       ],
// //     );
// //   }
// // }
