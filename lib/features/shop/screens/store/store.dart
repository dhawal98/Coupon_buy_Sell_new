import 'package:coupon_app/common/widgets/Appbar/appbar.dart';
import 'package:coupon_app/common/widgets/custom_shapes/containers/curved_edges/rounded_container.dart';
import 'package:coupon_app/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:coupon_app/common/widgets/images/t_circular_image.dart';
import 'package:coupon_app/common/widgets/product_cart/cart_menu_icon.dart';
import 'package:coupon_app/common/widgets/texts/section_heading.dart';
import 'package:coupon_app/common/widgets/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:coupon_app/utils/constants/colors.dart';
import 'package:coupon_app/utils/constants/enums.dart';
import 'package:coupon_app/utils/constants/image_strings.dart';
import 'package:coupon_app/utils/constants/sizes.dart';
import 'package:coupon_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text('Store', style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          TCartCounterIcon(
            onPressed: () {},
          ),
        ],
      ),
      body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: THelperFunction.isDarkMode(context)
                    ? Colors.black
                    : Colors.white,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      // search bar
                      const SizedBox(height: TSizes.spaceBtwItems),
                      const TSearchContainer(
                        text: 'Search in Store',
                        showBackground: true,
                        showBorder: true,
                      ),
                      // const TSearchContainer(
                      //     text: 'Search in store',
                      //     showBorder: true,
                      //     showBackground: false,
                      //     padding: EdgeInsets.zero),
                      const SizedBox(height: TSizes.spaceBtwSections),

                      /// feature brands
                      TSectionHeading(
                          title: 'Featured Brands',
                          showActionButton: true,
                          onPressed: () {}),
                      const SizedBox(height: TSizes.spaceBtwItems / 1.5),

                      GestureDetector(
                        onTap: () {},
                        child: TRoundedContainer(
                          padding: const EdgeInsets.all(TSizes.sm),
                          showBorder: true,
                          backgroundColor: Colors.transparent,
                          child: Row(
                            children: [
                              //icon
                              TCircularImage(
                                isNetworkImage: false,
                                image: TImages.cashpay,
                                backgroundColor: Colors.transparent,
                                overlayColor:
                                    THelperFunction.isDarkMode(context)
                                        ? TColors.white
                                        : Colors.black,
                              ),
                              const SizedBox(width: TSizes.spaceBtwItems / 2),

                              //text
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const TBrandTitleWithVerifiedIcon(
                                    title: 'Zometo',
                                    brandTextSize: TextSizes.large,
                                  ),
                                  Text(
                                    '6 Coupons',
                                    overflow: TextOverflow.ellipsis,
                                    style:
                                        Theme.of(context).textTheme.labelMedium,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: Container()),
    );
  }
}

// class TCircularImage extends StatelessWidget {
//   const TCircularImage({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 56,
//       height: 56,
//       padding: const EdgeInsets.all(TSizes.sm),
//       decoration: BoxDecoration(
//         color: THelperFunction.isDarkMode(context)
//             ? Colors.black
//             : Colors.white,
//         borderRadius: BorderRadius.circular(100),
//       ),
//       child: Image(
//           image:  const AssetImage(TImages.trevl),
//           color: THelperFunction.isDarkMode(context)
//               ? Colors.white
//               : TColors.dark),
//     );
//   }
// }
