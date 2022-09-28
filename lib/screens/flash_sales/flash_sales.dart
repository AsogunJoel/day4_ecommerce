import 'package:day_4/providers/products_provider.dart';
import 'package:day_4/screens/core/widgets/image_holder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../providers/themes.dart';
import 'widgets/gridtile.dart';
import 'widgets/listgrid.dart';
import 'widgets/listview.dart';

class FlashSales extends StatefulWidget {
  const FlashSales({Key? key}) : super(key: key);
  static const routeName = '/FlashSales';

  @override
  State<FlashSales> createState() => _FlashSalesState();
}

class _FlashSalesState extends State<FlashSales>
    with SingleTickerProviderStateMixin {
  var selectedValue = "Price(Low to High)";

  late AnimationController _animatedController;

  @override
  void initState() {
    super.initState();
    _animatedController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _animatedController.dispose();
    super.dispose();
  }

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(
        child: Text("Price(Low to High)"),
        value: "Price(Low to High)",
      ),
      const DropdownMenuItem(
        child: Text("Price(High to Low)"),
        value: "Price(High to Low)",
      ),
    ];
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context, listen: false).isDarkMode;

    final productData = Provider.of<Products>(
      context,
    );
    final product = productData.PRODUCTS.where((product) {
      return product.isFlashSale == true;
    }).toList();

    if (selectedValue == "Price(Low to High)") {
      product.sort(
        (a, b) => a.price.compareTo(b.price),
      );
    }
    if (selectedValue == "Price(High to Low)") {
      product.sort(
        (a, b) => b.price.compareTo(a.price),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flash sales'),
      ),
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            automaticallyImplyLeading: false,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              background: SizedBox(
                height: 20,
                child: ImageHolder(
                  'https://media.istockphoto.com/vectors/flash-sale-promotional-labels-templates-set-special-offer-text-design-vector-id1195558677?k=20&m=1195558677&s=612x612&w=0&h=XNBzsYvsBrBDwdnLrJTuXytu0OkiNFF8gbuaTlMpyHM=',
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: FlashListWidget(),
          ),
          SliverAppBar(
            elevation: 0,
            floating: true,
            backgroundColor: Provider.of<ThemeProvider>(context).isDarkMode
                ? kDarkBackground
                : kLightBackground,
            automaticallyImplyLeading: false,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              background: SizedBox(
                height: 20,
                child: Container(
                  decoration: const BoxDecoration(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                ),
                                width: 160,
                                child: DropdownButton(
                                  value: selectedValue,
                                  isExpanded: true,
                                  items: dropdownItems,
                                  style: TextStyle(
                                    color: theme
                                        ? kDarkPrimaryColor
                                        : Colors.black,
                                    fontSize: 13,
                                  ),
                                  underline: const SizedBox(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedValue = newValue!;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Consumer<Products>(
                        builder: (context, value, child) => AnimatedSwitcher(
                          duration: const Duration(milliseconds: 700),
                          reverseDuration: const Duration(milliseconds: 700),
                          switchInCurve: Curves.elasticInOut,
                          switchOutCurve: Curves.easeIn,
                          transitionBuilder: (child, animation) {
                            return ScaleTransition(
                              scale: animation,
                              child: child,
                            );
                          },
                          child: value.gridview
                              ? IconButton(
                                  key: const ValueKey('1'),
                                  onPressed: () {
                                    value.toggleGridView();
                                  },
                                  icon: const Icon(
                                    Icons.grid_view_sharp,
                                  ),
                                )
                              : IconButton(
                                  key: const ValueKey('2'),
                                  onPressed: () {
                                    value.toggleGridView();
                                  },
                                  icon: const Icon(
                                    Icons.list,
                                  ),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(
              top: 8,
              left: 8,
              right: 8,
              bottom: 20,
            ),
            sliver: productData.gridview
                ? SliverGrid.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 3 / 4.3,
                    children: [
                      ...product
                          .map(
                            (e) => GridProdTile(e),
                          )
                          .toList(),
                    ],
                  )
                : SliverGrid.count(
                    crossAxisCount: 1,
                    mainAxisSpacing: 5,
                    childAspectRatio: 4 / 1.5,
                    children: [
                      ...product
                          .map(
                            (e) => SliverListProductTile(e),
                          )
                          .toList(),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
