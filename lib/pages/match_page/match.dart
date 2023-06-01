import 'package:floating_bottle/pages/match_page/random_match_result.dart';
import 'package:floating_bottle/pages/match_page/match_filter.dart';
import 'package:floating_bottle/pages/match_page/search_id.dart';
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
        ? Image.asset("assetsfolder/match.jpg", cacheHeight: 50, cacheWidth: 50)
        : Image.asset("assetsfolder/match.jpg",
            cacheHeight: 50, cacheWidth: 50);
  }

  @override
  GoRoute get route => match_route;
}

class MatchPage extends StatefulWidget {
  const MatchPage({Key? key}) : super(key: key);
  @override
  State<MatchPage> createState() => _MatchPageState();
}

class _MatchPageState extends State<MatchPage> {
  bool random = true;
  bool filter = true;
  bool searchID = true;
  bool cbutton = true;

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
            SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 70.h),
                  ),
                  _title(),
                  _randomButton(context),
                  _filterButton(context),
                  _searchIDButton(context),
                  _continueButton(context),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

  Container _title() {
    return Container(
      padding: EdgeInsets.only(left: 30.w),
      child: Text("I'm looking for...",
          style: TextStyle(
            color: const Color.fromARGB(255, 59, 138, 178),
            fontSize: 30.sp,
            fontFamily: 'Abril Fatface',
          )),
    );
  }

  Widget _randomButton(BuildContext context) {
    return InkWell(
        onTap: () {
          if (filter & searchID == true) {
            setState(() {
              random = false;
            });
          } else if (filter == false || searchID == false) {
            setState(() {
              random = false;
              filter = true;
              searchID = true;
            });
          }
        },
        child: Container(
          margin: EdgeInsets.only(top: 30.h, left: 40.w),
          height: 55.h,
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: random
              ? BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(35))
              : BoxDecoration(
                  color: const Color.fromARGB(255, 86, 140, 167),
                  borderRadius: BorderRadius.circular(35)),
          alignment: Alignment.center,
          child: Text("Random",
              style: random
                  ? const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )
                  : const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
        ));
  }

  Widget _filterButton(BuildContext context) {
    return InkWell(
        onTap: () {
          if (random & searchID == true) {
            setState(() {
              filter = false;
            });
          } else if (random == false || searchID == false) {
            setState(() {
              filter = false;
              random = true;
              searchID = true;
            });
          }
        },
        child: Container(
          margin: EdgeInsets.only(top: 30.h, left: 40.w),
          height: 55.h,
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: filter
              ? BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(35))
              : BoxDecoration(
                  color: const Color.fromARGB(255, 86, 140, 167),
                  borderRadius: BorderRadius.circular(35)),
          alignment: Alignment.center,
          child: Text("Filter",
              style: filter
                  ? const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )
                  : const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
        ));
  }

  Widget _searchIDButton(BuildContext context) {
    return InkWell(
        onTap: () {
          if (filter & random == true) {
            setState(() {
              searchID = false;
            });
          } else if (random == false || filter == false) {
            setState(() {
              searchID = false;
              random = true;
              filter = true;
            });
          }
        },
        child: Container(
          margin: EdgeInsets.only(top: 30.h, left: 40.w),
          height: 55.h,
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: searchID
              ? BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(35))
              : BoxDecoration(
                  color: Color.fromARGB(255, 86, 140, 167),
                  borderRadius: BorderRadius.circular(35)),
          alignment: Alignment.center,
          child: Text("Search ID",
              style: searchID
                  ? const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )
                  : const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
        ));
  }

  Widget _continueButton(BuildContext context) {
    return InkWell(
        onTap: () {
          if (random == false || filter == false || searchID == false) {
            setState(() {
              cbutton = !cbutton;
            });
            if (filter == false) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const MatchFilterPage();
                  },
                ),
              );
            } else if (searchID == false) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const SearchIDPage();
                  },
                ),
              );
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const DMatchResultPage();
                  },
                ),
              );
            }
          }
        },
        child: Container(
          margin: EdgeInsets.only(top: 90.h, left: 40.w),
          height: 55.h,
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: random && filter && searchID
              ? BoxDecoration(
                  color: Colors.white60,
                  borderRadius: BorderRadius.circular(35))
              : BoxDecoration(
                  color: Color.fromARGB(255, 86, 140, 167),
                  borderRadius: BorderRadius.circular(35)),
          alignment: Alignment.center,
          child: Text("Continue",
              style: random && filter && searchID
                  ? const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)
                  : const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
        ));
  }
}
