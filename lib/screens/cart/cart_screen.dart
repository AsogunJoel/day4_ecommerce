import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../providers/cartitem.dart';
import 'widgets/cart_item.dart';
import 'widgets/checkout_button.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);
  static const routeName = '/cart_screen';

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text(
              'Cart',
            ),
            if (cart.itemCount > 0)
              Text(
                '(${cart.itemCount})',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
          ],
        ),
        actions: [
          if (cart.product.isNotEmpty)
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (ctx) {
                    return AlertDialog(
                      title: const Text(
                        'Remove all cart items',
                      ),
                      content: const Text(
                        'Are you sure you want to remove all items from cart ?',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(ctx).pop(false);
                          },
                          child: const Text('No'),
                        ),
                        TextButton(
                          onPressed: () {
                            cart.removeAllItem();
                            Navigator.of(ctx).pop(true);
                          },
                          child: const Text('Yes'),
                        )
                      ],
                    );
                  },
                );
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: cart.product.isNotEmpty
                ? ListView.separated(
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 5,
                    ),
                    itemCount: cart.product.length,
                    itemBuilder: (ctx, i) => SingleCartItem(
                      cart,
                      cart.product.values.toList()[i].id,
                      cart.product.keys.toList()[i],
                      cart.product.values.toList()[i].price,
                      cart.product.values.toList()[i].quantity,
                      cart.product.values.toList()[i].title,
                      cart.product.values.toList()[i].image,
                      cart.product.values.toList()[i].shipping,
                      cart.product.values.toList()[i].variation,
                    ),
                  )
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8.0,
                          ),
                          child: Lottie.asset(
                            'assets/lottie/lf20_3zaipmwo.json',
                            animate: true,
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
          Card(
            margin: const EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
              ),
              child: Row(
                children: [
                  const Text(
                    'Total : ',
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                  const Spacer(),
                  const SizedBox(
                    width: 20,
                  ),
                  Chip(
                    label: Text(
                      '${cart.nairaPrice(cart.totalAmount)}',
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  CheckOutButton(cart: cart),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
