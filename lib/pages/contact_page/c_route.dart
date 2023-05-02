import 'package:go_router/go_router.dart';
import 'contact.dart';

final c_route = GoRoute(
    path: "/contact",
    builder: (context, state) => ContactPage(),
    routes: const [
    ]
);