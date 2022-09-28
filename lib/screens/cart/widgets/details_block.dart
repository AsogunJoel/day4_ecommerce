import 'package:day_4/providers/cartitem.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/colors.dart';
import '../../../providers/themes.dart';

class DetailBlock extends StatelessWidget {
  const DetailBlock({
    Key? key,
    required this.title,
    required this.price,
    required this.shipping,
    required this.total,
    required this.productId,
    required this.quantity,
  }) : super(key: key);

  final String title;
  final num price;
  final num shipping;
  final num total;
  final String productId;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    nairaPrice(price) {
      return '₦ ${price.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}';
    }

    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 3.0,
          ),
          child: Text(
            title,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 15,
              letterSpacing: .5,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Price: ${nairaPrice(price)}',
                  style: const TextStyle(
                    fontSize: 15,
                    letterSpacing: .5,
                  ),
                ),
                shipping == 0
                    ? const Text(
                        'Free Shipping',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 15,
                          letterSpacing: .5,
                        ),
                      )
                    : Text(
                        'Shipping fee: ${nairaPrice(shipping)}',
                        style: const TextStyle(
                          fontSize: 15,
                          letterSpacing: .5,
                        ),
                      ),
                Text(
                  'Total: ${nairaPrice(total)}',
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    letterSpacing: .5,
                  ),
                ),
              ],
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    color: Colors.grey,
                    spreadRadius: -5,
                    offset: Offset(0, 5),
                  )
                ],
              ),
              child: Card(
                color: Provider.of<ThemeProvider>(context).isDarkMode
                    ? Colors.grey
                    : kLightBackground,
                elevation: 0,
                margin: const EdgeInsets.all(0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(
                    color: Colors.grey.shade400,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Consumer<Cart>(
                      builder: (_, value, ch) {
                        return GestureDetector(
                          onTap: () {
                            quantity <= 1
                                ? null
                                : value.removeSingleItem(productId);
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                              ),
                            ),
                            width: 30,
                            child: const Center(
                              child: Text(
                                ' - ',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    Container(
                      height: 40,
                      width: 2,
                      color: Colors.grey.shade400,
                    ),
                    SizedBox(
                      width: 30,
                      child: Center(
                        child: Text(
                          'x $quantity',
                        ),
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 2,
                      color: Colors.grey.shade400,
                    ),
                    Consumer<Cart>(
                      builder: (_, value, ch) {
                        return GestureDetector(
                          onTap: () {
                            value.addSingleItem(productId);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                              color:
                                  Provider.of<ThemeProvider>(context).isDarkMode
                                      ? Colors.grey
                                      : kLightBackground,
                            ),
                            width: 30,
                            child: const Center(
                              child: Text(
                                ' + ',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
