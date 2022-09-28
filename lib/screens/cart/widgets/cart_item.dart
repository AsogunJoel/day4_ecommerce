import 'package:day_4/constants/colors.dart';
import 'package:day_4/providers/themes.dart';
import 'package:day_4/screens/cart/widgets/details_block.dart';
import 'package:day_4/screens/core/widgets/image_holder.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

import '../../../providers/cartitem.dart';
import '../../single_product_overview/product_overview.dart';

class SingleCartItem extends StatelessWidget {
  const SingleCartItem(this.cart, this.id, this.productId, this.price,
      this.quantity, this.title, this.image, this.shipping, this.color,
      {Key? key})
      : super(key: key);
  final Cart cart;
  final String id;
  final String productId;
  final num price;
  final int quantity;
  final String title;
  final String image;
  final num shipping;
  final String? color;
  @override
  Widget build(BuildContext context) {
    final total = price * quantity + shipping;

    return GestureDetector(
      onTap: () {
        pushNewScreenWithRouteSettings(
          context,
          screen: const ProductOverview(),
          settings: RouteSettings(
            arguments: {
              'id': productId,
            },
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2.0),
        child: Dismissible(
          onDismissed: (direction) {
            Provider.of<Cart>(context, listen: false).removeItem(
              productId,
            );
          },
          direction: DismissDirection.endToStart,
          confirmDismiss: (direction) {
            return showDialog(
              context: context,
              builder: (ctx) {
                return AlertDialog(
                  title: const Text('Are you sure ?'),
                  content: const Text(' Item will be removed from cart'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(ctx).pop(false);
                      },
                      child: const Text('No'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(ctx).pop(true);
                      },
                      child: const Text('Yes'),
                    )
                  ],
                );
              },
            );
          },
          key: UniqueKey(),
          background: Card(
            margin: const EdgeInsets.all(0),
            elevation: 0,
            color: Theme.of(context).errorColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Text(
                  'Delete',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 15),
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          child: Card(
            elevation: 0,
            margin: const EdgeInsets.all(0),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: ImageHolder(image),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: DetailBlock(
                    title: title,
                    price: price,
                    shipping: shipping,
                    total: total,
                    productId: productId,
                    quantity: quantity,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
