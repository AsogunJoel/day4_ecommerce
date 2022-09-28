import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageHolder extends StatelessWidget {
  const ImageHolder(this.image, {Key? key}) : super(key: key);
  final String image;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      useOldImageOnUrlChange: true,
      imageUrl: image,
      errorWidget: (context, url, error) => Center(
        child: SizedBox(
          height: 30,
          width: 30,
          child: Image.asset('assets/images/errorImage.png'),
        ),
      ),
    );
  }
}

class ImageHolder2 extends StatelessWidget {
  const ImageHolder2(this.image, {Key? key}) : super(key: key);
  final String image;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      useOldImageOnUrlChange: true,
      imageUrl: image,
      errorWidget: (context, url, error) => Center(
        child: SizedBox(
          height: 30,
          width: 30,
          child: Image.asset('assets/images/errorImage.png'),
        ),
      ),
    );
  }
}
