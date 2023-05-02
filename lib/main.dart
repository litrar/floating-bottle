import 'package:floating_bottle/pages/authentication/login.dart';
import 'package:floating_bottle/pages/components/error_page.dart';
import 'package:floating_bottle/pages/subpage.dart';
import 'package:floating_bottle/pages/theme/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  late GoRouter _goRouter;
  MyApp({super.key}) {
    _goRouter = GoRouter(
        // navigatorKey: NavigatorProvider.navigatorKey,
        initialLocation: Login.route.path,
        routes: [
          Login.route,
          for (var page in SubPage.PAGES) page.route,
        ],
        // refreshListenable: _authNotifier,
        // redirect: _guard,
        errorBuilder: ((context, state) =>
            ErrorPage("uncaught error: ${state.error}")));
  }
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
            providers: [BlocProvider(create: (_) => ThemeCubit())],
            child: _app());
        // BlocProvider(
        //   create: (_) => ThemeCubit(),
        //   child: const MaterialApp(
        //     home: Login(),
        //   ),
        // );
      },
    );
  }

  Widget _app() {
    return MaterialApp.router(
        routerConfig: _goRouter,
        theme: ThemeData(primarySwatch: Colors.orange),
        //navigatorKey: NavigatorProvider.navigatorKey,
        debugShowCheckedModeBanner: false);
  }
}
