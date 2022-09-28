import 'package:day_4/providers/products_provider.dart';
import 'package:day_4/providers/themes.dart';
import 'package:day_4/screens/category_screen/widgets/category_loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/category.dart';
import '../../models/product.dart';
import '../core/widgets/search_delegate.dart';
import 'category_pages.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);
  static const routeName = '/Category_screen';

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  int selectedIndex = 0;

  bool showCategory = true;

  @override
  Widget build(BuildContext context) {
    final category = Provider.of<Category>(
      context,
      listen: false,
    ).CATEGORIES;
    final products = Provider.of<Products>(
      context,
    ).PRODUCTS;
    if (products.isNotEmpty) {
      return Scaffold(
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
        body: Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9 / 3,
                  child: Card(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        topLeft: Radius.circular(10),
                      ),
                    ),
                    child: SizedBox(
                      child: Column(
                        children: [
                          Expanded(
                            child: ListView.separated(
                              separatorBuilder: (context, index) {
                                return const SizedBox(
                                  height: 3,
                                );
                              },
                              physics: const BouncingScrollPhysics(),
                              itemCount: category.length,
                              itemBuilder: (ctx, i) => ListTile(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = i;
                                  });
                                },
                                title: Text(
                                  category[i].title,
                                  maxLines: 2,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                style: ListTileStyle.list,
                                selected: selectedIndex == i,
                                selectedColor: Colors.white,
                                selectedTileColor: Colors.purple,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 2.1 / 3,
                  child: pages[selectedIndex],
                ),
              ],
            ),
          ],
        ),
      );
    } else {
      return const CategoryScreenShimmer();
    }
  }
}
