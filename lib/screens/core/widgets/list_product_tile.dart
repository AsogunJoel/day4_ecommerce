import 'package:day_4/utils/naira.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

import '../../../constants/colors.dart';
import '../../../models/product.dart';
import '../../../providers/reviews.dart';
import '../../single_product_overview/product_overview.dart';
import 'image_holder.dart';

class ListProductTile extends StatelessWidget {
  const ListProductTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final reviews = Provider.of<Review>(context, listen: false)
        .singleReviewList(product.id);
    final rating = reviews.isNotEmpty
        ? reviews.map((m) => m.rating).reduce((a, b) => a + b) / reviews.length
        : 0.0;
    return GestureDetector(
      onTap: () {
        pushNewScreenWithRouteSettings(context,
            screen: ProductOverview(),
            settings: RouteSettings(
              arguments: {
                'id': product.id,
              },
            ),
            withNavBar: false);
      },
      child: Card(
        margin: const EdgeInsets.all(1),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 150,
              height: 150,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                ),
                child: Container(
                  color: Colors.white,
                  child: ImageHolder(product.image),
                ),
              ),
            ),
            Container(
              width: 200,
              height: 130,
              margin: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style: const TextStyle(fontSize: 15),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
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
                  Text(
                    getNairaFormat().nairaPrice(product.price),
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
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
                  const Spacer(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
