class CartItemModel {
  final Map<String, dynamic> categoryItem;
  int quantity;
  CartItemModel({
    required this.categoryItem,
    this.quantity = 1,
  });
}
