import 'package:floating_bottle/pages/contact_page/contact_history.dart';
import 'package:go_router/go_router.dart';
import 'contact.dart';

final c_route = GoRoute(
    path: "/contact",
    builder: (context, state) => ContactPage(),
    routes: [
      GoRoute(
          path: "history", builder: (context, state) => ContactHistory()),
    ]);
