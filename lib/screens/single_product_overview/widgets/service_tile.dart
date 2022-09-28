import 'package:flutter/material.dart';

import '../../../models/product.dart';
import 'product_specifications.dart';

class ServiceTile extends StatelessWidget {
  const ServiceTile({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        onTap: () {
          showModalBottomSheet(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            context: context,
            builder: (ctx) => SizedBox(
              height: 500,
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                padding: const EdgeInsets.all(20.0),
                child: const Text(
                  'Money back guarantee if product was delivered is different what is described on the site. \nOpen a dispute if there are any other related issues.',
                  style: TextStyle(
                    letterSpacing: .4,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          );
        },
        title: const Text(
          'Service',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: const Icon(
          Icons.arrow_right,
        ),
      ),
    );
  }
}
