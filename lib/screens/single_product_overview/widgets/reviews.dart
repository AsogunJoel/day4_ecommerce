import 'dart:math';

import 'package:day_4/constants/colors.dart';
import 'package:day_4/models/review.dart';
import 'package:day_4/providers/reviews.dart';
import 'package:day_4/providers/themes.dart';
import 'package:day_4/screens/single_product_overview/widgets/review_dialogue.dart';
import 'package:day_4/screens/single_product_overview/widgets/reviews_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../providers/product.dart';

class ReviewTile extends StatelessWidget {
  const ReviewTile({
    Key? key,
    required this.product,
  }) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context).isDarkMode;
    final reviews = Provider.of<Review>(context, listen: false)
        .singleReviewList(product.id);
    return Container(
      decoration: BoxDecoration(
        color: theme ? kDarkBackground : Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                  right: 4,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 0,
                        vertical: 20,
                      ),
                      child: Text(
                        'Customer reviews (${reviews.length})',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          letterSpacing: .5,
                        ),
                      ),
                    ),
                    product.reviews != null
                        ? Text(
                            '(${product.reviews!.length})',
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        : Container(),
                    const Spacer(),
                  ],
                ),
              ),
              ReviewTileBody(reviews: reviews, product: product),
            ],
          ),
        ],
      ),
    );
  }
}

class ReviewTileBody extends StatelessWidget {
  const ReviewTileBody({
    Key? key,
    required this.reviews,
    required this.product,
  }) : super(key: key);

  final List<SingleReview> reviews;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<Review>(context, listen: false).fetchAndSetReviews(),
      builder: (ctx, snapshot) => Consumer<Review>(
        builder: (context, value, child) {
          return Column(
            children: [
              reviews.isNotEmpty
                  ? ListView.separated(
                      separatorBuilder: (context, index) => const Divider(
                        indent: 10,
                        endIndent: 10,
                      ),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Anonymous user',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.grey,
                                      letterSpacing: .5,
                                    ),
                                  ),
                                  Text(
                                    DateFormat('dd-MM-yyyy')
                                        .format(reviews[index].time),
                                    style: const TextStyle(
                                      fontSize: 10,
                                      color: Colors.grey,
                                      letterSpacing: .5,
                                    ),
                                  ),
                                ],
                              ),
                              RatingBarIndicator(
                                rating: reviews[index].rating,
                                itemBuilder: (ctx, index) => const Icon(
                                  Icons.star_rounded,
                                  color: kOrangeColor,
                                ),
                                itemSize: 13,
                                itemCount: 5,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(
                                  reviews[index].review,
                                  style: const TextStyle(
                                    fontSize: 13,
                                    letterSpacing: .5,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      itemCount: reviews.length > 3 ? 3 : reviews.length,
                    )
                  : const Text(
                      'No reviews yet',
                      style: TextStyle(
                        fontSize: 15,
                        letterSpacing: .5,
                      ),
                    ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: TextButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (ctx) {
                              return AddReview(product.id);
                            });
                      },
                      child: const Text(
                        'Add reviews',
                        style: TextStyle(
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            fullscreenDialog: true,
                            settings: RouteSettings(
                              arguments: product,
                            ),
                            builder: (ctx) => CustomerReview(reviews),
                          ),
                        );
                      },
                      child: const Text(
                        'View all',
                        style: TextStyle(
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
