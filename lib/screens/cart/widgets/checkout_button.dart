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
          ? () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  backgroundColor: Colors.black,
                  behavior: SnackBarBehavior.floating,
                  content: Text('Cart is empty'),
                ),
              );
            }
          : () {
              if (_auth) {
                // Navigator.of(context).pop();
                pushNewScreen(
                  context,
                  screen: PaymentDetails(
                    widget.cart.product.values.toList(),
                  ),
                  withNavBar: false,
                );
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
        'ORDER (${widget.cart.product.length})',
      ),
    );
  }
}
