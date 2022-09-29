import 'dart:math';

import 'package:day_4/utils/naira.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:day_4/models/orders.dart' as ord;

class OrderCon extends StatefulWidget {
  const OrderCon(this.order, {Key? key}) : super(key: key);
  final ord.OrderItem order;

  @override
  State<OrderCon> createState() => _OrderConState();
}

class _OrderConState extends State<OrderCon> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(5),
      child: Column(
        children: [
          ListTile(
            onTap: () {
              showModalBottomSheet(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                context: context,
                builder: (context) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        AppBar(
                          elevation: 0,
                          automaticallyImplyLeading: false,
                          backgroundColor: Colors.transparent,
                          title: const Text(
                            'Ordered Items',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          actions: [
                            IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: const Icon(
                                Icons.clear,
                                color: Colors.black,
                              ),
                            )
                          ],
                        ),
                        Expanded(
                          child: Material(
                            child: ListView.separated(
                              itemCount: widget.order.products.length,
                              separatorBuilder: (context, index) =>
                                  const Divider(),
                              itemBuilder: (context, index) {
                                return Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'x ${widget.order.products[index].quantity}',
                                        style: const TextStyle(
                                          fontSize: 15,
                                          letterSpacing: .5,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 4,
                                      child: Text(
                                        widget.order.products[index].title,
                                        style: const TextStyle(
                                          fontSize: 15,
                                          letterSpacing: .5,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        getNairaFormat().nairaPrice(
                                            widget.order.products[index].price),
                                        style: const TextStyle(
                                          fontSize: 15,
                                          letterSpacing: .5,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    )
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            title: Text(
              getNairaFormat().nairaPrice(widget.order.amount),
            ),
            subtitle: Text(
              DateFormat().add_yMMMEd().add_Hms().format(widget.order.dateTime),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ],
      ),
    );
  }
}
