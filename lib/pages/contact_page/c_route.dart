import 'package:floating_bottle/pages/contact_page/contact_history.dart';
import 'package:go_router/go_router.dart';
import '../write_letter.dart';
import 'contact.dart';

final c_route = GoRoute(
    path: "/contact",
    builder: (context, state) => ContactPage(),
    routes: [
      GoRoute(
          path: "history",
          // path: "history/:user"
          builder: (context, state) => ContactHistory(),
          // builder: (context, state) => ContactHistory(state.params["user"] ?? ""),
        
          routes: [
            GoRoute(path:"write", builder: (context, state) => WriteLetter()),
            // GoRoute(path:"letter", builder: (context, state) => LetterContent()),
          ]),
    ]);
