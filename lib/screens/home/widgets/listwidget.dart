import 'package:day_4/providers/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

import '../../../models/product.dart';
import '../../flash_sales/flash_sales.dart';
import 'overview_single_product.dart';

class ListWidget extends StatelessWidget {
  const ListWidget({
    required this.productData,
    Key? key,
  }) : super(key: key);
  final Products productData;
  @override
  Widget build(BuildContext context) {
    final flashSale = productData.PRODUCTS.where((product) {
      return product.isFlashSale == true && product.oldPrice != null;
    }).toList();
    flashSale.shuffle();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Text(
                'Flash Sales | Free Delivery ',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextButton(
              child: const Text(
                'Show more',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              onPressed: () {
                pushNewScreen(
                  context,
                  screen: const FlashSales(),
                );
              },
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 1 / 4,
          child: ListView.builder(
            itemCount: flashSale.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(
              horizontal: 6,
            ),
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, i) => Container(
              width: 170,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              child: ChangeNotifierProvider.value(
                value: flashSale[i],
                child: const HomeOverviewSingleProductWidget(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
