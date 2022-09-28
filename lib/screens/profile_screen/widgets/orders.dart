import 'package:day_4/constants/colors.dart';
import 'package:day_4/screens/orders_screen/orders_screen.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

import '../../../providers/themes.dart';

class Orders extends StatelessWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0,
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Orders',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      pushNewScreenWithRouteSettings(
                        context,
                        screen: const OrdersScreen(),
                        settings: const RouteSettings(
                          name: OrdersScreen.routeName,
                        ),
                        withNavBar: false,
                      );
                    },
                    child: const Text(
                      'View all',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ordersIcons(Icons.account_balance_wallet, 'Unpaid'),
                  ordersIcons(Icons.inventory, 'To be shipped'),
                  ordersIcons(Icons.local_shipping_rounded, 'Shipped'),
                  ordersIcons(Icons.storage, 'To be reviewed'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget ordersIcons(IconData icon, String text) {
    return Column(
      children: [
        Consumer<ThemeProvider>(
          builder: (_, value, ch) => Icon(
            icon,
            color: value.isDarkMode ? kDarkPrimaryColor : kPrimaryColor,
          ),
        ),
        Text(
          text,
          style: const TextStyle(
            fontSize: 10,
          ),
        ),
      ],
    );
  }
}
