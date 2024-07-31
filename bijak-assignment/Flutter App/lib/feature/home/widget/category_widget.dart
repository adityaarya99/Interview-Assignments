import 'package:bijakassignment/common/assets/app_images.dart';
import 'package:bijakassignment/common/theme/app_colors.dart';
import 'package:bijakassignment/common/theme/app_textstyle.dart';
import 'package:bijakassignment/common/widgets/app_sizedbox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  final String title;
  final String image;
  const CategoryWidget({
    super.key,
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 48,
      margin: const EdgeInsets.only(right: 12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: const BoxDecoration(
              color: AppColors.colorGreen,
              borderRadius: BorderRadius.all(
                Radius.circular(
                  100.0,
                ),
              ),
              image: DecorationImage(
                image: AssetImage(
                  AppImages.apple,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const AppSizedBox(
            height: 4,
          ),
          Text(
            title.split(" ").join("\n"),
            textAlign: TextAlign.center,
            maxLines: 2,
            // overflow: TextOverflow.fade,
            style: AppTextStyle.f12w400,
          ),
        ],
      ),
    );
  }
}
