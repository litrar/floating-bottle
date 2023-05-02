import 'package:go_router/go_router.dart';
import 'match.dart';

final match_route = GoRoute(
    path: "/match",
    builder: (context, state) => MatchPage(),
    routes: [
      ]
);