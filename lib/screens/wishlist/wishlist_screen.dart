import 'package:day_4/utils/naira.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/products_provider.dart';
import '../core/widgets/image_holder.dart';
import '../single_product_overview/product_overview.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({Key? key}) : super(key: key);
  static const routeName = '/WishList_Screen';

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  @override
  Widget build(BuildContext context) {
    final removeFav = Provider.of<Products>(context);
    final product = Provider.of<Products>(context, listen: false).favourite;
    return Scaffold(
      appBar: AppBar(
        title: Text('Wishlist'),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          itemCount: product.length,
          itemBuilder: (ctx, i) => GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .pushNamed(ProductOverview.routeName, arguments: {
                'id': product[i].id,
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 100,
                child: Card(
                  margin: const EdgeInsets.all(0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 100,
                        height: 100,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(5),
                          ),
                          child: Hero(
                            tag: product[i].id,
                            child: ImageHolder(
                              product[i].image,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 250,
                        height: 130,
                        margin: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product[i].title,
                              style: const TextStyle(fontSize: 13),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              getNairaFormat().nairaPrice(product[i].price),
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5.0),
                              child: Text(
                                product[i].shippingFee == 0
                                    ? '+ Free Shipping'
                                    : '+ Shipping ${getNairaFormat().nairaPrice(product[i].shippingFee)}',
                                style: const TextStyle(
                                  color: Colors.red,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
