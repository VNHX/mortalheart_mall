import 'package:get/get.dart';
import 'package:mortalheart_mall/views/cart/cart_page.dart';
import 'package:mortalheart_mall/views/category/category_page.dart';
import 'package:mortalheart_mall/views/home/home_page.dart';
import 'package:mortalheart_mall/views/mine/mine_page.dart';
import 'package:mortalheart_mall/views/not_found/not_found_page.dart';
import 'package:mortalheart_mall/views/splash/splash_page.dart';
import 'package:mortalheart_mall/views/stroll/stroll_page.dart';

import 'routing_constants.dart';

/// 路由管理
/// 如何拦截要登录的页面？
/// 只需要在 GetPage 里面加上 middlewares: [RouteAuthMiddleware(priority: 1),] 即可
abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.homeRoute,
      page: () => const HomePage(),
      // transitionDuration: const Duration(milliseconds: 300),
      // transition: Transition.rightToLeft,
      title: '首页',
    ),
    GetPage(
        name:  Routes.splashRoute,
        page: ()=> const SplashPage(),
        title:'启动页',
        transition: Transition.fade,
    ),
    GetPage(
      name:  Routes.cartRoute,
      page: ()=> const CartPage(),
      title:'购物车',
      transition: Transition.fade,
    ),
    GetPage(
      name:  Routes.categoryRoute,
      page: ()=> const CategoryPage(),
      title:'分类',
      transition: Transition.fade,
    ),
    GetPage(
      name:  Routes.mineRoute,
      page: ()=> const MinePage(),
      title:'我的',
      transition: Transition.fade,
    ),
    GetPage(
        name: Routes.strollRoute,
        page: ()=> const StrollPage(),
        title:'逛',
        transition: Transition.fade,
    )
  ];

  //未知路由
  static final unknownRoute = GetPage(
      name: Routes.notFoundRoute,
      page: () => const NotFoundPage(),
  );
}
