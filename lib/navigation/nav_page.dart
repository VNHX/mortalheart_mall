


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mortalheart_mall/common/style/common_style.dart';
import 'package:mortalheart_mall/views/cart/cart_page.dart';
import 'package:mortalheart_mall/views/category/category_page.dart';
import 'package:mortalheart_mall/views/home/home_page.dart';
import 'package:mortalheart_mall/views/mine/mine_page.dart';
import 'package:mortalheart_mall/widgets/image/asset_image.dart';

class NavPage extends StatefulWidget {
  const NavPage({super.key});


  @override
  State<NavPage> createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> pages = [ const HomePage(),  const CategoryPage(),  const CartPage(),  const MinePage()];

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: [0, 1].contains(_selectedIndex) ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
      child: Material(
          child: Scaffold(
            body: IndexedStack(
              index: _selectedIndex,
              children: pages,
            ),
            bottomNavigationBar: Theme(
                data: ThemeData(
                  brightness: Brightness.light,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                ),
              child: BottomNavigationBar(
              iconSize: 24,
              enableFeedback: false,
              showUnselectedLabels: true,
              backgroundColor: Colors.white,
              type: BottomNavigationBarType.fixed,
              unselectedItemColor: Colors.black87,
              selectedItemColor: CommonStyle.themeColor,
              selectedLabelStyle: const TextStyle(fontSize: 14),
              unselectedLabelStyle: const TextStyle(fontSize: 14),
              items: [
                BottomNavigationBarItem(
                    icon: assetImage('images/ic_home.png', 30, 30),
                    activeIcon: assetImage('images/ic_home_active.png', 30, 30),
                    label: '首页'
                ),
                BottomNavigationBarItem(
                    icon: assetImage('images/ic_category.png', 30, 30),
                    activeIcon: assetImage('images/ic_category_active.png', 30, 30),
                    label: '分类'
                ),
                BottomNavigationBarItem(
                    icon: assetImage('images/ic_cart.png', 30, 30),
                    activeIcon: assetImage('images/ic_cart_active.png', 30, 30),
                    label: '购物车'
                ),
                BottomNavigationBarItem(
                    icon: assetImage('images/ic_mine.png', 30, 30),
                    activeIcon: assetImage("images/ic_mine_active.png", 30, 30),
                    label: '我的'
                )
              ],
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
            ),
          )
      ),
      )
    );
  }
}
