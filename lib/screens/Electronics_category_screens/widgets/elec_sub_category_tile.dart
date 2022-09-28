import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/sub_categories.dart';
import 'elec_sub_category_listtile.dart';

class SubCategoryList extends StatelessWidget {
  const SubCategoryList(this.subcategory, {Key? key}) : super(key: key);
  final List<SubCategory> subcategory;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: ((context, index) => ChangeNotifierProvider.value(
                value: subcategory[index],
                child: const SubListTile(),
              )),
          itemCount: subcategory.length,
        ),
      ],
    );
  }
}
