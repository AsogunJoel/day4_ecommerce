import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/colors.dart';
import '../../../providers/cartitem.dart';
import '../../cart/cart_screen.dart';

class CartButton extends StatelessWidget {
  const CartButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final value = Provider.of<Cart>(context).itemCount;
    return Badge(
      animationType: BadgeAnimationType.scale,
      showBadge: value > 0,
      badgeContent: Text(value.toString()),
      child: const Icon(
        Icons.shopping_cart,
      ),
      toAnimate: true,
      shape: BadgeShape.circle,
      badgeColor: kRedColor,
      borderRadius: BorderRadius.circular(8),
    );
  }
}

class AppBarCart extends StatelessWidget {
  const AppBarCart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(CartScreen.routeName);
        },
        child: Badge(
          animationType: BadgeAnimationType.scale,
          showBadge: value.itemCount > 0,
          position: BadgePosition.topEnd(top: -1, end: -5),
          badgeContent: Text(value.itemCount.toString()),
          child: const Icon(
            Icons.shopping_cart,
          ),
          toAnimate: true,
          shape: BadgeShape.circle,
          badgeColor: kRedColor,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
