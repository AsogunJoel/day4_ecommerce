import '../../payment/payment_details_page.dart';
import '../../payment/payment_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/cartitem.dart';
import '../../../models/product.dart';
import '../../core/widgets/image_holder.dart';

class BuyDialogue extends StatefulWidget {
  BuyDialogue(
    this.callback,
    this.product,
    this.color, {
    Key? key,
  }) : super(key: key);
  final Function callback;
  final Product product;
  String? color;
  @override
  State<BuyDialogue> createState() => _BuyDialogueState();
}

class _BuyDialogueState extends State<BuyDialogue> {
  var prodQuantity = 1;
  String selectedIndex = '';
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: widget.product,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            AppBar(
              backgroundColor: Colors.transparent,
              automaticallyImplyLeading: false,
              elevation: 0,
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
            Transform.translate(
              offset: const Offset(0, -90),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: SizedBox(
                            height: 100,
                            width: 100,
                            child: ImageHolder2(widget.product.image),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RichText(
                            text: TextSpan(
                              style: DefaultTextStyle.of(context).style,
                              children: <TextSpan>[
                                TextSpan(
                                  text:
                                      '${widget.product.nairaPrice(widget.product.price)}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    letterSpacing: .5,
                                  ),
                                ),
                                const TextSpan(
                                  text: ' / piece',
                                  style: TextStyle(
                                    fontSize: 15,
                                    letterSpacing: .5,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  if (widget.product.colorImages != null)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(
                              top: 8.0,
                              left: 8,
                            ),
                            child: Text(
                              'Variations',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                letterSpacing: .5,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                            width: double.infinity,
                            child: ListView.separated(
                              separatorBuilder: ((context, index) =>
                                  const SizedBox(width: 10)),
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: widget.product.colorImages!.length,
                              itemBuilder: (ctx, index) => GestureDetector(
                                onTap: () {
                                  setState(
                                    () {
                                      selectedIndex =
                                          widget.product.colorImages![index];
                                      widget.color =
                                          widget.product.colorImages![index];
                                      widget.callback(widget.color);
                                    },
                                  );
                                },
                                child: FittedBox(
                                  child: Container(
                                    margin:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: selectedIndex ==
                                                widget
                                                    .product.colorImages![index]
                                            ? Colors.red
                                            : Colors.transparent,
                                      ),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                    ),
                                    child: Card(
                                      margin: const EdgeInsets.all(0),
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Text(
                                          widget.product.colorImages![index],
                                          softWrap: false,
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(fontSize: 10),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Divider(),
                        ],
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                    ),
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Quantity: ',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(
                                    () {
                                      prodQuantity <= 1
                                          ? null
                                          : prodQuantity = prodQuantity - 1;
                                    },
                                  );
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(60),
                                    color: Colors.grey[300],
                                  ),
                                  child: const Icon(
                                    Icons.remove,
                                    size: 17,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 30,
                                child: Center(
                                  child: Text(
                                    'x $prodQuantity',
                                    style: const TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    prodQuantity = prodQuantity + 1;
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(60),
                                    color: Colors.grey[300],
                                  ),
                                  child: const Icon(
                                    Icons.add,
                                    size: 17,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 14,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            'Shipping: ${widget.product.nairaPrice(widget.product.shippingFee)}',
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              letterSpacing: .5,
                            ),
                          ),
                        ),
                        const Text(
                          'Shipped from Benin to Lagos. Estimated delivery is 3 days.',
                          style: TextStyle(
                            fontSize: 13,
                            letterSpacing: .5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 90,
                ),
              ),
              child: const Text('Checkout'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => PaymentDetails(
                      [
                        CartItem(
                          id: widget.product.id,
                          title: widget.product.title,
                          quantity: prodQuantity,
                          price: widget.product.price,
                          image: widget.product.image,
                          shipping: widget.product.shippingFee,
                        )
                      ],
                    ),
                    fullscreenDialog: true,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
