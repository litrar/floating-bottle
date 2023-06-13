import 'package:floating_bottle/pages/personal_page/edit_name.dart';
import 'package:floating_bottle/pages/personal_page/personal_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

final mainPage = (BuildContext context, GetXState state) => PersonalPage();

final p_route = GetPage(
  name: "/personal",
  page: () => PersonalPage(),
  children: [
    GetPage(
      name: "/edit_name",
      page: () => const EditNamePage(),
    ),
  ],
);