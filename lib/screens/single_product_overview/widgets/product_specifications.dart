import 'package:flutter/material.dart';

import '../../../providers/product.dart';

class Specifications extends StatelessWidget {
  const Specifications({Key? key}) : super(key: key);
  static const routeName = '/Specifications';

  @override
  Widget build(BuildContext context) {
    final routeArg = ModalRoute.of(context)!.settings.arguments as Product;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Detail'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              children: [
                DescriptionDetails(routeArg.description, 'Description'),
                DescriptionDetails(routeArg.specification!, 'Specification'),
                DescriptionDetails(routeArg.keyFeatures!, 'Key Features')
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DescriptionDetails extends StatelessWidget {
  const DescriptionDetails(
    this.e,
    this.title, {
    Key? key,
  }) : super(key: key);
  final String e;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Card(
        elevation: 0,
        margin: const EdgeInsets.all(0),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                e,
                softWrap: true,
                style: const TextStyle(
                  wordSpacing: 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
