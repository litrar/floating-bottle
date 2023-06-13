import 'package:floating_bottle/api/contact.dart';
import 'package:floating_bottle/api/match/models/matched_user_info.dart';
import 'package:floating_bottle/pages/subpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import '../../api/http_response.dart';
import '../../api/match.dart';
import '../components/bottom_bar.dart';
import '../mailbox_page/friend.dart';
import '../mailbox_page/letter.dart';
import '../mailbox_page/user.dart';
import '../theme/color_theme.dart';
import '../theme/theme_bloc.dart';
import 'c_route.dart';
import 'contact_history.dart';

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
  GetPage get route => c_route;
}

class ContactPage extends StatefulWidget {
  ContactPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage>
    with SingleTickerProviderStateMixin {
  int userId = Get.arguments;
  // final Friend friend = Friend([
  //   User(
  //     "assetsfolder/friend1.jpg",
  //     "Ann",
  //     Letter("Ann", "assetsfolder/friend1.jpg",
  //         "It was great to hear from you. I'm writing to you..."),
  //     "2023/5/19",
  //     "20:45",
  //   ),

    // User(
    //   "assetsfolder/friend3.jpg",
    //   "HiChew",
    //   Letter("HiChew", "assetsfolder/friend3.jpg",
    //       "It was great to hear from you. I'm writing to you..."),
    //   "2023/5/19",
    //   "20:45",
    // ),
    // User(
    //   "assetsfolder/friend4.jpg",
    //   "Charles",
    //   Letter("Charles", "assetsfolder/friend4.jpg",
    //       "It was great to hear from you. I'm writing to you..."),
    //   "2023/5/19",
    //   "20:45",
    // ),
  // ]);

  // final Friend pending = Friend([
  //   User(
  //     "assetsfolder/friend2.jpg",
  //     "Pink",
  //     Letter("Pink", "assetsfolder/friend2.jpg",
  //         "It was great to hear from you. I'm writing to you..."),
  //     "2023/5/19",
  //     "20:45",
  //   ),
  // ]);

  late TabController _controller;

  final List<Tab> topTabs = <Tab>[
    const Tab(
      text: 'FRIENDS',
    ),
    const Tab(text: 'PENDING'),
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

  List<int>? friendIdList;
  List<int>? pendingIdList;
  MatchedUserInfo? friendInfo;
  MatchedUserInfo? pendingInfo;
  List<MatchedUserInfo>? friendInfoList;
  List<MatchedUserInfo>? pendingInfoList;

  Future<void> getData(BuildContext context) async {
    ContactApi contactApi = context.read();
    MatchApi matchApi = context.read();
    var res_f = await contactApi.getFriends(userId);
    var res_p = await contactApi.getPendings(userId);
    if (res_f.isSuccess) friendIdList = res_f.data;
    if (res_p.isSuccess) friendIdList = res_p.data;
    for (int m in res_f.data!) {
      HttpRes<MatchedUserInfo> userRes = await matchApi.showUserById(m);
      friendInfo = userRes.data;
      if (friendInfo != null) {
        friendInfoList!.add(friendInfo!);
      }
    }
    for (int m in res_p.data!) {
      HttpRes<MatchedUserInfo> userRes = await matchApi.showUserById(m);
      pendingInfo = userRes.data;
      if (pendingInfo != null) {
        pendingInfoList!.add(pendingInfo!);
      }
    }
  }

  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: getData(context),
      builder: (context, state) {
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
                child: DefaultTabController(
              length: 2,
              child: Scaffold(
                backgroundColor: Colors.white.withOpacity(0.0),
                appBar: PreferredSize(
                  preferredSize: const Size.fromHeight(50.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: TabBar(
                      tabs: topTabs
                          .map(
                            (e) => e,
                          )
                          .toList(),
                      labelStyle: TextStyle(
                          fontSize: 20.sp,
                          fontFamily: 'Abril Fatface',
                          fontWeight: FontWeight.bold),
                      isScrollable: true,
                      unselectedLabelColor:
                          const Color.fromARGB(255, 175, 199, 232),
                      labelColor: const Color.fromARGB(255, 118, 168, 239),
                      indicatorColor: const Color.fromARGB(255, 122, 161, 216),
                      indicatorSize: TabBarIndicatorSize.label,
                    ),
                  ),
                ),
                body: TabBarView(
                  children: [
                    Column(
                      children: [
                        Padding(padding: EdgeInsets.only(top: 10.h)),
                        Expanded(child: _listView(context, friendInfoList!)),
                      ],
                    ),
                    Column(
                      children: [
                        Padding(padding: EdgeInsets.only(top: 10.h)),
                        Expanded(child: _listView(context, pendingInfoList!)),
                      ],
                    ),
                  ],
                ),
              ),
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
      unselectedLabelColor: const Color.fromARGB(255, 175, 199, 232),
      labelColor: const Color.fromARGB(255, 118, 168, 239),
      indicatorColor: const Color.fromARGB(255, 122, 161, 216),
      indicatorSize: TabBarIndicatorSize.label,
    );
  }

  Widget _listView(BuildContext context, List<MatchedUserInfo> users) {
    return ListView(
      children: [
        for (var u in users)
          Container(
              decoration: BoxDecoration(color: Colors.white.withOpacity(0.5)),
              child: Material(
                color: Colors.white.withOpacity(0.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ContactHistory(friendInfo: u, userId: userId);
                      },
                    ),
                  );
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
                          "assetsfolder/friend1.jpg",
                          width: 50.w,
                          height: 50.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Text(
                        u.name,
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
