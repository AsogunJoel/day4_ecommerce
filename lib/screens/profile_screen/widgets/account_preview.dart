// import 'package:day_4/screens/core/widgets/image_holder.dart';
// import 'package:flutter/material.dart';

// class AccountPreview extends StatelessWidget {
//   const AccountPreview({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(8),
//       child: Row(
//         children: [
//           SizedBox(
//             height: 50,
//             width: 50,
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(50),
//               child: Container(
//                 color: Colors.white,
//                 child: const ImageHolder2(
//                   'https://upload.wikimedia.org/wikipedia/commons/thumb/3/34/Elon_Musk_Royal_Society_%28crop2%29.jpg/220px-Elon_Musk_Royal_Society_%28crop2%29.jpg',
//                 ),
//               ),
//             ),
//           ),
//           // CircleAvatar(
//           //   child:
//           //   backgroundImage: NetworkImage(
//           //     'https://upload.wikimedia.org/wikipedia/commons/thumb/3/34/Elon_Musk_Royal_Society_%28crop2%29.jpg/220px-Elon_Musk_Royal_Society_%28crop2%29.jpg',
//           //   ),
//           //   backgroundColor: Colors.transparent,
//           //   minRadius: 25,
//           //   // child: FittedBox(
//           //   //   child: ImageHolder(
//           //   //       'https://upload.wikimedia.org/wikipedia/commons/thumb/3/34/Elon_Musk_Royal_Society_%28crop2%29.jpg/220px-Elon_Musk_Royal_Society_%28crop2%29.jpg'),
//           //   // ),
//           // ),
//           Padding(
//             padding: const EdgeInsets.symmetric(
//               horizontal: 8.0,
//               vertical: 10,
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: const [
//                 Text(
//                   'Asogun Joel',
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 5),
//                 Text(
//                   'Asogunjoel@gmail.com',
//                   style: TextStyle(
//                     fontSize: 13,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Spacer(),
//           IconButton(
//             onPressed: () {},
//             icon: Icon(
//               Icons.arrow_forward_ios,
//               size: 15,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
