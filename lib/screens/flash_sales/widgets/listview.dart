import 'package:day_4/screens/core/widgets/grid_screen.dart';
import 'package:day_4/screens/flash_sales/flash_sales.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/product.dart';
import '../../home/widgets/overview_single_product.dart';

class FlashListWidget extends StatelessWidget {
  const FlashListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context, listen: false);

    final flashSale = productData.PRODUCTS.where((product) {
      return product.isFlashSale == true;
    }).toList();
    final flashSaleFreeDelivery = flashSale.where((product) {
      return product.isFreeDelivery == true;
    }).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Text(
                'Free Delivery ',
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
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => GridScreen(
                        flashSaleFreeDelivery, 'Flash Sales Free Delivery'),
                  ),
                );
              },
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 1 / 4,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            physics: const BouncingScrollPhysics(),
            itemCount: flashSale.length,
            shrinkWrap: true,
            itemBuilder: (context, i) => Container(
              //height: 100,
              width: 170,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              child: ChangeNotifierProvider.value(
                value: flashSale[i],
                child: const HomeOverviewSingleProductWidget(),
              ),
            ),
            scrollDirection: Axis.horizontal,
          ),
        ),
      ],
    );
  }
}
