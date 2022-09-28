import 'package:flutter/foundation.dart';

class APIBase {
  static String get baseURL {
    if (kReleaseMode) {
      return "prod url here";
    } else {
      return "https://jsonplaceholder.typicode.com";
    }
  }

  static String get baseProdURL {
    if (kReleaseMode) {
      return "https://flutter-ecommerce-practice-default-rtdb.firebaseio.com";
    } else {
      return "https://flutter-ecommerce-practice-default-rtdb.firebaseio.com";
    }
  }
}
