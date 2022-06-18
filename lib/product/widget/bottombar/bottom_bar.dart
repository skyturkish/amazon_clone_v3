import 'package:amazon_clone_v3/core/constants/color/color_constants.dart';
import 'package:amazon_clone_v3/view/account/view/account_view.dart';
import 'package:amazon_clone_v3/view/home/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  double bottomBarWidth = 42;
  double bottomBarBorderWidth = 5;

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  List<Widget> pages = [
    const HomeView(),
    const AccountView(),
    const Center(
      child: Text('Cart Page'),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        selectedItemColor: ColorVariables.selectedNavBarColor,
        unselectedItemColor: ColorVariables.unselectedNavBarColor,
        backgroundColor: ColorVariables.backgroundColor,
        iconSize: 28,
        onTap: updatePage,
        items: [
          //HOME
          BottomNavigationBarItem(
              icon: Container(
                width: bottomBarWidth,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                        color: _page == 0 ? ColorVariables.selectedNavBarColor : ColorVariables.backgroundColor,
                        width: bottomBarBorderWidth),
                  ),
                ),
                child: const Icon(
                  Icons.home_outlined,
                ),
              ),
              label: ' '),
          // ACCOUNT
          BottomNavigationBarItem(
              icon: Container(
                width: bottomBarWidth,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                        color: _page == 1 ? ColorVariables.selectedNavBarColor : ColorVariables.backgroundColor,
                        width: bottomBarBorderWidth),
                  ),
                ),
                child: const Icon(
                  Icons.person_outline_outlined,
                ),
              ),
              label: ' '),
          // CART
          BottomNavigationBarItem(
              icon: Container(
                width: bottomBarWidth,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                        color: _page == 2 ? ColorVariables.selectedNavBarColor : ColorVariables.backgroundColor,
                        width: bottomBarBorderWidth),
                  ),
                ),
                child: Badge(
                  elevation: 0,
                  badgeContent: const Text('2'),
                  badgeColor: Colors.white,
                  child: const Icon(Icons.shopping_cart),
                ),
              ),
              label: ' ')
        ],
      ),
    );
  }
}
