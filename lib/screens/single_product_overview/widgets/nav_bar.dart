import 'package:day_4/screens/payment/payment_page.dart';
import 'package:day_4/screens/single_product_overview/widgets/add_to_cart_dialogue.dart';
import 'package:day_4/screens/single_product_overview/widgets/buy_dialogue.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/cartitem.dart';
import '../../../models/product.dart';

class ProductOverviewNavBar extends StatelessWidget {
  ProductOverviewNavBar({
    Key? key,
    required this.callback,
    required this.productData,
    required this.color,
  }) : super(key: key);

  final Function callback;
  final Product productData;
  String? color;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      height: kBottomNavigationBarHeight,
      destinations: [
        TextButton.icon(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          onPressed: () {},
          icon: const Icon(Icons.store),
          label: const Text('Store'),
        ),
        Consumer<Cart>(
          builder: (ctx, cart, _) => ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                enableDrag: false,
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                builder: (context) => FractionallySizedBox(
                  heightFactor: 0.8,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 4 / 6,
                    child: BuyDialogue(callback, productData, color!),
                  ),
                ),
              );
            },
            // },
            child: const Text('Buy Now'),
          ),
        ),
        Consumer<Cart>(
          builder: (ctx, cart, _) => TextButton.icon(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            onPressed: () {
              if (productData.colorImages == null) {
                cart.addItem(
                  productData.id,
                  productData.price,
                  productData.title,
                  productData.image,
                  productData.shippingFee,
                  color,
                  1,
                );
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.black,
                    behavior: SnackBarBehavior.floating,
                    key: UniqueKey(),
                    action: SnackBarAction(
                      label: 'Undo',
                      onPressed: () {
                        cart.removeSingleItem(productData.id);
                      },
                    ),
                    content: const Text('Added to cart'),
                  ),
                );
              } else {
                showModalBottomSheet(
                  context: context,
                  enableDrag: false,
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  builder: (context) => FractionallySizedBox(
                    heightFactor: 0.8,
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 4 / 6,
                      child: AddToCartDialogue(callback, productData, color!),
                    ),
                  ),
                );
              }
            },
            icon: const Icon(Icons.shopping_cart),
            label: const Text('Add to Cart'),
          ),
        ),
      ],
    );
  }
}
