import 'package:floating_bottle/pages/contact_page/contact_history.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:go_router/go_router.dart';
import '../write_letter.dart';
import 'contact.dart';

final c_route = GetPage(
  name: "/contact",
  page: () => ContactPage(),
  children: [
    GetPage(
      name: "/contact/history",
      page: () => ContactHistory(),
      children: [
        GetPage(
          name: "/contact/history/write",
          page: () => WriteLetter(),
        ),
      ],
    ),
  ],
);

