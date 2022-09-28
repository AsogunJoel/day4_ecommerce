import 'package:day_4/models/review.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';

import '../../../constants/colors.dart';

class CustomerReview extends StatelessWidget {
  const CustomerReview(
    this.review, {
    Key? key,
  }) : super(key: key);
  final List<SingleReview> review;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Customer Reviews'),
      ),
      body: SingleChildScrollView(
        child: review.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Card(
                  elevation: 0,
                  margin: EdgeInsets.zero,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        ListView.separated(
                          separatorBuilder: (context, index) => const Divider(
                            indent: 10,
                            endIndent: 10,
                          ),
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) => Container(
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
                                          .format(review[index].time),
                                      style: const TextStyle(
                                        fontSize: 10,
                                        color: Colors.grey,
                                        letterSpacing: .5,
                                      ),
                                    ),
                                  ],
                                ),
                                RatingBarIndicator(
                                  rating: review[index].rating,
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
                                    review[index].review,
                                    style: const TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          itemCount: review.length,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            : const Center(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('No reviews for this product'),
                ),
              ),
      ),
    );
  }
}
