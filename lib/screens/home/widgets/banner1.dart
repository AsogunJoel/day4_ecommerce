import 'package:day_4/screens/core/widgets/image_holder.dart';
import 'package:flutter/material.dart';

class Banner1 extends StatelessWidget {
  const Banner1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ImageHolder(
      'https://thietkehaithanh.com/wp-content/uploads/2021/11/banner-giay-thietkehaithanh-800x304.jpg',
    );
  }
}
