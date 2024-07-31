library home_screen;

import 'package:bijakassignment/common/assets/app_icons.dart';
import 'package:bijakassignment/common/controller/cart_controller.dart';
import 'package:bijakassignment/common/theme/app_colors.dart';
import 'package:bijakassignment/common/theme/app_textstyle.dart';
import 'package:bijakassignment/common/widgets/add_item_cart.dart';
import 'package:bijakassignment/common/widgets/app_scaffold.dart';
import 'package:bijakassignment/common/widgets/app_sizedbox.dart';
import 'package:bijakassignment/common/widgets/app_textfield.dart';
import 'package:bijakassignment/common/widgets/cart_nudget_widget.dart';
import 'package:bijakassignment/constants/app_string.dart';
import 'package:bijakassignment/feature/home/controller/home_controller.dart';
import 'package:bijakassignment/feature/home/widget/category_widget.dart';
import 'package:bijakassignment/feature/product_detail/controller/product_detail_controller.dart';
import 'package:bijakassignment/feature/product_detail/screen/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

part '../widget/app_bar_home_screen.dart';

part '../widget/horizontal_banner_widget.dart';

part '../widget/recently_ordered_widget.dart';

part '../widget/seasonal_product_widget.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find<CartController>();
    final ProductDetailController productDetailController =
        Get.find<ProductDetailController>();

    return AppScaffold(
      appBar: const AppBarHomeScreen(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///Search Text Field
              AppTextField(
                controller: controller.searchController,
                hintText: "Search Here",
                suffix: AppIcons.searchIcon,
              ),
              const AppSizedBox(
                height: 16,
              ),

              ///Horizontal Banner
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: controller.bannerImages
                      .map((image) => HorizontalBannerWidget(assetImage: image))
                      .toList(),
                ),
              ),
              const AppSizedBox(
                height: 16,
              ),

              ///Category List
              Text(
                "Category",
                style: AppTextStyle.f14w700.copyWith(
                  color: AppColors.colorBlack,
                ),
              ),
              const AppSizedBox(
                height: 8,
              ),
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: controller.category
                      .map((category) => CategoryWidget(
                            title: category["title"],
                            image: category["image"],
                          ))
                      .toList(),
                ),
              ),
              const AppSizedBox(
                height: 16,
              ),

              ///Recently Ordered
              Text(
                "Recently Ordered",
                style: AppTextStyle.f14w700.copyWith(
                  color: AppColors.colorBlack,
                ),
              ),
              const AppSizedBox(
                height: 8,
              ),
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: controller.recentlyOrdered
                      .map((product) => Obx(() {
                            bool isInCart = cartController.cart.any(
                                (cartItem) =>
                                    cartItem.categoryItem["id"] ==
                                    product["id"]);
                            return GestureDetector(
                              onTap: () {
                                Get.to(() => ProductDetail(
                                      productId: product["id"],
                                    ));
                              },
                              child: RecentlyOrderedWidget(
                                item: product,
                                isInCart: isInCart,
                                cartController: cartController,
                                productDetailController:
                                    productDetailController,
                              ),
                            );
                          }))
                      .toList(),
                ),
              ),
              const AppSizedBox(
                height: 16,
              ),

              ///Seasonal Products
              Text(
                "Seasonal Products",
                style: AppTextStyle.f14w700.copyWith(
                  color: AppColors.colorBlack,
                ),
              ),
              const AppSizedBox(
                height: 8,
              ),
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: controller.recentlyOrdered
                      .map((product) => Obx(() {
                            bool isInCart = cartController.cart.any(
                                (cartItem) =>
                                    cartItem.categoryItem["id"] ==
                                    product["id"]);
                            return GestureDetector(
                              onTap: () {
                                Get.to(() => ProductDetail(
                                      productId: product["id"],
                                    ));
                              },
                              child: SeasonalProductWidget(
                                isInCart: isInCart,
                                item: product,
                                cartController: cartController,
                                productDetailController:
                                    productDetailController,
                              ),
                            );
                          }))
                      .toList(),
                ),
              ),
              const AppSizedBox(
                height: 24,
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const Padding(
        padding: EdgeInsets.all(16.0),
        child: CartNudgeWidget(),
      ),
    );
  }
}
