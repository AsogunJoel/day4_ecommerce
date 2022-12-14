import 'dart:convert';

import 'package:day_4/constants/key.dart';
import 'package:day_4/network_module/api_response.dart';
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

  initializer() async {
    await fetchAndSetOrders();
  }

  ApiResponse<List<OrderItem>> _orders = ApiResponse.completed([]);

  ApiResponse<List<OrderItem>> get order => _orders;

  Future<void> fetchAndSetOrders() async {
    _orders = ApiResponse.loading('loading... ');
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
      _orders = ApiResponse.completed(orders);
    } catch (e) {
      _orders = ApiResponse.error(
        e.toString(),
      );
    }
    notifyListeners();
  }

  Future<void> addOrder(List<CartItem> cartProducts, double total) async {
    final url = Uri.parse('$urlfromenv/orders/$userId.json?auth=$authToken');
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
