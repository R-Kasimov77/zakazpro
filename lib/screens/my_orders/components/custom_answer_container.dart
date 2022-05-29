// import 'package:flutter/material.dart';
// import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
// import 'package:intl/intl.dart';
// import 'package:zakazpro/model/order.dart';

// class CustomAnswerContainer extends StatelessWidget {
//   final int index;
//   final Order order;
//   const CustomAnswerContainer(
//       {Key? key, required this.index, required this.order})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final responseIsNotEmpty = order.results[index].responses.isNotEmpty;
//     // var _date =
//     //     DateTime.tryParse(order.results[index].responses.first.user.dateJoined);
//     return Padding(
//       padding: const EdgeInsets.all(4),
//       child: Container(
//         decoration: BoxDecoration(
//           border: Border.all(color: Colors.grey),
//         ),
//         width: MediaQuery.of(context).size.width,
//         child: Padding(
//           padding: const EdgeInsets.only(bottom: 8, top: 8),
//           child: Column(
//             children: [
//               Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Container(
//                       decoration: BoxDecoration(
//                           color: Colors.grey.shade400,
//                           borderRadius: BorderRadius.circular(8)),
//                       child: Padding(
//                         padding: const EdgeInsets.all(6),
//                         child: responseIsNotEmpty
//                             ? Text(
//                                 DateFormat("${'dd.MM.yyyy'} в ${'HH:mm'}")
//                                     .format(DateTime.tryParse(
//                                           order.results[index].responses.first
//                                               .user.dateJoined,
//                                         ) ??
//                                         DateTime.now()),
//                                 style: TextStyle(color: Colors.white),
//                               )
//                             : SizedBox(),
//                       ),
//                     ),
//                   ),
//                   Icon(
//                     Icons.photo,
//                     size: 30,
//                     color: Colors.grey,
//                   ),
//                   Text(
//                       responseIsNotEmpty
//                           ? order.results[index].responses.first.user.username
//                           : '',
//                       // order.results[index].responses.first.user.username.,
//                       style: TextStyle(fontSize: 16)),
//                   Spacer(),
//                   Padding(
//                     padding: const EdgeInsets.only(right: 16),
//                     child: InkWell(
//                       onTap: () async {
//                         // launch("tel://${responseIsNotEmpty? order.results[index].responses.first.user.phone: ''}");
//                         if (responseIsNotEmpty &&
//                             order.results[index].responses.first.user.phone !=
//                                 null) {
//                           await FlutterPhoneDirectCaller.callNumber(
//                               order.results[index].responses.first.user.phone!);
//                         }
//                         //  responseIsNotEmpty? order.results[index].responses.first.user.phone: '',
//                       },
//                       child: Icon(
//                         Icons.phone,
//                         color: Colors.green,
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(right: 8, left: 8),
//                 child: Text(
//                   order.results[index].description,
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
