import 'package:flutter/cupertino.dart';

class Advert {
  String image;

  Advert({
    required this.image,
  });
}

List<Advert> VERTICAL_BANNER = [
  Advert(image: 'assets/images/woman.jpg'),
  Advert(image: 'assets/images/woman.jpg'),
];

List<Advert> HORIZONTAL_BANNER = [
  Advert(image: 'assets/images/woman.jpg'),
  Advert(image: 'assets/images/woman.jpg'),
];
