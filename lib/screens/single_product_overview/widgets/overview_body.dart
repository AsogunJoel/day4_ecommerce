import 'package:flutter/material.dart';
import 'package:page_view_indicators/animated_circle_page_indicator.dart';
import 'package:provider/provider.dart';

import '../../../constants/colors.dart';
import '../../../providers/product.dart';
import '../../../providers/themes.dart';
import '../../core/widgets/image_holder.dart';
import 'price_title_favourite.dart';
import 'reviews.dart';
import 'service_tile.dart';
import 'shipping_tile.dart';
import 'similar_products.dart';
import 'specification.dart';
import 'variations.dart';

class Body extends StatefulWidget {
  Body({
    required this.color,
    required this.callback,
    Key? key,
  }) : super(key: key);
  String? color;
  final Function callback;
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _pageController = PageController();
  final _currentPageNotifier = ValueNotifier<int>(0);
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final theme = Provider.of<ThemeProvider>(context).isDarkMode;
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: theme ? kDarkBackground : Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
          expandedHeight: MediaQuery.of(context).size.height * 1.1 / 3,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            background: Container(
              color: Colors.white,
              height: 20,
              child: product.otherImages == null
                  ? ImageHolder(
                      product.image,
                    )
                  : Stack(
                      children: [
                        PageView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: product.otherImages!.length,
                          controller: _pageController,
                          onPageChanged: (int i) {
                            _currentPageNotifier.value = i;
                          },
                          itemBuilder: (ctx, i) {
                            return SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.center,
                                    child: ImageHolder(
                                      product.otherImages![i],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              padding: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: AnimatedCirclePageIndicator(
                                itemCount: product.otherImages!.length,
                                fillColor: Colors.purpleAccent.shade100,
                                activeColor: Colors.purple,
                                borderColor: Colors.purpleAccent,
                                radius: 5,
                                currentPageNotifier: _currentPageNotifier,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              SizedBox(
                child: Container(
                  decoration: BoxDecoration(
                    color: theme ? kDarkBackground : Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      PriceTitleFav(product: product),
                      product.colorImages == null
                          ? Container()
                          : ProductColors(
                              callback: widget.callback,
                              product: product,
                              color: widget.color,
                            ),
                      Specification(product: product),
                      const Divider(
                        indent: 10,
                        endIndent: 10,
                      ),
                      ShippingTile(product: product),
                      const Divider(
                        indent: 10,
                        endIndent: 10,
                      ),
                      ServiceTile(product: product),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ReviewTile(product: product),
              const SizedBox(
                height: 10,
              ),
              SimilarProducts(
                shortName: product.shortName,
                prodId: product.id,
              )
            ],
          ),
        )
      ],
    );
  }
}
