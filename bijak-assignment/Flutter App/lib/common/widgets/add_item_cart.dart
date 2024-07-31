import 'package:bijakassignment/common/assets/app_icons.dart';
import 'package:bijakassignment/common/controller/cart_controller.dart';
import 'package:bijakassignment/common/theme/app_colors.dart';
import 'package:bijakassignment/common/theme/app_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddItemCart extends StatelessWidget {
  final Map<String, dynamic> item;
  final CartController cartController;

  const AddItemCart(
      {super.key, required this.item, required this.cartController});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        margin: const EdgeInsets.all(0.0),
        decoration: BoxDecoration(
            color: AppColors.colorGreen.withOpacity(0.7),
            borderRadius: const BorderRadius.all(Radius.circular(12.0))),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {
                cartController.addItemInCart(item: item);
              },
              icon: AppIcons.addIcon,
              color: AppColors.colorWhite,
            ),
            Text(
              cartController.getItemQuantity(item: item).toString(),
              style: AppTextStyle.f14w700.copyWith(
                color: AppColors.colorWhite,
              ),
            ),
            IconButton(
              onPressed: () {
                cartController.removeItemInCart(item: item);
              },
              icon: AppIcons.minusIcon,
              color: AppColors.colorWhite,
            ),
          ],
        ),
      );
    });
  }
}
