import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/colors.dart';
import '../../../providers/themes.dart';
import '../../wishlist/wishlist_screen.dart';

class Services extends StatelessWidget {
  const Services({Key? key}) : super(key: key);

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
                children: const [
                  Text(
                    'Services',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              color: Colors.transparent,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 3 / 2,
                ),
                shrinkWrap: true,
                children: [
                  ordersIcons(Icons.account_balance_wallet_rounded, 'Wallet'),
                  ordersIcons(Icons.location_on, 'Shipping Address'),
                  ordersIcons(Icons.card_giftcard, 'Coupons'),
                  ordersIcons(Icons.view_list, 'Redeem invite code'),
                  ordersIcons(Icons.help_center, 'Help Centre'),
                  ordersIcons(Icons.question_answer, 'Question & Answer'),
                  ordersIcons(Icons.edit, 'App Suggestion'),
                  ordersIcons(Icons.attach_money, 'Bonus buddies'),
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
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 10,
          ),
        )
      ],
    );
  }
}
