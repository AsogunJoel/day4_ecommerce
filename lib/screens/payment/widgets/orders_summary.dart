import 'package:day_4/providers/cartitem.dart';
import 'package:day_4/providers/orders_provider.dart';
import 'package:day_4/screens/payment/widgets/delivery_details_page.dart';
import 'package:day_4/utils/naira.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class DeliverydetailsPageDialogue extends StatelessWidget {
  const DeliverydetailsPageDialogue({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final DeliveryDetailsPage widget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Order Summary',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: ListView(
                shrinkWrap: true,
                children: [
                  Row(
                    children: [
                      Text(
                        'Number of items: ${widget.cartItem.length.toString()}',
                        style: const TextStyle(
                          fontSize: 18,
                          letterSpacing: .5,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    thickness: 2,
                    color: Colors.black87,
                  ),
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => Row(
                      children: [
                        Expanded(
                          child: Text(
                            'x ${widget.cartItem[index].quantity}',
                            style: const TextStyle(
                              fontSize: 15,
                              letterSpacing: .5,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Text(
                            widget.cartItem[index].title,
                            style: const TextStyle(
                              fontSize: 15,
                              letterSpacing: .5,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            getNairaFormat()
                                .nairaPrice(widget.cartItem[index].price),
                            style: const TextStyle(
                              fontSize: 15,
                              letterSpacing: .5,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    ),
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: widget.cartItem.length,
                  ),
                  const Divider(
                    height: 5,
                  ),
                  Consumer<Cart>(
                    builder: (context, cart, child) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Total',
                            style: TextStyle(
                              fontSize: 18,
                              letterSpacing: .5,
                            ),
                          ),
                          Text(
                            widget.cartItem.isEmpty
                                ? getNairaFormat().nairaPrice(cart.totalAmount)
                                : getNairaFormat()
                                    .nairaPrice(widget.cartItem[0].price),
                            style: const TextStyle(
                              fontSize: 18,
                              letterSpacing: .5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  final _orders = Provider.of<Order>(context, listen: false);
                  final cart = Provider.of<Cart>(context, listen: false);
                  _orders.addOrder(
                    widget.cartItem,
                    cart.totalAmount,
                  );
                  cart.removeAllItem();
                  Navigator.of(context).pop();
                  showDialog(
                    context: context,
                    builder: (ctx) {
                      return SimpleDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        title: Lottie.asset(
                          'assets/lottie/103068-check-animation.json',
                          animate: true,
                          repeat: false,
                          height: 300,
                        ),
                        children: [
                          Center(
                            child: Title(
                              color: Colors.red,
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text('Payment unsuccessful'),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(ctx).pop();
                                  Navigator.of(ctx).pop();
                                },
                                child: const Text('Okay'),
                              ),
                            ],
                          )
                        ],
                      );
                    },
                  );
                },
                child: const Text('Check out'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
