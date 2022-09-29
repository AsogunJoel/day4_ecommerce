import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cart.g.dart';

@JsonSerializable()
class CartItem {
  late final String id;
  final String title;
  final int quantity;
  final num price;
  final String image;
  final num shipping;
  final String? variation;

  CartItem({
    required this.id,
    required this.title,
    required this.quantity,
    required this.price,
    required this.image,
    required this.shipping,
    this.variation,
  });

  factory CartItem.fromJson(Map<String, dynamic> data) =>
      _$CartItemFromJson(data);

  Map<String, dynamic> toJson() => _$CartItemToJson(this);
}

class Cart with ChangeNotifier {
  final Map<String, CartItem>? _products = {};

  Map<String, CartItem> get product {
    return {..._products!};
  }

  int get itemCount {
    return _products!.length;
  }

  double get totalAmount {
    var total = 0.0;
    _products!.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity + cartItem.shipping;
    });
    return total;
  }

  int get cartTotal {
    var total = 0;
    _products!.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity + cartItem.shipping as int;
    });
    return total;
  }

  void addItem(
    String productId,
    num price,
    String title,
    String image,
    num shipping,
    String? variation,
    int quantity,
  ) {
    if (_products!.containsKey(productId)) {
      _products!.update(
        productId,
        (existingCartItem) => CartItem(
          id: existingCartItem.id,
          title: existingCartItem.title,
          quantity: existingCartItem.quantity + 1,
          price: existingCartItem.price,
          image: existingCartItem.image,
          shipping: existingCartItem.shipping,
          variation: existingCartItem.variation,
        ),
      );
    } else {
      _products!.putIfAbsent(
        productId,
        () => CartItem(
          id: DateTime.now().toString(),
          title: title,
          quantity: quantity,
          price: price,
          image: image,
          shipping: shipping,
          variation: variation,
        ),
      );
    }
    notifyListeners();
  }

  void removeSingleItem(String productId) {
    if (!_products!.containsKey(productId)) {
      return;
    }
    if (_products![productId]!.quantity >= 1) {
      _products!.update(
        productId,
        (existing) => CartItem(
          id: existing.id,
          image: existing.image,
          shipping: existing.shipping,
          title: existing.title,
          price: existing.price,
          quantity: existing.quantity - 1,
        ),
      );
    }
    if (_products![productId]!.quantity < 1) {
      _products!.remove(productId);
    } else {}
    notifyListeners();
  }

  void addSingleItem(String productId) {
    if (!_products!.containsKey(productId)) {
      return;
    }
    if (_products![productId]!.quantity < 100) {
      _products!.update(
        productId,
        (existing) => CartItem(
          id: existing.id,
          image: existing.image,
          shipping: existing.shipping,
          title: existing.title,
          price: existing.price,
          quantity: existing.quantity + 1,
        ),
      );
    } else {
      return;
    }
    notifyListeners();
  }

  void removeItem(productId) {
    _products?.remove(productId);
    notifyListeners();
  }

  void removeAllItem() {
    _products?.clear();
    notifyListeners();
  }
}
