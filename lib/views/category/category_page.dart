
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'category_controller.dart';

class CategoryPage extends GetView<CategoryController> {
  const CategoryPage({super.key});


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Get.put(CategoryController());
    return const Text('我是分类');
  }

}
