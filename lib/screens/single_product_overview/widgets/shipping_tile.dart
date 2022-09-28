import 'package:day_4/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../../providers/product.dart';
import 'product_specifications.dart';

class ShippingTile extends StatelessWidget {
  const ShippingTile({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      onTap: () {},
      title: const Text(
        'Shipping',
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          product.shippingFee <= 0
              ? const Text(
                  'Free Shipping',
                  style: TextStyle(
                    fontSize: 13,
                    color: kRedColor,
                  ),
                )
              : Row(
                  children: [
                    const Text(
                      'Delivery fee for this item is ',
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                    Text(
                      product.nairaPrice(product.shippingFee),
                      style: const TextStyle(
                        fontSize: 13,
                        color: kRedColor,
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
