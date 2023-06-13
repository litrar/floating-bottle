import 'package:floating_bottle/pages/contact_page/contact_detail.dart';
import 'package:floating_bottle/api/match/models/matched_user_info.dart';
import 'package:floating_bottle/pages/match_page/bloc/selected_people_cubit.dart';
import 'package:floating_bottle/pages/match_page/match.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../api/match.dart';
import '../write_letter.dart';

class MatchResultPage extends StatefulWidget {
  MatchResultPage({super.key, this.matchedUsers, this.userId});
  List<MatchedUserInfo>? matchedUsers;
  int? userId;
  @override
  State<MatchResultPage> createState() => _MatchResultPageState();
}

class _MatchResultPageState extends State<MatchResultPage> {
  List<MatchedUserInfo> users = [
    MatchedUserInfo(
        id: 1,
        avatar: 'assetsfolder/friend1.jpg',
        name: 'Ann',
        college: 'National Chengchi University',
        sex: 'Woman',
        city: 'Taipeisd',
        age: '20',
        personalities: ['Extroverted', 'Outgoing'],
        interests: ['Cooking', 'Movie', 'Pet'],
        isSelected: false),
    MatchedUserInfo(
        id: 2,
        avatar: 'assetsfolder/friend3.jpg',
        name: 'Hanns',
        college: 'National Chengchi University',
        sex: 'Man',
        city: 'Taipei',
        age: '19',
        personalities: ['Extroverted', 'Trustworthy'],
        interests: ['Cooking', 'Reading'],
        isSelected: false),
    MatchedUserInfo(
        id: 3,
        avatar: 'assetsfolder/friend2.jpg',
        name: 'Stella',
        college: 'National Chengchi University',
        sex: 'Woman',
        city: 'Taipei',
        age: '20',
        personalities: ['Outgoing', 'Reliable'],
        interests: ['Movie', 'Pet'],
        isSelected: false),
  ];
  bool cbutton = true;

  MatchedUserInfo? matcherInfo;
  Future<void> getProfile(BuildContext context) async {
    MatchApi userApi = context.read();
    var res = await userApi.showUserById(widget.userId!);
    print("hahaha ${res.data}");
    if (res.isSuccess) matcherInfo = res.data;
  }

  @override
  Widget build(BuildContext _context) {
    return BlocProvider(
      lazy: true,
      //跟後端說 filter一定要有match到人
      create: (_) => SelectedUsersCubit(widget.matchedUsers!),
      child: Builder(builder: (context) {
        return Scaffold(
          body: Stack(children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assetsfolder/match_background.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SafeArea(
                child: Column(
              children: [
                Row(
                  children: [
                    Padding(padding: EdgeInsets.only(left: 15.w)),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return MatchPage();
                            },
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                        size: 35.sp,
                      ),
                    ),
                  ],
                ),
                _title(context),
                SizedBox(
                  height: 30.h,
                ),
                BlocBuilder<SelectedUsersCubit, List<MatchedUserInfo>>(
                    builder: (context, state) {
                  return Column(children: [
                    for (var user in widget.matchedUsers!)
                      _matchedUser(context.read(), context, user)
                  ]);
                }),
                _continueButton(context),
              ],
            ))
          ]),
        );
      }),
    );
  }

  Container _title(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 60.w),
      margin: EdgeInsets.only(top: 30.h),
      child: Text("I find...",
          style: TextStyle(
            color: Colors.black,
            fontSize: 35.sp,
            fontFamily: 'Abril Fatface',
          )),
    );
  }

  Widget _matchedUser(
      SelectedUsersCubit cubit, BuildContext context, MatchedUserInfo user) {
    return Container(
      margin: EdgeInsets.only(top: 20.h),
      height: 60.h,
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: user.isSelected
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              color: const Color.fromARGB(255, 86, 140, 167),
              border: Border.all(color: Colors.black))
          : BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              color: Colors.white,
              border: Border.all(color: Colors.black)),
      child: Material(
        color: Colors.white.withOpacity(0.0),
        child: InkWell(
          onTap: () {
            print(user.isSelected);
            cubit.set_selected(user.id, !user.isSelected);
            //下面的user應該是widget build裡面的users的，無法更動的isSelected = false;
            print(user.isSelected);
            if (user.isSelected == true) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ContactDetailPage(user: user),
                ),
              );
            }
          },
          child: Container(
            padding: EdgeInsets.only(left: 20.w),
            child: Row(children: [
              ClipOval(
                child: Image.asset(
                  user.avatar!,
                  width: 50.w,
                  height: 50.h,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: 20.w,
              ),
              Text(
                user.name,
                style: user.isSelected
                    ? TextStyle(
                        color: Colors.white,
                        fontSize: 26.sp,
                        fontFamily: 'Bellota-Regular',
                        fontWeight: FontWeight.bold)
                    : TextStyle(
                        color: Colors.black,
                        fontSize: 26.sp,
                        fontFamily: 'Bellota-Regular',
                        fontWeight: FontWeight.bold),
              )
            ]),
          ),
        ),
      ),
    );
  }

  Widget _continueButton(BuildContext context) {
    return FutureBuilder(
        future: getProfile(context),
        builder: (context, snapshot) {
          return BlocBuilder<SelectedUsersCubit, List<MatchedUserInfo>>(
              builder: (context, state) {
            SelectedUsersCubit cubit = context.read();
            MatchedUserInfo? selected = cubit.getSelect();
            MatchApi matchApi = context.read();

            return InkWell(
                onTap: () async {
                  if (selected != null) {
                    if (await matchApi.insertUserPair(
                        widget.userId!, selected.id)) {
                      Future.microtask(() {
                        Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return WriteLetter(
                                matcherId: widget.userId!,
                                matchedAccountId: selected.id,
                                time: DateTime.now(),
                                name: matcherInfo!.name);
                          },
                        ),
                      );

                      });
                      
                    }
                  }
                },
                child: Container(
                  margin: EdgeInsets.only(
                    top: 90.h,
                  ),
                  height: 55.h,
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: !(selected == null)
                      // selected?.isSelected ?? false
                      ? BoxDecoration(
                          color: const Color.fromARGB(255, 86, 140, 167),
                          borderRadius: BorderRadius.circular(35))
                      : BoxDecoration(
                          color: const Color.fromARGB(255, 152, 169, 189),
                          borderRadius: BorderRadius.circular(35)),
                  alignment: Alignment.center,
                  child: const Text("Send a letter",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                ));
          });
        });
  }
}
