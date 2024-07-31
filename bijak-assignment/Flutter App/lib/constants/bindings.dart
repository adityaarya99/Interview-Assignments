import 'package:bijakassignment/common/controller/cart_controller.dart';
import 'package:bijakassignment/feature/home/controller/home_controller.dart';
import 'package:bijakassignment/feature/product_detail/controller/product_detail_controller.dart';
import 'package:get/get.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    ///Home
    Get.lazyPut<HomeController>(
      () => (HomeController()),
      fenix: true,
    );

    ///Product Detail
    Get.lazyPut<ProductDetailController>(() => (ProductDetailController()),
        fenix: true);

    ///Cart
    Get.lazyPut<CartController>(
      () => (CartController()),
      fenix: true,
    );
  }
}
