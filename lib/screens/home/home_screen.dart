import 'dart:async';

import 'package:day_4/screens/home/widgets/home_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../network_module/api_response.dart';
import '../../providers/product.dart';
import '../../providers/reviews.dart';
import '../../providers/themes.dart';
import '../connection_screen.dart';
import '../core/widgets/search_delegate.dart';
import 'widgets/automobile.dart';
import 'widgets/banner1.dart';
import 'widgets/carasel.dart';
import 'widgets/discount_elect.dart';
import 'widgets/end_of_screen.dart';
import 'widgets/free_delivery_grid.dart';
import 'widgets/listwidget.dart';
import 'widgets/trending_grid.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<Review>(
      context,
      listen: false,
    ).initializer();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Products>(
      builder: (context, value, _) {
        if (value.product.status == Status.COMPLETED) {
          return RefreshIndicator(
            onRefresh: () => value.fetchAndSetProduct(),
            child: Scaffold(
              appBar: AppBar(
                iconTheme: const IconThemeData(
                  color: Colors.black,
                ),
                elevation: 0,
                backgroundColor: Colors.transparent,
                title: GestureDetector(
                  onTap: () {
                    showSearch(
                      context: context,
                      delegate: MySearchDelegate(),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    width: double.infinity,
                    height: 36,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(211, 211, 211, 1),
                      borderRadius: BorderRadius.all(
                        Radius.circular(22),
                      ),
                    ),
                    child: Center(
                      child: Row(
                        children: const [
                          Icon(
                            Icons.search,
                            color: Colors.black45,
                          ),
                          Text(
                            'Search Products',
                            style: TextStyle(
                              color: Colors.black45,
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Consumer<ThemeProvider>(
                      builder: (_, value, ch) => Icon(
                        Icons.camera_enhance_rounded,
                        color: value.isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              body: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    const CarouselWithIndicatorDemo(),
                    ListWidget(productData: value),
                    const SizedBox(height: 5),
                    Trending(productData: value),
                    const SizedBox(height: 5),
                    const DiscountElect(),
                    const Banner1(),
                    const AutoMobileGrid(),
                    TopFreeDeliveryGrid(productData: value),
                    const SizedBox(height: 5),
                    const BottomTag(),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          );
        } else if (value.product.status == Status.LOADING) {
          return const HomeShimmer();
        } else {
          return NetworkPage(
            value.product.message,
            () {
              value.fetchAndSetProduct();
            },
          );
        }
      },
    );
  }
}
