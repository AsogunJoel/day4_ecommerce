import 'package:day_4/providers/products_provider.dart';

import '../cart/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/product.dart';
import '../core/widgets/cart_Widgets.dart';
import '../core/widgets/search_delegate.dart';
import 'widgets/product_grid.dart';

class ElectronicsProductScreen extends StatefulWidget {
  const ElectronicsProductScreen({Key? key}) : super(key: key);
  static const routeName = '/Electronic_Product_page';

  @override
  State<ElectronicsProductScreen> createState() =>
      _ElectronicsProductScreenState();
}

class _ElectronicsProductScreenState extends State<ElectronicsProductScreen> {
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final title = routeArgs['title'] as String;
    final productData = Provider.of<Products>(context);
    final products = productData.electronics;

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: MySearchDelegate(),
              );
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: CategoryProductGrid(
          products,
          productData,
        ),
      ),
    );
  }
}
