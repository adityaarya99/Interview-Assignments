library product_detail;

import 'package:bijakassignment/common/controller/cart_controller.dart';
import 'package:bijakassignment/common/theme/app_colors.dart';
import 'package:bijakassignment/common/theme/app_textstyle.dart';
import 'package:bijakassignment/common/widgets/add_item_cart.dart';
import 'package:bijakassignment/common/widgets/app_scaffold.dart';
import 'package:bijakassignment/common/widgets/app_sizedbox.dart';
import 'package:bijakassignment/common/widgets/cart_nudget_widget.dart';
import 'package:bijakassignment/constants/app_enums.dart';
import 'package:bijakassignment/constants/app_string.dart';
import 'package:bijakassignment/feature/product_detail/controller/product_detail_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetail extends StatefulWidget {
  final String productId;

  const ProductDetail({
    super.key,
    required this.productId,
  });

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  final ProductDetailController productDetailController =
      Get.find<ProductDetailController>();

  final CartController cartController = Get.find<CartController>();

  @override
  void initState() {
    productDetailController.getProduct(widget.productId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Obx(() {
        bool isInCart = cartController.cart.any((cartItem) =>
            cartItem.categoryItem["id"] ==
            productDetailController.response["id"]);
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: (productDetailController.getProductState.value ==
                  ApiState.isLoading)
              ? const Center(child: CupertinoActivityIndicator())
              : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ///Product Image
                      SizedBox(
                        width: 200,
                        height: 300,
                        child: AspectRatio(
                          aspectRatio: 2 / 3,
                          child: Image.asset(productDetailController
                              .response["product_image"]),
                        ),
                      ),
                      const AppSizedBox(
                        height: 8,
                      ),

                      ///Product Name
                      Text(
                        productDetailController.response["product_name"],
                        maxLines: 1,
                        style: AppTextStyle.f12w400.copyWith(
                          color: AppColors.colorBlack,
                        ),
                      ),
                      const AppSizedBox(
                        height: 4,
                      ),

                      ///Product Weight
                      Text(
                        productDetailController.response["product_weight"],
                        maxLines: 1,
                        style: AppTextStyle.f12w400.copyWith(
                          color: AppColors.colorGrey,
                        ),
                      ),
                      const AppSizedBox(
                        height: 4,
                      ),

                      ///Price of Product
                      Text(
                        "${AppString.rupeeSign}${productDetailController.response["product_price"]..toStringAsFixed(0)}",
                        maxLines: 1,
                        style: AppTextStyle.f12w400.copyWith(
                          color: AppColors.colorGrey,
                        ),
                      ),
                      const AppSizedBox(
                        height: 4,
                      ),

                      ///Product Description
                      Text(
                        productDetailController.response["product_description"],
                        maxLines: 3,
                        style: AppTextStyle.f12w400.copyWith(
                          color: AppColors.colorGrey,
                        ),
                      ),
                      const AppSizedBox(
                        height: 16,
                      ),

                      Center(
                        child: (isInCart)
                            ? AddItemCart(
                                item: productDetailController.response,
                                cartController: cartController,
                              )
                            : ElevatedButton(
                                onPressed: () {
                                  cartController.addItemInCart(
                                    item: productDetailController.response,
                                  );
                                },
                                child: const Text("Add to Cart"),
                              ),
                      ),
                    ],
                  ),
                ),
        );
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton:   const Padding(
              padding:  EdgeInsets.all(16.0),
              child: CartNudgeWidget(),
            )
    );
  }
}
