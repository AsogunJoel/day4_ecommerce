import 'package:flutter_dotenv/flutter_dotenv.dart';

class ConstantKey {
  static const String PAYSTACK_KEY =
      'pk_test_c22e356626a1113acf2c0f23db801723260da542';
}

String urlfromenv = dotenv.env['firebaseurl']!;
String authKey = dotenv.env['authKey']!;
