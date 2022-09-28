import 'package:day_4/constants/colors.dart';
import 'package:day_4/providers/products_provider.dart';
import 'package:day_4/providers/themes.dart';
import 'package:flutter/material.dart';
import 'package:page_view_indicators/animated_circle_page_indicator.dart';
import 'package:provider/provider.dart';

import '../../../models/product.dart';
import '../../core/widgets/grid_product_tile.dart';
import '../../core/widgets/list_product_tile.dart';

class CategoryProductGrid extends StatefulWidget {
  CategoryProductGrid(
    this.product,
    this.productData, {
    Key? key,
  }) : super(key: key);
  late List<Product> product;
  final Products productData;

  @override
  State<CategoryProductGrid> createState() => _CategoryProductGridState();
}

class _CategoryProductGridState extends State<CategoryProductGrid>
    with TickerProviderStateMixin {
  var selectedValue = "Price(Low to High)";
  var recommended = true;

  late AnimationController _animatedController;
  var dropdown = false;
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
    if (selectedValue == "Price(Low to High)") {
      widget.product.sort(
        (a, b) => a.price.compareTo(b.price),
      );
    }
    if (selectedValue == "Price(High to Low)") {
      widget.product.sort(
        (a, b) => b.price.compareTo(a.price),
      );
    }

    return SizedBox(
      height:
          MediaQuery.of(context).size.height - kBottomNavigationBarHeight * 2,
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            backgroundColor: theme ? kDarkBackground : kLightBackground,
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
                      const Spacer(),
                      Consumer<Products>(
                        builder: (context, value, child) => IconButton(
                          onPressed: () {
                            dropdown = !dropdown;
                            dropdown
                                ? _animatedController.forward()
                                : _animatedController.reverse();
                            widget.productData.toggleGridView();
                          },
                          icon: AnimatedIcon(
                            icon: AnimatedIcons.list_view,
                            progress: _animatedController,
                          ),
                        ),
                      ),
                      Container(
                        height: 30,
                        width: 2,
                        color: Colors.grey,
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
              bottom: 70,
            ),
            sliver: widget.productData.gridview
                ? SliverGrid.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 3 / 4.3,
                    children: [
                      ...widget.product
                          .map(
                            (e) => ChangeNotifierProvider.value(
                              value: e,
                              child: GridProductTile(),
                            ),
                          )
                          .toList(),
                    ],
                  )
                : SliverGrid.count(
                    crossAxisCount: 1,
                    mainAxisSpacing: 5,
                    childAspectRatio: 4 / 1.5,
                    children: [
                      ...widget.product
                          .map(
                            (e) => ChangeNotifierProvider.value(
                              value: e,
                              child: ListProductTile(),
                            ),
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
