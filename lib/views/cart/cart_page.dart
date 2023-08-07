

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'cart_controller.dart';

class CartPage extends GetView<CartController> {
  const CartPage({super.key});


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Get.put(CartController());
    return const Text('购物车');
  }

}
