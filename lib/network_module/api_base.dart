import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class APIBase {
  static String get baseURL {
    if (kReleaseMode) {
      return "prod url here";
    } else {
      return "https://jsonplaceholder.typicode.com";
    }
  }

  static String get baseProdURL {
    // dotenv.env['google_api_key']!;
    if (kReleaseMode) {
      return dotenv.env['firebaseurl']!;
    } else {
      return dotenv.env['firebaseurl']!;
    }
  }
}
