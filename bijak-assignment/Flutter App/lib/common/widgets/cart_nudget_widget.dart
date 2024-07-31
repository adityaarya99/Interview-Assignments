import 'package:bijakassignment/common/controller/cart_controller.dart';
import 'package:bijakassignment/common/theme/app_colors.dart';
import 'package:bijakassignment/common/theme/app_textstyle.dart';
import 'package:bijakassignment/constants/app_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartNudgeWidget extends GetView<CartController> {
  const CartNudgeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (controller.cart.isEmpty) ? const SizedBox.shrink() : Container(
        height: 60,
        decoration: const BoxDecoration(
            color: AppColors.colorGreen,
            borderRadius: BorderRadius.all(Radius.circular(12.0))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${controller.totalQuantity.value} Item in cart",
                style: AppTextStyle.f14w400.copyWith(
                  color: AppColors.colorWhite,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text("(${AppString.rupeeSign}${controller.totalAmount})",
                  style: AppTextStyle.f14w400.copyWith(
                    color: AppColors.colorWhite,
                    fontWeight: FontWeight.w600,
                  )),
            ],
          ),
        ),
      );
    });
  }
}
