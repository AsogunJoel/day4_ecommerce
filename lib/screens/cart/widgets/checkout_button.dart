import 'dart:async';

import 'package:day_4/screens/auth_screen/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:lottie/lottie.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

import '../../../providers/auth.dart';
import '../../../providers/cartitem.dart';
import '../../payment/payment_details_page.dart';
import '../../payment/payment_page.dart';

class CheckOutButton extends StatefulWidget {
  const CheckOutButton({
    Key? key,
    required this.cart,
  }) : super(key: key);

  final Cart cart;

  @override
  State<CheckOutButton> createState() => _CheckOutButtonState();
}

class _CheckOutButtonState extends State<CheckOutButton> {
  @override
  Widget build(BuildContext context) {
    final _auth = Provider.of<Auth>(context).isAuth;

    return TextButton(
      onPressed: widget.cart.product.isEmpty
          ? () {}
          : () {
              if (_auth) {
                showDialog(
                  context: context,
                  builder: (ctx) => SimpleDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    title: Lottie.asset(
                      'assets/lottie/23211-receive-order.json',
                      animate: true,
                      height: 300,
                    ),
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Place Order for items (${widget.cart.product.length})?',
                            style: const TextStyle(fontSize: 15),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(ctx).pop();
                            },
                            child: const Text('No'),
                          ),
                          ElevatedButton(
                            child: const Text('Yes'),
                            onPressed: () {
                              Navigator.of(ctx).pop();
                              pushNewScreen(
                                context,
                                screen: PaymentDetails(
                                  widget.cart.product.values.toList(),
                                ),
                                withNavBar: false,
                              );
                            },
                          )
                        ],
                      )
                    ],
                  ),
                );
              } else if (widget.cart.product.isEmpty) {
                return;
              } else {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.black,
                    behavior: SnackBarBehavior.floating,
                    action: SnackBarAction(
                      label: 'login',
                      onPressed: () {
                        pushNewScreen(
                          context,
                          screen: AuthScreen(),
                        );
                      },
                    ),
                    content: const Text('login to Check out'),
                  ),
                );
              }
            },
      child: Text(
        'CHECK OUT (${widget.cart.product.length})',
      ),
    );
  }
}
