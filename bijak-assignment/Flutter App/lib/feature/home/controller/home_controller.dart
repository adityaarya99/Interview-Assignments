import 'package:bijakassignment/common/assets/app_images.dart';
import 'package:bijakassignment/constants/app_string.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final TextEditingController searchController = TextEditingController();

  final List<String> bannerImages = [
    AppImages.bannerImage1,
    AppImages.bannerImage2,
    AppImages.bannerImage3,
  ];

  final List<Map<String, dynamic>> category = [
    {
      "title": "Vegetables",
      "image": "",
    },
    {
      "title": "Fruits",
      "image": "",
    },
    {
      "title": "Fresh Juice Items",
      "image": "",
    },
    {
      "title": "Combos",
      "image": "",
    },
    {
      "title": "Pure Produced Items",
      "image": "",
    },
  ];

  final List<Map<String, dynamic>> recentlyOrdered = [
    {
      "id": "1",
      "product_image": AppImages.apple,
      "product_description":
          "The apple is a popular fruit known for its sweet to tart flavor and crisp texture. "
              "It comes in various colors, including red, green, and yellow. Apples are rich in dietary fiber, "
              "vitamins, and antioxidants, making them a healthy snack choice. They can be eaten raw, cooked, or "
              "used in various dishes like pies, salads, and sauces. With numerous varieties available, apples are"
              " cultivated worldwide and are a staple in many diets.",
      "product_name": "Apple",
      "product_weight": "1kg",
      "product_price": 150.0,
    },
    {
      "id": "2",
      "product_image": AppImages.banana,
      "product_description":
          "The banana is a widely loved fruit known for its sweet taste and creamy texture."
              " It is typically elongated and curved, with a peel that ranges in color from green to yellow when ripe."
              " Bananas are rich in essential nutrients such as potassium, vitamin C, and dietary fiber."
              " They are a convenient snack, easy to peel and eat on the go, and are also used in a variety of dishes,"
              " from smoothies and desserts to baked goods. Bananas are grown in tropical regions around the world and "
              "are a staple in many diets.",
      "product_name": "Banana",
      "product_weight": "1kg",
      "product_price": 175.0,
    },
    {
      "id": "3",
      "product_image": AppImages.grape,
      "product_description":
          "Grapefruit is a tangy and slightly bitter citrus fruit, known for its large size and vibrant, "
              "juicy segments. It comes in various colors, including pink, red, and white, each offering a unique flavor profile."
              " Rich in vitamin C, antioxidants, and fiber, grapefruit is a nutritious addition to a healthy diet. It is commonly eaten fresh,"
              " juiced, or added to salads and desserts. Grown in subtropical regions, grapefruit is enjoyed for its refreshing taste and numerous health benefits, "
              "making it a popular choice for breakfast and snacks.",
      "product_name": "Grapes",
      "product_weight": "2kg",
      "product_price": 200.0,
    },
    {
      "id": "4",
      "product_image": AppImages.kiwi,
      "product_description":
          "Kiwi fruit, often simply called kiwi, is a small, oval fruit with a fuzzy brown skin"
              " and vibrant green flesh speckled with tiny black seeds. Known for its sweet and tangy flavor, kiwi is "
              "rich in vitamin C, vitamin K, potassium, and dietary fiber. The fruit is typically eaten fresh, either "
              "on its own or added to salads, desserts, and smoothies. Kiwi's refreshing taste and numerous health benefits "
              "make it a popular choice for those looking to boost their nutritional intake. It is cultivated in several countries, "
              "with New Zealand being one of the most famous producers.",
      "product_name": "Kiwi",
      "product_weight": "1kg",
      "product_price": 500.0,
    },
    {
      "id": "5",
      "product_image": AppImages.orange,
      "product_description":
          "Orange is a popular citrus fruit known for its juicy, sweet, and tangy flavor. "
              "It has a bright orange rind and segmented flesh packed with vitamin C, antioxidants, and dietary fiber."
              " Oranges are typically consumed fresh, juiced, or used in various culinary dishes and desserts. "
              "They are also a common ingredient in beverages and marmalades. Grown in tropical and subtropical regions,"
              " oranges are celebrated for their refreshing taste and numerous health benefits, making them a staple in many diets worldwide.",
      "product_name": "Orange",
      "product_weight": "500gm",
      "product_price": 400.0,
    }
  ];
}
