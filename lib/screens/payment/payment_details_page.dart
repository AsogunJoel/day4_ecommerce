import 'package:day_4/providers/cartitem.dart';
import 'package:day_4/screens/core/widgets/image_holder.dart';
import 'package:day_4/screens/payment/widgets/delivery_details_page.dart';
import 'package:flutter/material.dart';

class PaymentDetails extends StatefulWidget {
  PaymentDetails(this.cartItem, {Key? key}) : super(key: key);
  List<CartItem> cartItem;

  @override
  State<PaymentDetails> createState() => _PaymentDetailsState();
}

class _PaymentDetailsState extends State<PaymentDetails> {
  PageController pageController = PageController();
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (value) {
          setState(() {
            currentPage = value;
          });
        },
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListView.separated(
                physics: const BouncingScrollPhysics(),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 5,
                ),
                padding: const EdgeInsets.all(10),
                shrinkWrap: true,
                itemCount: widget.cartItem.length,
                itemBuilder: ((context, index) {
                  return Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: const EdgeInsets.all(0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              height: 100,
                              width: 100,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child:
                                    ImageHolder2(widget.cartItem[index].image),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.cartItem[index].title,
                                  softWrap: true,
                                  style: const TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 8.0,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Quantity: ${widget.cartItem[index].quantity}',
                                        style: const TextStyle(
                                            fontSize: 15, letterSpacing: .5),
                                      ),
                                      Text(
                                        'Shipping fee: ${widget.cartItem[index].nairaPrice(widget.cartItem[index].shipping)}',
                                        style: const TextStyle(
                                          fontSize: 15,
                                          color: Colors.red,
                                          letterSpacing: .5,
                                        ),
                                      ),
                                      Text(
                                        'Price: ${widget.cartItem[index].nairaPrice(widget.cartItem[index].price)}',
                                        style: const TextStyle(
                                          fontSize: 15,
                                          letterSpacing: .5,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (currentPage == 0) {
                        pageController.nextPage(
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeIn,
                        );
                      }
                    },
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Proceed',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
          DeliveryDetailsPage(widget.cartItem),
        ],
      ),
    );
  }
}
