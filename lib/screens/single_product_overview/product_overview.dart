import 'package:day_4/providers/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/product.dart';
import '../../providers/reviews.dart';
import '../core/widgets/cart_Widgets.dart';
import '../wishlist/wishlist_screen.dart';
import 'widgets/nav_bar.dart';
import 'widgets/overview_body.dart';
import 'widgets/search_bar.dart';

enum ShowMore {
  Wishlist,
  Share,
}

class ProductOverview extends StatefulWidget {
  const ProductOverview({Key? key}) : super(key: key);
  static const routeName = '/ProductOverview';

  @override
  State<ProductOverview> createState() => _ProductOverviewState();
}

class _ProductOverviewState extends State<ProductOverview> {
  String? color = '';
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    final id = routeArgs['id'];
    final productData = Provider.of<Products>(context, listen: false)
        .PRODUCTS
        .firstWhere((element) => element.id == id);

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Colors.black,
        title: const ProdDetailAppBar(),
        actions: [
          const AppBarCart(),
          PopupMenuButton(
            onSelected: (ShowMore value) {
              if (value == ShowMore.Wishlist) {
                Navigator.of(context).pushNamed(Wishlist.routeName);
              } else {}
            },
            icon: const Icon(
              Icons.more_vert_sharp,
            ),
            itemBuilder: (ctx) => const [
              PopupMenuItem(
                child: Text('Wishlist'),
                value: ShowMore.Wishlist,
              ),
              PopupMenuItem(
                child: Text('Share'),
                value: ShowMore.Share,
              )
            ],
          ),
        ],
      ),
      body: ChangeNotifierProvider.value(
        value: productData,
        child: Body(
          callback: (colorr) {
            setState(() {
              color = colorr;
            });
          },
          color: color,
        ),
      ),
      bottomNavigationBar: ProductOverviewNavBar(
        callback: (colorr) {
          setState(() {
            color = colorr;
          });
        },
        productData: productData,
        color: color,
      ),
    );
  }
}
