import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:day_4/constants/colors.dart';
import 'package:day_4/providers/themes.dart';
import 'package:day_4/screens/core/widgets/image_holder.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

import '../../../models/product.dart';
import '../../single_product_overview/product_overview.dart';

class HomeOverviewSingleProductWidget extends StatelessWidget {
  const HomeOverviewSingleProductWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final darkTheme =
        Provider.of<ThemeProvider>(context, listen: false).isDarkMode;
    final product = Provider.of<Product>(
      context,
      listen: false,
    );

    return GestureDetector(
      onTap: () {
        pushNewScreenWithRouteSettings(
          context,
          screen: const ProductOverview(),
          settings: RouteSettings(
            name: ProductOverview.routeName,
            arguments: {
              'id': product.id,
            },
          ),
          withNavBar: false,
        );
      },
      child: Stack(
        children: [
          Card(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 2,
                  child: SizedBox(
                    width: double.infinity,
                    child: Card(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.zero,
                          bottomRight: Radius.zero,
                        ),
                      ),
                      color: Colors.white,
                      elevation: 0,
                      margin: const EdgeInsets.all(0),
                      child: ImageHolder(product.image),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          product.title,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              product.nairaPrice(product.price),
                              softWrap: true,
                              style: const TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            const SizedBox(width: 3),
                            if (product.oldPrice != null)
                              Text(
                                product.nairaPrice(product.oldPrice!),
                                softWrap: true,
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 13,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (product.oldPrice != null)
            Positioned(
              top: 3,
              right: 0,
              child: Badge(
                position: BadgePosition.topEnd(top: 2, end: 7),
                animationType: BadgeAnimationType.slide,
                showBadge: true,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                ),
                shape: BadgeShape.square,
                badgeColor: darkTheme ? kRedColor : kOrangeColor,
                badgeContent: product.oldPrice != null
                    ? Text(
                        '-${product.percentageoff(product.oldPrice!, product.price).toStringAsFixed(0)}%',
                        style: const TextStyle(fontSize: 13),
                      )
                    : Container(),
              ),
            )
        ],
      ),
    );
  }
}
