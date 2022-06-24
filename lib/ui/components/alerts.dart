import 'package:flutter/material.dart';

// class Alerts {
//   var alertStyle = AlertStyle(
//     animationType: AnimationType.fromTop,
//     isCloseButton: false,
//     isOverlayTapDismiss: false,
//     descStyle: const TextStyle(fontWeight: FontWeight.bold),
//     animationDuration: const Duration(milliseconds: 400),
//     alertBorder: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(0.0),
//       side: const BorderSide(
//         color: Colors.grey,
//       ),
//     ),
//     titleStyle: const TextStyle(
//       color: Colors.red,
//     ),
//   );

//   Future<bool> alerta(String title, String message, BuildContext context,
//       {String? cancelText, String? confirmText, required Function onConfirm}) {
//     return Alert(
//       context: context,
//       style: alertStyle,
//       type: AlertType.info,
//       title: "RFLUTTER ALERT",
//       desc: "Flutter is more awesome with RFlutter Alert.",
//       buttons: [
//         DialogButton(
//           child: const Text(
//             "COOL",
//             style: TextStyle(color: Colors.white, fontSize: 20),
//           ),
//           onPressed: () => Navigator.pop(context),
//           color: const Color.fromRGBO(0, 179, 134, 1.0),
//           radius: BorderRadius.circular(0.0),
//         ),
//       ],
//     ).show();
//   }
// }
