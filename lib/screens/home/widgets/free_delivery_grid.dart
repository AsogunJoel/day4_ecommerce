import 'package:day_4/providers/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

import '../../../models/product.dart';
import '../../core/widgets/grid_screen.dart';
import '../../core/widgets/image_holder.dart';
import '../../single_product_overview/product_overview.dart';

class TopFreeDeliveryGrid extends StatelessWidget {
  const TopFreeDeliveryGrid({
    required this.productData,
    Key? key,
  }) : super(key: key);
  final Products productData;
  @override
  Widget build(BuildContext context) {
    const String title = 'Top Free Delivery Deals';
    final freeShippingProd = productData.PRODUCTS.where((product) {
      return product.isFreeDelivery == true;
    }).toList();
    freeShippingProd.shuffle();
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                ],
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
                  screen: GridScreen(
                    freeShippingProd,
                    title,
                  ),
                );
              },
            ),
          ],
        ),
        SizedBox(
          child: Card(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: 4,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 2,
                ),
                itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
                  value: freeShippingProd[i],
                  child: GridSingleProductWidget(),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class GridSingleProductWidget extends StatelessWidget {
  const GridSingleProductWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Product>(context);
    return GestureDetector(
      onTap: () {
        pushNewScreenWithRouteSettings(
          context,
          screen: const ProductOverview(),
          settings: RouteSettings(
              name: ProductOverview.routeName, arguments: {'id': products.id}),
          withNavBar: false,
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Container(
            color: Colors.white,
            child: ImageHolder(products.image),
          ),
        ),
      ),
    );
  }
}
