import 'package:bijakassignment/constants/app_enums.dart';
import 'package:bijakassignment/feature/home/controller/home_controller.dart';
import 'package:get/get.dart';

class ProductDetailController extends GetxController {
  final HomeController _homeController = Get.find<HomeController>();

  Map<String,dynamic> response = {};

  Rx<ApiState> getProductState = ApiState.init.obs;

  getProduct(String productId) {
    getProductState.value = ApiState.isLoading;
    response = _homeController.recentlyOrdered
        .firstWhere((element) => element["id"] == productId);

    if (response.isNotEmpty) {
      getProductState.value = ApiState.success;
    } else {
      getProductState.value = ApiState.error;
    }
  }
}
