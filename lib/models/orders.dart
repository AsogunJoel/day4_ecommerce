import 'package:day_4/providers/cartitem.dart';
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
