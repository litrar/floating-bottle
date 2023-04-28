import 'package:floating_bottle/pages/authentication/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: registration(),
      home: Login(),
    );
  }

// Widget registration() {
//   return Scaffold(
//       body: Stack(
//     children: <Widget>[
//       Container(
//         decoration: const BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage("assetsfolder/registration.jpg"),
//             fit: BoxFit.cover,
//           ),
//         ),
//       ),
//       const Center(
//         child: Text("this is the background"),
//       )
//     ],
//   ));
// }
}
