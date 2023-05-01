import 'package:floating_bottle/pages/authentication/login.dart';
import 'package:floating_bottle/pages/theme/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return BlocProvider(
          create: (_) => ThemeCubit(),
          child: const MaterialApp(
            home: Login(),
          ),
        );
      },
    );
    // return MaterialApp(
    //   home: BlocProvider(
    //     create: (_) => ThemeCubit(),
    //     child: const Login(),
    //   ),
    // );
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
