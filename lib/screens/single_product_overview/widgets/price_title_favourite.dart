import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:provider/provider.dart';

import '../../../providers/auth.dart';
import '../../../providers/product.dart';
import '../../../providers/reviews.dart';

class PriceTitleFav extends StatefulWidget {
  const PriceTitleFav({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  State<PriceTitleFav> createState() => _PriceTitleFavState();
}

class _PriceTitleFavState extends State<PriceTitleFav> {
  @override
  Widget build(BuildContext context) {
    final reviews =
        Provider.of<Review>(context).singleReviewList(widget.product.id);
    final rating = reviews.isNotEmpty
        ? reviews.map((m) => m.rating).reduce((a, b) => a + b) / reviews.length
        : 0.0;
    return Padding(
      padding: const EdgeInsets.only(
        left: 10.0,
        right: 10.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.product.nairaPrice(widget.product.price),
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              if (widget.product.oldPrice != null)
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: widget.product.oldPrice == 0
                      ? const Text(
                          '',
                        )
                      : Text(
                          widget.product.nairaPrice(widget.product.oldPrice),
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                ),
              const Spacer(),
              Consumer<Product>(builder: (context, product, _) {
                return FavouriteButton(product: product);
              }),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            widget.product.title,
            style: const TextStyle(
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              RatingBarIndicator(
                rating: rating,
                itemBuilder: (ctx, index) => const Icon(
                  Icons.star_rounded,
                  color: Colors.orange,
                ),
                itemSize: 17,
                itemCount: 5,
              ),
              const SizedBox(
                width: 2,
              ),
              Row(
                children: [
                  if (reviews.isNotEmpty)
                    Text(
                      rating.toStringAsFixed(1),
                      style: const TextStyle(
                        fontSize: 13,
                      ),
                    ),
                  Text(
                    ' (${reviews.length})',
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

class FavouriteButton extends StatelessWidget {
  const FavouriteButton({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<Auth>(context, listen: false).userId;
    final token = Provider.of<Auth>(context, listen: false).token;
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 700),
      reverseDuration: const Duration(milliseconds: 700),
      switchInCurve: Curves.elasticInOut,
      switchOutCurve: Curves.ease,
      transitionBuilder: (child, animation) {
        return ScaleTransition(
          scale: animation,
          child: child,
        );
      },
      child: product.isFavourite
          ? IconButton(
              key: const ValueKey('1'),
              onPressed: () {
                product.toggleFavourite(token, auth);
              },
              icon: const Icon(
                Icons.favorite,
                color: Colors.red,
              ),
            )
          : IconButton(
              key: const ValueKey('2'),
              onPressed: () {
                product.toggleFavourite(token, auth);
              },
              icon: const Icon(
                Icons.favorite,
                color: Colors.grey,
              ),
            ),
    );
  }
}
