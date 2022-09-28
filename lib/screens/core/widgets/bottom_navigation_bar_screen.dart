import 'package:day_4/providers/auth.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

import '../../../constants/colors.dart';
import '../../../providers/themes.dart';
import '../../cart/cart_screen.dart';
import '../../category_screen/category_overview_screen.dart';
import '../../home/home_screen.dart';
import '../../profile_screen/profile_screen.dart';
import 'cart_Widgets.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  @override
  void initState() {
    super.initState();
    Provider.of<Auth>(context, listen: false).initializer();
  }

  @override
  Widget build(BuildContext context) {
    PersistentTabController _controller;
    _controller = PersistentTabController(initialIndex: 0);
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(context),
      confineInSafeArea: true,
      backgroundColor: Provider.of<ThemeProvider>(context).isDarkMode
          ? Colors.grey.shade900
          : Colors.white,
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Provider.of<ThemeProvider>(context).isDarkMode
            ? Colors.grey.shade900
            : Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 100),
      ),
      navBarStyle: NavBarStyle.style13,
    );
  }
}

List<Widget> _buildScreens() {
  return [
    const HomeScreen(),
    const CategoryScreen(),
    const CartScreen(),
    const ProfileScreen(),
  ];
}

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

List<PersistentBottomNavBarItem> _navBarsItems(BuildContext context) {
  final _darkMode = Provider.of<ThemeProvider>(context).isDarkMode;
  return [
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.home),
      title: ("Home"),
      activeColorPrimary: _darkMode ? kDarkPrimaryColor : Colors.purple,
      inactiveColorPrimary: Colors.grey,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(
        Icons.view_list,
      ),
      title: ("Categories"),
      activeColorPrimary: _darkMode ? kDarkPrimaryColor : Colors.purple,
      inactiveColorPrimary: Colors.grey,
    ),
    PersistentBottomNavBarItem(
      icon: const CartButton(),
      title: ("Cart"),
      activeColorPrimary: _darkMode ? kDarkPrimaryColor : Colors.purple,
      inactiveColorPrimary: Colors.grey,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.account_circle_sharp),
      title: ("Profile"),
      activeColorPrimary: _darkMode ? kDarkPrimaryColor : Colors.purple,
      inactiveColorPrimary: Colors.grey,
    ),
  ];
}
