import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/product.dart';
import '../core/widgets/image_holder.dart';

class ManageProduct extends StatelessWidget {
  const ManageProduct({Key? key}) : super(key: key);
  static const routeName = '/Mange_product';

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Products>(context).PRODUCTS;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Products'),
      ),
      body: ListView.builder(
        itemCount: product.length,
        itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
          value: product[i],
          child: const ManageItem(),
        ),
      ),
    );
  }
}

class ManageItem extends StatelessWidget {
  const ManageItem({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    return ListTile(
      leading: SizedBox(
        height: 50,
        width: 50,
        child: FittedBox(
          child: ImageHolder2(
            product.image,
          ),
        ),
      ),
      title: Text(
        product.title,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.edit,
                color: Theme.of(context).primaryColor,
              ),
            ),
            IconButton(
              onPressed: () {
                Provider.of<Products>(context, listen: false).removeItem(
                  product.id,
                );
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
