import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:day_4/screens/core/widgets/image_holder.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../../../models/carasel_data.dart';
import '../../cart/cart_screen.dart';
import '../../flash_sales/flash_sales.dart';

class CarouselWithIndicatorDemo extends StatefulWidget {
  const CarouselWithIndicatorDemo({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicatorDemo> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: caraselData
              .map(
                (item) => GestureDetector(
                  onTap: () {
                    clickImage(
                      context,
                      caraselData.indexOf(item).toString(),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                    child: ImageHolder2(item.image),
                  ),
                ),
              )
              .toList(),
          carouselController: _controller,
          options: CarouselOptions(
              viewportFraction: 1,
              enlargeStrategy: CenterPageEnlargeStrategy.scale,
              autoPlay: true,
              aspectRatio: 2.6,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: caraselData.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 5.0,
                height: 5.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black)
                      .withOpacity(
                    _current == entry.key ? 0.9 : 0.3,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

clickImage(BuildContext context, String index) {
  switch (index) {
    case '0':
      pushNewScreenWithRouteSettings(
        context,
        screen: const FlashSales(),
        settings: const RouteSettings(
          name: FlashSales.routeName,
        ),
        withNavBar: true,
      );

      break;
    case '1':
      pushNewScreenWithRouteSettings(
        context,
        screen: const CartScreen(),
        settings: const RouteSettings(
          name: CartScreen.routeName,
        ),
        withNavBar: false,
      );
      break;
    default:
  }
}
