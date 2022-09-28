import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/category.dart';

class CategorySlide extends StatelessWidget {
  const CategorySlide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final category = Provider.of<Category>(context).CATEGORIES;
    return SizedBox(
      height: 100,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        itemCount: category.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: ((context, index) {
          return Container(
            height: 90,
            width: 75,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
            ),
            child: Column(
              children: [
                CircleAvatar(
                  maxRadius: 30,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: CachedNetworkImage(
                      imageUrl: category[index].image,
                      errorWidget: (context, url, error) => Center(
                        child: SizedBox(
                          height: 30,
                          width: 30,
                          child: Image.asset('assets/images/errorImage.png'),
                        ),
                      ),
                    ),
                  ),
                  backgroundColor: Colors.white,
                ),
                Text(
                  category[index].title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 10),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
