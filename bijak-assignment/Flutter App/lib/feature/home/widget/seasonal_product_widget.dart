part of home_screen;

class SeasonalProductWidget extends StatelessWidget {
  final Map<String, dynamic> item;
  final bool isInCart;
  final CartController cartController;
  final ProductDetailController productDetailController;

  const SeasonalProductWidget({
    super.key,
    required this.isInCart,
    required this.item,
    required this.cartController,
    required this.productDetailController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        children: [
          Material(
            elevation: 3,
            borderRadius: const BorderRadius.all(
              Radius.circular(8.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ///Product Image
                  Image.asset(
                    item["product_image"],
                    height: 96,
                    width: 96,
                    fit: BoxFit.cover,
                  ),
                  const AppSizedBox(
                    width: 48,
                  ),

                  Column(
                    children: [
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
                        "${AppString.rupeeSign}${item["product_price"]..toStringAsFixed(0)}",
                        maxLines: 1,
                        style: AppTextStyle.f12w400.copyWith(
                          color: AppColors.colorGrey,
                        ),
                      ),

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
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
