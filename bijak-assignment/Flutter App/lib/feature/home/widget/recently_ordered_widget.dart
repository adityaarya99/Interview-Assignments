part of home_screen;

class RecentlyOrderedWidget extends StatelessWidget {
  final Map<String, dynamic> item;
  final bool isInCart;
  final CartController cartController;
  final ProductDetailController productDetailController;

  const RecentlyOrderedWidget({
    super.key,
    required this.item,
    required this.isInCart,
    required this.cartController,
    required this.productDetailController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Column(
        children: [
          Material(
            elevation: 3,
            color: AppColors.colorWhite,
            borderRadius: const BorderRadius.all(
              Radius.circular(8.0),
            ),
            child: Column(
              children: [
                const AppSizedBox(
                  height: 4,
                ),

                ///Product Image
                Image.asset(
                  item["product_image"],
                  height: 96,
                  width: 96,
                  fit: BoxFit.cover,
                ),
                const AppSizedBox(
                  height: 4,
                ),

                ///Product Name
                Text(
                  item["product_name"],
                  maxLines: 1,
                  style: AppTextStyle.f12w400
                      .copyWith(color: AppColors.colorBlack),
                ),
                const AppSizedBox(
                  height: 4,
                ),

                ///Product Weight
                Text(
                  item["product_weight"],
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
                  "${AppString.rupeeSign}${item["product_price"].toStringAsFixed(0)}",
                  maxLines: 1,
                  style: AppTextStyle.f12w400.copyWith(
                    color: AppColors.colorGrey,
                  ),
                ),
                const AppSizedBox(
                  height: 4,
                ),
              ],
            ),
          ),
          const AppSizedBox(
            height: 8,
          ),

          ///Add to Cart

          (isInCart)
              ? AddItemCart(
                  item: item,
                  cartController: cartController,
                )
              : SizedBox(
                  width: 96,
                  child: ElevatedButton(
                    onPressed: () {
                      cartController.addItemInCart(item: item);
                    },
                    child: const Text(
                      "Add Cart",
                      style: AppTextStyle.f12w400,
                    ),
                  ),
                )
        ],
      ),
    );
  }
}
