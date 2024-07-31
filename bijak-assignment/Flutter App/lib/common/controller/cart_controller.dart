import 'package:bijakassignment/common/model/cart_item_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  List<CartItemModel> cart = <CartItemModel>[].obs;

  RxDouble totalAmount = 0.0.obs;

  RxInt totalQuantity = 0.obs;

  void addItemInCart({required Map<String, dynamic> item}) {
    int index = cart.indexWhere((i) => i.categoryItem["id"] == item["id"]);
    if (index == -1) {
      cart.add(CartItemModel(categoryItem: item));
    } else {
      cart[index] = CartItemModel(
        categoryItem: cart[index].categoryItem,
        quantity: cart[index].quantity + 1,
      );
    }
    calculateTotal();
  }

  void removeItemInCart({required Map<String, dynamic> item}) {
    int index = cart.indexWhere((i) => i.categoryItem["id"] == item["id"]);
    if (index != -1) {
      if (cart[index].quantity > 1) {
        cart[index] = CartItemModel(
          categoryItem: cart[index].categoryItem,
          quantity: cart[index].quantity - 1,
        );
      } else {
        cart.removeAt(index);
      }
    }
    calculateTotal();
  }

  void calculateTotal() {
    ///Total Amount
    totalAmount.value = cart.fold(
      0,
      (sum, cartItem) =>
          sum + cartItem.categoryItem["product_price"]! * cartItem.quantity,
    );

   ///Total Quantity
    totalQuantity.value = cart.fold(
      0,
          (sum, cartItem) => sum + cartItem.quantity,
    );
  }

  int getItemQuantity({required Map<String, dynamic> item}) {
    int index = cart.indexWhere((i) => i.categoryItem["id"] == item["id"]);
    if (index != -1) {
      return cart[index].quantity;
    }
    return 0;
  }
}
