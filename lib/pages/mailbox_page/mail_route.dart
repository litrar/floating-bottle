import 'package:go_router/go_router.dart';
import 'mailbox.dart';

final mail_route = GoRoute(
    path: "/mailbox", builder: (context, state) => MailBoxPage(), routes: []);
