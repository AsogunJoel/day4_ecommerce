import 'dart:convert';

import 'package:day_4/constants/key.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/review.dart';

class Review with ChangeNotifier {
  List<SingleReview> _reviewList = [];

  initializer() {
    fetchAndSetReviews();
  }

  List<SingleReview> get reviewList {
    return _reviewList;
  }

  List<SingleReview> singleReviewList(prodId) {
    final revlist = reviewList
        .where((element) => element.prodid == prodId)
        .toList()
        .reversed
        .toList();
    return revlist;
  }

  Future<void> fetchAndSetReviews() async {
    var url = Uri.parse('$urlfromenv/review.json');
    try {
      final response = await http.get(url);
      Map<String, dynamic>? extractedaData = json.decode(response.body);
      if (extractedaData == null) {
        return;
      }
      final List<SingleReview> loadedReviews = [];
      extractedaData.forEach(
        (prodId, revData) {
          loadedReviews.add(
            SingleReview.fromJson(revData),
          );
        },
      );
      _reviewList = loadedReviews;
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  Future<void> addReview(SingleReview review) async {
    final url = Uri.parse(
        'https://flutter-ecommerce-practice-default-rtdb.firebaseio.com/review.json');
    try {
      final response = await http.post(
        url,
        body: json.encode(
          review.toJson(),
        ),
      );
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }
}
