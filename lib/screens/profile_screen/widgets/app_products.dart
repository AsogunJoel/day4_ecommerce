import 'package:day_4/screens/Form_page/form_page.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

import '../../../constants/colors.dart';
import '../../../providers/themes.dart';
import '../../All_products/all_product.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        onTap: () {
          pushNewScreenWithRouteSettings(
            context,
            screen: ManageProduct(),
            settings: const RouteSettings(
              name: ManageProduct.routeName,
            ),
            withNavBar: false,
          );
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        title: Row(
          children: [
            Consumer<ThemeProvider>(
              builder: (_, value, ch) => Icon(
                Icons.inventory,
                color: value.isDarkMode ? kDarkPrimaryColor : kPrimaryColor,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'All Product',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
