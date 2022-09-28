import 'package:badges/badges.dart';
import 'package:day_4/utils/naira.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

import '../../../constants/colors.dart';
import '../../../providers/auth.dart';
import '../../../models/product.dart';
import '../../../providers/reviews.dart';
import '../../../providers/themes.dart';
import '../../single_product_overview/product_overview.dart';
import 'image_holder.dart';

class GridProductTile extends StatelessWidget {
  const GridProductTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final darkTheme =
        Provider.of<ThemeProvider>(context, listen: false).isDarkMode;
    final product = Provider.of<Product>(context, listen: false);
    final auth = Provider.of<Auth>(context, listen: false).userId;
    final token = Provider.of<Auth>(context, listen: false).token;
    final reviews = Provider.of<Review>(context, listen: false)
        .singleReviewList(product.id);
    final rating = reviews.isNotEmpty
        ? reviews.map((m) => m.rating).reduce((a, b) => a + b) / reviews.length
        : 0.0;
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
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: const Offset(2, 3),
              blurRadius: 5,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          child: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child: ClipRRect(
                      child: SizedBox(
                        width: double.infinity,
                        child: Card(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0),
                              bottomRight: Radius.circular(0),
                            ),
                          ),
                          color: Colors.white,
                          elevation: 0,
                          margin: const EdgeInsets.all(0),
                          child: ImageHolder(product.image),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Card(
                      elevation: 0,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(0),
                        ),
                      ),
                      margin: const EdgeInsets.all(0),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5.0),
                              child: Text(
                                product.title,
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                  fontSize: 15,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Row(
                              children: [
                                RatingBarIndicator(
                                  rating: rating,
                                  itemBuilder: (ctx, index) => const Icon(
                                    Icons.star_rounded,
                                    color: Colors.orange,
                                  ),
                                  itemSize: 15,
                                  itemCount: 5,
                                ),
                                const SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  rating.toStringAsFixed(1),
                                  style: const TextStyle(
                                    fontSize: 13,
                                  ),
                                ),
                                Text(
                                  ' (${reviews.length.toString()})',
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5.0),
                              child: Text(
                                getNairaFormat().nairaPrice(product.price),
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5.0),
                              child: Text(
                                product.shippingFee == 0
                                    ? '+ Free Shipping'
                                    : '+ Shipping ${getNairaFormat().nairaPrice(product.shippingFee)}',
                                style: const TextStyle(
                                  color: kRedColor,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                child: Consumer<Product>(
                  builder: (ctx, product, child) => IconButton(
                    onPressed: () {
                      product.toggleFavourite(token, auth);
                    },
                    icon: Stack(
                      children: [
                        child!,
                        Icon(
                          product.isFavourite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: Colors.red,
                        ),
                      ],
                    ),
                  ),
                  child: Icon(
                    Icons.favorite,
                    key: UniqueKey(),
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
              ),
              if (product.oldPrice != null)
                Positioned(
                  top: 0,
                  right: 6,
                  child: Badge(
                    toAnimate: true,
                    position: BadgePosition.topEnd(top: 2, end: 7),
                    animationType: BadgeAnimationType.slide,
                    showBadge: product.percentageoff(
                          product.oldPrice!,
                          product.price,
                        ) >
                        0,
                    shape: BadgeShape.square,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                    ),
                    badgeColor: darkTheme ? kRedColor : kOrangeColor,
                    badgeContent: Text(
                      '-${product.percentageoff(
                            product.oldPrice!,
                            product.price,
                          ).toStringAsFixed(0)}%',
                      style: const TextStyle(fontSize: 13),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
