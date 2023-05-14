import 'package:floating_bottle/pages/personal_page/edit_name.dart';
import 'package:floating_bottle/pages/personal_page/personal_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

final mainPage = (BuildContext context, GoRouterState state) => PersonalPage();

final p_route = GoRoute(
    path: "/personal",
    builder: mainPage,
    routes: [
      GoRoute(
      path: "edit_name",
      builder: (context,state) => const EditNamePage()
    ),

    ]
);