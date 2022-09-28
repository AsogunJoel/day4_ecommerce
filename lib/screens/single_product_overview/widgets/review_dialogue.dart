import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

import '../../../constants/colors.dart';
import '../../../models/review.dart';
import '../../../providers/reviews.dart';

class AddReview extends StatefulWidget {
  const AddReview(
    this.prodId, {
    Key? key,
  }) : super(key: key);
  final String prodId;

  @override
  State<AddReview> createState() => _AddReviewState();
}

class _AddReviewState extends State<AddReview> {
  final _formKey = GlobalKey<FormState>();
  final _ratingController = TextEditingController();
  double _userRating = 0.0;

  var _editedReview = SingleReview(
    id: '',
    prodid: '',
    review: '',
    time: DateTime.now(),
    rating: 0,
  );

  @override
  void dispose() {
    _formKey.currentState?.dispose();
    _ratingController.clear();
    super.dispose();
  }

  Future<void> _saveForm() async {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      _formKey.currentState!.save();
      Provider.of<Review>(
        context,
        listen: false,
      ).addReview(_editedReview);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ListView(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              children: [
                SizedBox(
                  height: 200,
                  child: Image.asset(
                      'assets/images/—Pngtree—customer reviews concept with people_5335846.png'),
                ),
                Center(
                  child: Text(
                    'Rate this Product',
                    style: TextStyle(
                      fontSize: 15,
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: RatingBar(
                    glowColor: Colors.purpleAccent,
                    initialRating: _userRating,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    unratedColor: Colors.amber.withAlpha(50),
                    ratingWidget: RatingWidget(
                      full: const Icon(
                        Icons.star_rounded,
                        color: kOrangeColor,
                      ),
                      half: const Icon(
                        Icons.star_half_rounded,
                        color: kOrangeColor,
                      ),
                      empty: const Icon(
                        Icons.star_rounded,
                      ),
                    ),
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    onRatingUpdate: (rating) {
                      setState(
                        () {
                          _userRating = rating;
                        },
                      );
                    },
                    updateOnDrag: true,
                  ),
                ),
                const SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      label: const Text(
                        'Leave Review',
                      ),
                      hintText: 'Leave Review',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      errorBorder: OutlineInputBorder(
                        gapPadding: 0,
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color: Colors.red,
                        ),
                      ),
                    ),
                    textCapitalization: TextCapitalization.sentences,
                    textInputAction: TextInputAction.done,
                    onSaved: (newValue) {
                      _editedReview = SingleReview(
                        id: _editedReview.id,
                        prodid: widget.prodId,
                        review: newValue!,
                        time: _editedReview.time,
                        rating: double.parse(_userRating.toString()),
                      );
                    },
                    validator: (newValue) {
                      if (newValue == null || newValue.isEmpty) {
                        return 'Please Enter product name';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 20.0,
                    top: 10,
                  ),
                  child: ElevatedButton(
                    onPressed: _saveForm,
                    child: const Text(
                      'Submit',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
