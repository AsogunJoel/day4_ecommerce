import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

import '../../../models/product.dart';
import '../../../providers/products_provider.dart';
import '../../core/widgets/grid_screen.dart';
import '../../core/widgets/image_holder.dart';
import '../../single_product_overview/product_overview.dart';

class DiscountElect extends StatelessWidget {
  const DiscountElect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String title = 'Discount Electronics';
    final productData =
        Provider.of<Products>(context, listen: false).electronics;

    final discountElect = productData.where((product) {
      return product.oldPrice != null;
    }).toList();
    discountElect.shuffle();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Text(
                title,
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
                  screen: GridScreen(
                    discountElect,
                    title,
                  ),
                );
              },
            ),
          ],
        ),
        Card(
          margin: const EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: 4,
              itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
                value: discountElect[i],
                child: ElectDiscountGridSingleProductWidget(),
              ),
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 2,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ElectDiscountGridSingleProductWidget extends StatelessWidget {
  const ElectDiscountGridSingleProductWidget({
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
            name: ProductOverview.routeName,
            arguments: {
              'id': products.id,
            },
          ),
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
