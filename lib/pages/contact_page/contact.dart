import 'package:floating_bottle/pages/subpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../components/bottom_bar.dart';
import '../mailbox_page/friend.dart';
import '../mailbox_page/letter.dart';
import '../mailbox_page/user.dart';
import '../theme/color_theme.dart';
import '../theme/theme_bloc.dart';
import 'c_route.dart';

class ContactSubPage implements SubPage {
  ContactSubPage();

  @override
  Widget getIcon(bool active) {
    return active
        ? Image.asset("assetsfolder/address book-black.png",
            cacheHeight: 50, cacheWidth: 50)
        : Image.asset("assetsfolder/address_book-white-removebg-preview.png",
            cacheHeight: 50, cacheWidth: 50);
  }

  @override
  GoRoute get route => c_route;
}

class ContactPage extends StatefulWidget {
  ContactPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage>
    with SingleTickerProviderStateMixin {
      

  final Friend friend = Friend([
    User(
      "assetsfolder/friend1.jpg",
      "Ann",
      Letter("Ann", "assetsfolder/friend1.jpg",
          "It was great to hear from you. I'm writing to you..."),
      "2023/5/19",
      "20:45",
    ),
    User(
      "assetsfolder/friend2.jpg",
      "Pink",
      Letter("Pink", "assetsfolder/friend2.jpg",
          "It was great to hear from you. I'm writing to you..."),
      "2023/5/19",
      "20:45",
    ),
    User(
      "assetsfolder/friend3.jpg",
      "HiChew",
      Letter("HiChew", "assetsfolder/friend3.jpg",
          "It was great to hear from you. I'm writing to you..."),
      "2023/5/19",
      "20:45",
    ),
    User(
      "assetsfolder/friend4.jpg",
      "Charles",
      Letter("Charles", "assetsfolder/friend4.jpg",
          "It was great to hear from you. I'm writing to you..."),
      "2023/5/19",
      "20:45",
    ),
  ]);

  late TabController _controller;

  final List<Tab> topTabs = <Tab>[
    const Tab(
      text: 'FRIENDS',
    ),
    new Tab(text: 'PENDING'),
  ];

  void initState() {
    super.initState();
    _controller = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
              children: [
                Center(child: _tabBar(context)),
                Padding(padding: EdgeInsets.only(top: 10.h)),
                
                Expanded(child: _listView(context)),
              ],
            ))
          ],
        ),
      );
    });
  }

  Widget _tabBar(BuildContext context) {
    return TabBar(
      controller: _controller,
      tabs: topTabs,
      labelStyle: TextStyle(
          fontSize: 20.sp,
          fontFamily: 'Abril Fatface',
          fontWeight: FontWeight.bold),
      isScrollable: true,
      unselectedLabelColor: Color.fromARGB(255, 175, 199, 232),
      labelColor: Color.fromARGB(255, 118, 168, 239),
      indicatorColor: const Color.fromARGB(255, 122, 161, 216),
      indicatorSize: TabBarIndicatorSize.label,
    );
  }

  Widget _listView(BuildContext context) {
    return ListView(
      children: [
        for (var f in friend.friends)
          Container(
              decoration: BoxDecoration(color: Colors.white.withOpacity(0.5)),
              child: Material(
                color: Colors.white.withOpacity(0.0),
                child: InkWell(
                  onTap: () {
                    context.go('/contact/history');
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                        border: Border(
                      bottom: BorderSide(color: Colors.black),
                    )),
                    height: 60.h,
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(children: [
                      ClipOval(
                        child: Image.asset(
                          f.picture,
                          width: 50.w,
                          height: 50.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Text(
                        f.name,
                        style: TextStyle(
                            fontSize: 20.sp,
                            fontFamily: 'Bellota-Regular',
                            fontWeight: FontWeight.bold),
                      )
                    ]),
                  ),
                ),
              ))
      ],
    );
  }
}
