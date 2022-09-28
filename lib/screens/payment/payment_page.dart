// import 'dart:io';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_paystack/flutter_paystack.dart';
// import 'package:lottie/lottie.dart';
// import 'package:provider/provider.dart';

// import '../../constants/key.dart';
// import '../../providers/cartitem.dart';
// import '../../providers/orders.dart';

// class MakePayment {
//   MakePayment(
//     this.ctx,
//     this.email,
//     this.price,
//     this.prodlist,
//     this.cartprice,
//   );
//   BuildContext ctx;
//   String email;
//   int price;
//   List<CartItem> prodlist;
//   double cartprice;

//   PaystackPlugin paystack = PaystackPlugin();

//   //Reference
//   String _getReference() {
//     String platform;
//     if (Platform.isIOS) {
//       platform = 'iOS';
//     } else {
//       platform = 'Android';
//     }
//     return 'ChargedFrom${platform}_${DateTime.now().microsecondsSinceEpoch}';
//   }

//   //getUi
//   PaymentCard _getCardUI() {
//     return PaymentCard(
//       number: '',
//       cvc: '',
//       expiryMonth: 0,
//       expiryYear: 0,
//     );
//   }

//   Future initializePlugin() async {
//     await paystack.initialize(
//       publicKey: ConstantKey.PAYSTACK_KEY,
//     );
//   }

//   //Method Charged card
//   chargeCardAndMakePayment() async {
//     initializePlugin().then(
//       (_) async {
//         Charge charge = Charge()
//           ..amount = price * 100
//           ..email = email
//           ..reference = _getReference()
//           ..card = _getCardUI();

//         CheckoutResponse response = await paystack.checkout(
//           ctx,
//           charge: charge,
//           method: CheckoutMethod.card,
//           fullscreen: false,
//           logo: SizedBox(
//             height: 80,
//             width: 80,
//             child: Image.asset(
//               'assets/images/logo (2).png',
//             ),
//           ),
//         );

//         if (response.status == true) {
//           final _orders = Provider.of<Order>(ctx, listen: false);
//           final cart = Provider.of<Cart>(ctx, listen: false);
//           _orders.addOrder(
//             prodlist.toList(),
//             cartprice,
//           );
//           cart.removeAllItem();
//           Navigator.of(ctx).pop();
//           showDialog(
//               context: ctx,
//               builder: (ctx) {
//                 return SimpleDialog(
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   title: Lottie.asset(
//                     'assets/lottie/103068-check-animation.json',
//                     animate: true,
//                     repeat: false,
//                     height: 300,
//                   ),
//                   children: [
//                     Center(
//                       child: Title(
//                         color: Colors.red,
//                         child: const Padding(
//                           padding: EdgeInsets.all(8.0),
//                           child: Text('Payment unsuccessful'),
//                         ),
//                       ),
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         ElevatedButton(
//                           onPressed: () {
//                             Navigator.of(ctx).pop();
//                           },
//                           child: const Text('Okay'),
//                         ),
//                       ],
//                     )
//                   ],
//                 );
//               });
//         } else {
//           showDialog(
//               context: ctx,
//               builder: (ctx) {
//                 return SimpleDialog(
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   title: Lottie.asset(
//                     'assets/lottie/102132-card-payment-unsuccessful.json',
//                     animate: true,
//                     repeat: false,
//                     height: 300,
//                   ),
//                   children: [
//                     Center(
//                       child: Title(
//                         color: Colors.red,
//                         child: const Padding(
//                           padding: EdgeInsets.all(8.0),
//                           child: Text('Payment unsuccessful'),
//                         ),
//                       ),
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         ElevatedButton(
//                           onPressed: () {
//                             Navigator.of(ctx).pop();
//                           },
//                           child: const Text('Okay'),
//                         ),
//                       ],
//                     )
//                   ],
//                 );
//               });
//           (print('Transaction failed'));
//         }
//       },
//     );
//   }
// }
