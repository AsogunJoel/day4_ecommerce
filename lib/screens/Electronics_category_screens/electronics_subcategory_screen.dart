import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

import '../../providers/category.dart';
import 'electronics_category._screen.dart';
import 'widgets/elec_sub_category_tile.dart';

class ElectronicsScreen extends StatelessWidget {
  const ElectronicsScreen({Key? key}) : super(key: key);
  static const routeName = '/Electrics_Screen';

  @override
  Widget build(BuildContext context) {
    final category =
        Provider.of<Category>(context, listen: false).CATEGORIES[0];
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              pushNewScreenWithRouteSettings(
                context,
                screen: const ElectronicsProductScreen(),
                settings: RouteSettings(
                    name: ElectronicsProductScreen.routeName,
                    arguments: {'title': category.title}),
                // withNavBar: false,
              );
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      'All Products',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SubCategoryList(category.subcategory),
        ],
      ),
    );
  }
}
