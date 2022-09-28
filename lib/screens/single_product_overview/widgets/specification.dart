import 'package:day_4/constants/colors.dart';
import 'package:day_4/screens/single_product_overview/widgets/product_specifications.dart';
import 'package:flutter/material.dart';

import '../../../providers/product.dart';

class Specification extends StatelessWidget {
  const Specification({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              fullscreenDialog: true,
              settings: RouteSettings(
                arguments: product,
              ),
              builder: (ctx) => const Specifications(),
            ),
          );
        },
        title: const Text(
          'Description',
          softWrap: true,
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
