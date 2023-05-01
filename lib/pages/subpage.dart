import 'package:floating_bottle/pages/contact_page/contact.dart';
import 'package:floating_bottle/pages/personal_page/personal_page.dart';
import 'package:floating_bottle/pages/theme/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:floating_bottle/pages/mailbox_page/mailbox.dart';
import 'package:floating_bottle/pages/match_page/match.dart';
import '../components/bottom_bar.dart';

abstract class SubPage {
  static final SubPage CONTACT = ContactSubPage();
  static final SubPage MAILBOX = MailboxSubPage();
  static final SubPage MATCH = MatchSubPage();
  static final SubPage PERSONAL = PersonalSubPage();

  static final PAGES = [CONTACT, MAILBOX, MATCH, PERSONAL];

  //Widget buildPage(BuildContext buildContext);

  String get label;

  Widget getIcon(bool active);

  GoRoute get route;
}

class DevPage extends StatelessWidget {
  const DevPage(this.currentPage,{Key? key}) : super(key: key);

  final SubPage currentPage;

  @override
  Widget build(BuildContext context) {
    final theme = context.read<ThemeCubit>().state;
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(statusBarColor:  theme.floatingButton),
        backgroundColor: theme.floatingButton,
      ),
      body: Center(
        child: Image.asset("assetfolder/icon/開發中圖示.png"),
      ),
      bottomNavigationBar: BottomBar(currentPage),
    );
  }
}
