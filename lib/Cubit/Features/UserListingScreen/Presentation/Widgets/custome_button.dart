import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class CustomeButton extends StatelessWidget {
  String label;
  VoidCallback ontap;

  CustomeButton({required this.label, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Padding(
            child: Text(
              label.toUpperCase(),
              style: Theme.of(context)
                  .textTheme
                  .subtitle2
                  ?.copyWith(fontWeight: FontWeight.w700),
            ),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
      ),
    );
  }
}

// Widget CustomeButton(
//     {required String label, required VoidCallback ontap, def = "ll"}) {
//   return GestureDetector(
//     onTap: ontap,
//     child: Container(
//       decoration: BoxDecoration(
//         color: Colors.blue,
//         borderRadius: BorderRadius.circular(100),
//       ),
//       child: Padding(
//           child: Text(
//             label.toUpperCase(),
//             // style: Theme.of(context).textTheme.headline6,
//           ),
//           padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
//     ),
//   );
// }
