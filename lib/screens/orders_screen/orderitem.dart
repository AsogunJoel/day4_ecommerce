import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:day_4/providers/orders.dart' as ord;

class OrderCon extends StatefulWidget {
  const OrderCon(this.order, {Key? key}) : super(key: key);
  final ord.OrderItem order;

  @override
  State<OrderCon> createState() => _OrderConState();
}

class _OrderConState extends State<OrderCon> {
  var _expanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(5),
      child: Column(
        children: [
          ListTile(
            title: Text('${widget.order.nairaPrice(widget.order.amount)}'),
            subtitle: Text(
              DateFormat('dd.MM.yyy, hh:mm').format(widget.order.dateTime),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            trailing: IconButton(
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
              icon: _expanded
                  ? const Icon(Icons.arrow_drop_up)
                  : const Icon(Icons.arrow_drop_down),
            ),
          ),
          if (_expanded)
            Container(
              padding: const EdgeInsets.all(10),
              height: min(widget.order.products.length * 150.0 + 80, 380),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: ListView(
                children: [
                  ...widget.order.products.map(
                    (e) => Column(
                      children: [
                        const Divider(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListView(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            children: [
                              Text(
                                e.title,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  'Amount: ${e.nairaPrice(e.price)}',
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  'Quantity: ${e.quantity}',
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  'Total: ${e.nairaPrice(e.quantity * e.price)} (${e.quantity})',
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
