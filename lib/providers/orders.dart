import 'dart:convert';
import 'package:day_4/network_module/api_response.dart';
import 'package:day_4/providers/cartitem.dart';
import 'package:day_4/repository/prod_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';

part 'orders.g.dart';

@JsonSerializable(explicitToJson: true)
class OrderItem {
  final String id;
  final num amount;
  final List<CartItem> products;
  final DateTime dateTime;

  OrderItem({
    required this.id,
    required this.amount,
    required this.products,
    required this.dateTime,
  });

  nairaPrice(price) {
    return '₦ ${price.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}';
  }

  factory OrderItem.fromJson(Map<String, dynamic> data, String id) =>
      _$OrderItemFromJson(data, id);

  Map<String, dynamic> toJson() => _$OrderItemToJson(this);
}

class Order with ChangeNotifier {
  List<OrderItem> _ordersList = [];
  final String authToken;
  final String userId;
  Order(this.authToken, this.userId, this._ordersList);
  List<OrderItem> get orders {
    return [..._ordersList];
  }

  Future<void> fetchAndSetOrders() async {
    final url = Uri.parse(
        'https://flutter-ecommerce-practice-default-rtdb.firebaseio.com/orders/$userId.json?auth=$authToken');
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

  // nairaPrice(price) {
  //   return '₦ ${price.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}';
  // }
}
