import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/product.dart';
import 'overview_single_product.dart';

class SimilarProducts extends StatelessWidget {
  const SimilarProducts({
    required this.shortName,
    required this.prodId,
    Key? key,
  }) : super(key: key);
  final String title = 'Similar Products';
  final String shortName;
  final String prodId;
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context, listen: false);
    final similarProd = productData.PRODUCTS.where((product) {
      return product.shortName == shortName;
    }).toList();
    similarProd.removeWhere((element) {
      return element.id == prodId;
    });
    if (similarProd.isNotEmpty) {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 1 / 4,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: similarProd.length,
              itemBuilder: (context, i) => Container(
                height: 150,
                width: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: ChangeNotifierProvider.value(
                  value: similarProd[i],
                  child: const OverviewSingleProductWidget(),
                ),
              ),
              scrollDirection: Axis.horizontal,
            ),
          ),
        ],
      );
    } else {
      return Container();
    }
  }
}
