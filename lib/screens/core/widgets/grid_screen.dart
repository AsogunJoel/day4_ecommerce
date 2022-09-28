import 'package:day_4/constants/colors.dart';
import 'package:day_4/providers/products_provider.dart';
import 'package:day_4/providers/themes.dart';
import 'package:day_4/screens/core/widgets/grid_product_tile.dart';
import 'package:day_4/screens/core/widgets/list_product_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/product.dart';

class GridScreen extends StatefulWidget {
  const GridScreen(
    this.product,
    this.title, {
    Key? key,
  }) : super(key: key);
  static const routeName = '/Grid_Screen';
  final List<Product> product;
  final String title;

  @override
  State<GridScreen> createState() => _GridScreenState();
}

class _GridScreenState extends State<GridScreen> with TickerProviderStateMixin {
  late AnimationController _animatedController;
  bool dropdown = false;
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

  var selectedValue = "Price(Low to High)";
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
    final productData = Provider.of<Products>(context);
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
    return Scaffold(
      appBar: widget.title == 'null'
          ? null
          : AppBar(
              title: Text(widget.title),
            ),
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
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
                          color: Provider.of<ThemeProvider>(
                            context,
                            listen: false,
                          ).isDarkMode
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
          Expanded(
            child: Container(
              child: productData.gridview
                  ? GridView.builder(
                      padding: const EdgeInsets.all(8),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 3 / 4.3,
                      ),
                      primary: false,
                      shrinkWrap: true,
                      itemCount: widget.product.length,
                      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
                        value: widget.product[i],
                        child: GridProductTile(),
                      ),
                    )
                  : ListView.builder(
                      itemCount: widget.product.length,
                      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
                        value: widget.product[i],
                        child: ListProductTile(),
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
