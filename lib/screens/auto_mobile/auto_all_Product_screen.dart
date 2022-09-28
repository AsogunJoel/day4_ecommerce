import 'package:day_4/providers/products_provider.dart';
import 'package:day_4/screens/Electronics_category_screens/widgets/product_grid.dart';

import '../cart/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/product.dart';
import '../core/widgets/cart_Widgets.dart';
import '../core/widgets/search_delegate.dart';

class AutoProductScreen extends StatefulWidget {
  const AutoProductScreen({Key? key}) : super(key: key);
  static const routeName = '/Auto_Product_page';

  @override
  State<AutoProductScreen> createState() => _AutoProductScreenState();
}

class _AutoProductScreenState extends State<AutoProductScreen> {
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final title = routeArgs['title'] as String;
    final productData = Provider.of<Products>(context);
    final products = productData.automobile;

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
