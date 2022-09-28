// import 'package:day_4/screens/wishlist/wishlist_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
// import 'package:provider/provider.dart';

// import '../../../constants/colors.dart';
// import '../../../providers/themes.dart';

// class IconRow extends StatelessWidget {
//   const IconRow({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(
//         horizontal: 10.0,
//         vertical: 12,
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           GestureDetector(
//             onTap: () {
//               pushNewScreenWithRouteSettings(
//                 context,
//                 screen: const Wishlist(),
//                 settings: const RouteSettings(
//                   name: Wishlist.routeName,
//                 ),
//                 withNavBar: false,
//               );
//             },
//             child: ordersIcons(Icons.favorite_outline_outlined, 'Wishlist'),
//           ),
//           ordersIcons(Icons.star_border_rounded, 'Following'),
//           ordersIcons(Icons.timer_rounded, 'Viewed'),
//           ordersIcons(Icons.airplane_ticket, 'Coupons'),
//         ],
//       ),
//     );
//   }

//   Widget ordersIcons(IconData icon, String text) {
//     return Column(
//       children: [
//         Consumer<ThemeProvider>(
//           builder: (_, value, ch) => Icon(
//             icon,
//             color: value.isDarkMode ? kRedColor : Colors.black,
//           ),
//         ),
//         Text(
//           text,
//           style: const TextStyle(
//             fontSize: 12,
//           ),
//         )
//       ],
//     );
//   }
// }
