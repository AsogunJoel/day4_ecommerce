import 'package:day_4/network_module/api_response.dart';
import 'package:day_4/providers/orders_provider.dart';
import 'package:day_4/screens/auth_screen/auth_screen.dart';
import 'package:day_4/screens/connection_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../providers/auth.dart';
import '../../models/orders.dart' show Order;
import 'orderitem.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({Key? key}) : super(key: key);
  static const routeName = '/orderScreen';

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<Order>(
      context,
      listen: false,
    ).initializer();
  }

  @override
  Widget build(BuildContext context) {
    final isAuth = Provider.of<Auth>(context).isAuth;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders'),
      ),
      body: isAuth
          ? Consumer<Order>(
              builder: (context, value, child) {
                if (value.order.status == Status.COMPLETED) {
                  return Consumer<Order>(
                    builder: (ctx, orderData, _) {
                      if (orderData.orders.isNotEmpty) {
                        return ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 3,
                          ),
                          itemCount: orderData.orders.length,
                          itemBuilder: (ctx, i) {
                            return OrderCon(
                              orderData.orders[i],
                            );
                          },
                        );
                      } else {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8.0,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Lottie.asset(
                                  'assets/lottie/lf20_nl3zpx7i.json',
                                  repeat: false,
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Text(
                                'No orders yet...',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                          ],
                        );
                      }
                    },
                  );
                } else if (value.order.status == Status.ERROR) {
                  return Center(
                    child: NetworkPage(
                      'Something went wrong...',
                      value.initializer(),
                    ),
                  );
                } else {
                  return const OrderLoadingWidget();
                }
              },
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                    ),
                    child: Lottie.asset(
                      'assets/lottie/lf20_rlz5rs5m.json',
                      height: 400,
                    ),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed(AuthScreen.routeName);
                    },
                    child: const Text('Login'),
                  )
                ],
              ),
            ),
    );
  }
}

class OrderLoadingWidget extends StatelessWidget {
  const OrderLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListView(
        shrinkWrap: true,
        children: [
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              margin: const EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height * 0.32 / 4,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(211, 211, 211, 1),
                borderRadius: BorderRadius.all(
                  Radius.circular(7),
                ),
              ),
            ),
          ),
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              margin: const EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height * 0.32 / 4,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(211, 211, 211, 1),
                borderRadius: BorderRadius.all(
                  Radius.circular(7),
                ),
              ),
            ),
          ),
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              margin: const EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height * 0.32 / 4,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(211, 211, 211, 1),
                borderRadius: BorderRadius.all(
                  Radius.circular(7),
                ),
              ),
            ),
          ),
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              margin: const EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height * 0.32 / 4,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(211, 211, 211, 1),
                borderRadius: BorderRadius.all(
                  Radius.circular(7),
                ),
              ),
            ),
          ),
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              margin: const EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height * 0.32 / 4,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(211, 211, 211, 1),
                borderRadius: BorderRadius.all(
                  Radius.circular(7),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
