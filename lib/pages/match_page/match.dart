import 'package:floating_bottle/pages/subpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../components/bottom_bar.dart';
import '../theme/color_theme.dart';
import '../theme/theme_bloc.dart';
import 'match_route.dart';


class MatchSubPage implements SubPage {
  
  MatchSubPage();
  @override
  Widget getIcon(bool active) {
    return active
        ? Image.asset("assetsfolder/match.jpg",
            cacheHeight: 50, cacheWidth: 50)
        : Image.asset("assetsfolder/match.jpg",
            cacheHeight: 50, cacheWidth: 50);
  }

  @override
  GoRoute get route => match_route;
}

class MatchPage extends StatelessWidget {
  const MatchPage({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ColorTheme>(builder: (context, state) {
      return Scaffold(
        bottomNavigationBar: BottomBar(SubPage.CONTACT),
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assetsfolder/personal_background.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text('this is match page', style: TextStyle(fontSize: 20.sp),)
          ],
        ),
      );
    });
  }
}
