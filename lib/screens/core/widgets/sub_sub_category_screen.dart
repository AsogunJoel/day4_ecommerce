import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/colors.dart';
import '../../../providers/product.dart';
import '../../../providers/themes.dart';
import 'grid_product_tile.dart';
import 'list_product_tile.dart';

class SubSubCategoryScreen extends StatefulWidget {
  const SubSubCategoryScreen({Key? key}) : super(key: key);
  static const routeName = '/SubSubCategory-Screen';

  @override
  State<SubSubCategoryScreen> createState() => _SubSubCategoryScreenState();
}

class _SubSubCategoryScreenState extends State<SubSubCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)!.settings.arguments as String;
    final title = routeArgs;
    final productData = Provider.of<Products>(context);
    final product = productData.PRODUCTS
        .where(
          (prod) => prod.subcategory.contains(title),
        )
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SubSubCategoryProductGrid(title, product, productData),
    );
  }
}

class SubSubCategoryProductGrid extends StatefulWidget {
  const SubSubCategoryProductGrid(
    this.title,
    this.product,
    this.productData, {
    Key? key,
  }) : super(key: key);
  final String title;
  final List<Product> product;
  final Products productData;

  @override
  State<SubSubCategoryProductGrid> createState() =>
      _SubSubCategoryProductGridState();
}

class _SubSubCategoryProductGridState extends State<SubSubCategoryProductGrid>
    with TickerProviderStateMixin {
  var selectedValue = "Price(Low to High)";
  var dropdown = false;
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
      child: Column(
        children: [
          Container(
            height: 50,
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
          Expanded(
            child: Container(
              child: widget.productData.gridview
                  ? GridView.builder(
                      padding: const EdgeInsets.all(8),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 3 / 4.3,
                      ),
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
