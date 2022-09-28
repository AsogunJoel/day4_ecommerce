import 'dart:convert';

import 'package:day_4/constants/key.dart';
import 'package:day_4/providers/cartitem.dart';
import 'package:day_4/models/orders.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Order with ChangeNotifier {
  List<OrderItem> _ordersList = [];
  final String authToken;
  final String userId;
  Order(this.authToken, this.userId, this._ordersList);
  List<OrderItem> get orders {
    return [..._ordersList];
  }

  Future<void> fetchAndSetOrders() async {
    final url = Uri.parse('$urlfromenv/orders/$userId.json?auth=$authToken');
    try {
      final response = await http.get(url);
      final List<OrderItem> loadedOrders = [];
      Map<String, dynamic>? extracteddata = jsonDecode(response.body);
      if (extracteddata == null) {
        return;
      }
      extracteddata.forEach(
        (orderId, orderData) {
          loadedOrders.add(
            OrderItem.fromJson(
              orderData,
              orderId,
            ),
          );
        },
      );
      _ordersList = loadedOrders.reversed.toList();
    } catch (e) {
      rethrow;
    }
    notifyListeners();
  }

  Future<void> addOrder(List<CartItem> cartProducts, double total) async {
    final url = Uri.parse(
        'https://flutter-ecommerce-practice-default-rtdb.firebaseio.com/orders/$userId.json?auth=$authToken');
    final timeStamp = DateTime.now();
    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            'amount': total,
            'dateTime': timeStamp.toIso8601String(),
            'products': cartProducts
                .map(
                  (cp) => cp.toJson(),
                )
                .toList(),
          },
        ),
      );
    } catch (e) {
      rethrow;
    }
    _ordersList.insert(
      0,
      OrderItem(
        id: '',
        amount: total,
        products: cartProducts,
        dateTime: DateTime.now(),
      ),
    );
    notifyListeners();
  }
}
