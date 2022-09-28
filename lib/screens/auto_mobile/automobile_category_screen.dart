import 'package:day_4/screens/auto_mobile/auto_all_Product_screen.dart';
import 'package:day_4/screens/core/widgets/sub_sub_category_screen.dart';
import 'package:day_4/screens/core/widgets/image_holder.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

import '../../../models/sub_categories.dart';
import '../../providers/category.dart';

class AutomobileCategoryList extends StatelessWidget {
  const AutomobileCategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final category =
        Provider.of<Category>(context, listen: false).CATEGORIES[4];
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              pushNewScreenWithRouteSettings(
                context,
                screen: const AutoProductScreen(),
                settings: RouteSettings(
                    name: AutoProductScreen.routeName,
                    arguments: {'title': category.title}),
              );
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      'All Products',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          ListView.builder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) => ChangeNotifierProvider.value(
              value: category.subcategory[index],
              child: const AutoSubListTile(),
            ),
            itemCount: category.subcategory.length,
          ),
        ],
      ),
    );
  }
}

class AutoSubListTile extends StatelessWidget {
  const AutoSubListTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final subcategory = Provider.of<SubCategory>(context);
    return GestureDetector(
      onTap: () => subcategory.toogleDropDown(),
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    subcategory.title,
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  Consumer<SubCategory>(
                    builder: (_, value, ch) => Icon(
                      value.dropdown
                          ? Icons.arrow_drop_up
                          : Icons.arrow_drop_down,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: !subcategory.dropdown ? 0 : null,
              child: Card(
                elevation: 0,
                margin: const EdgeInsets.only(bottom: 8),
                child: GridView(
                  padding: const EdgeInsets.all(
                    8,
                  ),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    childAspectRatio: 2 / 3,
                    maxCrossAxisExtent: 80,
                    mainAxisExtent: 100,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 2,
                  ),
                  children: [
                    ...subcategory.subsubcat!
                        .map(
                          (e) => GestureDetector(
                            onTap: () {
                              pushNewScreenWithRouteSettings(
                                context,
                                screen: const SubSubCategoryScreen(),
                                settings: RouteSettings(
                                  name: SubSubCategoryScreen.routeName,
                                  arguments: e.title,
                                ),
                              );
                            },
                            child: Column(
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: SizedBox(
                                            height: 70,
                                            width: 70,
                                            child: ImageHolder2(e.image)),
                                      ),
                                    ),
                                    Text(
                                      e.title,
                                      maxLines: 2,
                                      softWrap: true,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                        .toList(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
