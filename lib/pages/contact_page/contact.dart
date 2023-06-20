import 'package:cached_network_image/cached_network_image.dart';
import 'package:floating_bottle/api/contact.dart';
import 'package:floating_bottle/api/match/models/matched_user_info.dart';
import 'package:floating_bottle/pages/subpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../api/http_response.dart';
import '../../api/match.dart';
import '../components/bottom_bar.dart';
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
  List<MatchedUserInfo> friendInfoList = [];
  List<MatchedUserInfo> pendingInfoList = [];

  Future<void> getData(BuildContext context) async {
    ContactApi contactApi = context.read();
    MatchApi matchApi = context.read();
    var res_f = await contactApi.getFriends(userId);
    var res_p = await contactApi.getPendings(userId);
    if (res_f.isSuccess) friendIdList = res_f.data;
    if (res_p.isSuccess) pendingIdList = res_p.data;
    for (int m in friendIdList!) {
      HttpRes<MatchedUserInfo> userRes = await matchApi.showUserById(m);
      friendInfo = userRes.data;
      if (friendInfo != null) {
        friendInfoList.add(friendInfo!);
      }
    }
    for (int m in pendingIdList!) {
      HttpRes<MatchedUserInfo> userRes = await matchApi.showUserById(m);
      pendingInfo = userRes.data;
      if (pendingInfo != null) {
        pendingInfoList.add(pendingInfo!);
      }
    }
  }

  Widget build(BuildContext context) {
    return FutureBuilder<void>(
        future: getData(context),
        builder: (context, state) {
          if (!(state.connectionState == ConnectionState.done))
            return Scaffold(
              body: Center(
                  child: Text(
                'Please wait a second',
                style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Bellota-Regular',
                    fontWeight: FontWeight.bold),
              )),
            );
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
                          indicatorColor:
                              const Color.fromARGB(255, 122, 161, 216),
                          indicatorSize: TabBarIndicatorSize.label,
                        ),
                      ),
                    ),
                    body: TabBarView(
                      children: [
                        Column(
                          children: [
                            Padding(padding: EdgeInsets.only(top: 10.h)),
                            Expanded(child: _listView(context, friendInfoList)),
                          ],
                        ),
                        Column(
                          children: [
                            Padding(padding: EdgeInsets.only(top: 10.h)),
                            Expanded(
                                child: _listView(context, pendingInfoList)),
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
                      CircleAvatar(
                        radius: 25.w,
                        backgroundColor: Colors.grey,
                        backgroundImage: AssetImage("assetsfolder/bottle.png"),
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
