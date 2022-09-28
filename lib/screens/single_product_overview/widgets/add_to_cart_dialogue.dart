import 'package:day_4/providers/cartitem.dart';
import 'package:day_4/providers/product.dart';
import 'package:day_4/providers/themes.dart';
import 'package:day_4/screens/core/widgets/bottom_navigation_bar_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/colors.dart';
import '../../core/widgets/image_holder.dart';

class AddToCartDialogue extends StatefulWidget {
  AddToCartDialogue(
    this.callback,
    this.product,
    this.color, {
    Key? key,
  }) : super(key: key);
  final Function callback;
  final Product product;
  String? color;
  @override
  State<AddToCartDialogue> createState() => _AddToCartDialogueState();
}

class _AddToCartDialogueState extends State<AddToCartDialogue> {
  var prodQuantity = 1;
  var selectedIndex;
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return ChangeNotifierProvider.value(
      value: widget.product,
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
            offset: const Offset(0, -80),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Container(
                          color: Colors.white,
                          child: SizedBox(
                            height: 100,
                            width: 100,
                            child: ImageHolder2(widget.product.image),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          '${widget.product.nairaPrice(widget.product.price)} / piece',
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                if (widget.product.colorImages != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 20,
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
                            'VARIATIONS',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
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
                                              widget.product.colorImages![index]
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
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              SizedBox(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(
                                          () {
                                            prodQuantity <= 1
                                                ? null
                                                : prodQuantity =
                                                    prodQuantity - 1;
                                          },
                                        );
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
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
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(
                                          () {
                                            prodQuantity = prodQuantity + 1;
                                          },
                                        );
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
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
                              Text(
                                'Shipping: ${widget.product.nairaPrice(widget.product.shippingFee)}',
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text(
                                'Shipped from Benin to Lagos',
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                              const Text(
                                'Estimated delivery is 3 days',
                                style: TextStyle(
                                  fontSize: 12,
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
          ),
          const Spacer(),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                horizontal: 90,
              ),
            ),
            child: const Text('Continue'),
            onPressed: () {
              cart.addItem(
                widget.product.id,
                widget.product.price,
                widget.product.title,
                widget.product.image,
                widget.product.shippingFee,
                widget.color,
                prodQuantity,
              );
              Navigator.of(context).pop();
              // ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  duration: const Duration(seconds: 2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  behavior: SnackBarBehavior.floating,
                  action: SnackBarAction(
                    label: 'Undo',
                    onPressed: () {
                      cart.removeSingleItem(widget.product.id);
                    },
                  ),
                  content: const Text('Added to cart'),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
