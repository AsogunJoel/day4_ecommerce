import 'package:day_4/screens/single_product_overview/widgets/buy_dialogue.dart';
import 'package:day_4/screens/single_product_overview/widgets/nav_bar.dart';
import 'package:flutter/material.dart';

import '../../../models/product.dart';

class ProductColors extends StatefulWidget {
  ProductColors({
    Key? key,
    required this.callback,
    required this.product,
    required this.color,
  }) : super(key: key);

  final Product product;
  String? color;
  final Function callback;

  @override
  State<ProductColors> createState() => _ProductColorsState();
}

class _ProductColorsState extends State<ProductColors> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 8),
            child: Text(
              '${widget.product.colorImages!.length.toString()} VARIATIONS ',
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 50,
            width: double.infinity,
            child: ListView.separated(
              separatorBuilder: ((context, index) => const SizedBox(width: 10)),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: widget.product.colorImages!.length,
              itemBuilder: (ctx, index) => GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    enableDrag: false,
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    builder: (context) => FractionallySizedBox(
                      heightFactor: 0.8,
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 4 / 6,
                        child: BuyDialogue(
                          widget.callback,
                          widget.product,
                          widget.color!,
                        ),
                      ),
                    ),
                  );
                },
                child: FittedBox(
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
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
        ],
      ),
    );
  }
}
