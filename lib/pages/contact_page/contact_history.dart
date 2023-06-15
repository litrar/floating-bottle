import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../api/letter.dart';
import '../../api/match.dart';
import '../../api/match/models/matched_user_info.dart';
import '../mailbox_page/letter_content.dart';
import '../theme/theme_bloc.dart';

class ContactHistory extends StatelessWidget {
  ContactHistory({super.key, this.friendInfo, this.userId});
  int? userId;
  MatchedUserInfo? friendInfo;
  // final Friend friend = Friend([
  //   User(
  //     "assetsfolder/friend1.jpg",
  //     "Ann",
  //     Letter("Ann", "assetsfolder/friend1.jpg",
  //         "It was great to hear from you. I'm writing to you..."),
  //     "2023/5/19",
  //     "20:45",
  //   ),
  //   User(
  //     "assetsfolder/avatar.jpg",
  //     "Me",
  //     Letter("Me", "assetsfolder/avatar.jpg",
  //         "Hey, Ann. I'm really sorry for what you told me. I"),
  //     "2023/5/19",
  //     "20:45",
  //   ),
  //   User(
  //     "assetsfolder/friend1.jpg",
  //     "Ann",
  //     Letter("Ann", "assetsfolder/friend1.jpg",
  //         "Hi, I got something that I've been thinking for a long time to tell u."),
  //     "2023/5/19",
  //     "20:45",
  //   ),
  //   User(
  //     "assetsfolder/avatar.jpg",
  //     "Me",
  //     Letter("Me", "assetsfolder/avatar.jpg",
  //         "Happy Wednesday! I hope this email finds you"),
  //     "2023/5/19",
  //     "20:45",
  //   ),
  // ]);

  List<LetterGot>? letterList;

  Future<void> getData(BuildContext context) async {
    LetterApi letterApi = context.read();
    var res = await letterApi.getLetter(userId!, friendInfo!.id);
    if (res.isSuccess) letterList = res.data;
  }

  Future<String> getWriterName(BuildContext context, int writerId) async {
    MatchApi matchApi = context.read();
    var res = await matchApi.showUserById(writerId);
    if (res.isSuccess) {
      return res.data!.name;
    } else {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    ThemeCubit themeCubit = context.read();
    return FutureBuilder(
        future: getData(context),
        builder: (context, snapshot) {
          return Scaffold(
            body: Stack(children: [
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
                  Row(
                    children: [
                      Padding(padding: EdgeInsets.only(left: 15.w)),
                      IconButton(
                        onPressed: () {
                          context.go('/contact');
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_new,
                          color: const Color.fromARGB(255, 98, 132, 179),
                          size: 35.sp,
                        ),
                      ),
                      Text(' Contact',
                          style: TextStyle(
                              color: const Color.fromARGB(255, 101, 142, 200),
                              fontFamily: 'Abril Fatface',
                              fontSize: 28.sp))
                    ],
                  ),
                  _introduction(context, friendInfo!),
                  Expanded(child: _listView(context, letterList!))
                ],
              ))
            ]),
            floatingActionButton: _floatButton(context, themeCubit),
          );
        });
  }

  Widget _introduction(BuildContext context, MatchedUserInfo user) {
    return Container(
        decoration: const BoxDecoration(
            border: Border(
          bottom: BorderSide(color: Colors.black),
        )),
        height: 80.h,
        padding: EdgeInsets.symmetric(horizontal: 14.w),
        child: Row(
          children: [
            ClipOval(
              child: Image.asset(
                "assetsfolder/friend1.jpg",
                width: 60.w,
                height: 60.h,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.name,
                  style: TextStyle(
                      fontSize: 24.sp,
                      fontFamily: 'Bellota-Regular',
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  user.interests!.join(', '),
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: const Color.fromARGB(255, 138, 138, 138),
                    fontFamily: 'Bellota-Regular',
                  ),
                )
              ],
            )
          ],
        ));
  }

  Widget _listView(BuildContext context, List<LetterGot> letterList) {
      
      return CustomScrollView(
        slivers: [
          SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  for (var l in letterList)
                    Container(
                        decoration:
                            BoxDecoration(color: Colors.white.withOpacity(0.5)),
                        child: Material(
                          color: Colors.white.withOpacity(0.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => LetterContent(
                                    matcherId: userId!,
                                    matchedAccountId: l.matchedAccountId,
                                    name: l.matcherName,
                                    picture: "assetsfolder/friend1.jpg",
                                    content: l.content, 
                                    letterId: l.letterId, time: l.time,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              decoration: const BoxDecoration(
                                  border: Border(
                                bottom: BorderSide(color: Colors.black),
                              )),
                              height: 60.h,
                              padding: EdgeInsets.only(left: 20.w),
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
                                  width: 16.w,
                                ),
                                Column(
                                  
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        ConstrainedBox(
                                          constraints:
                                              BoxConstraints(minWidth: 45.w),
                                          child: Text(
                                            friendInfo!.name,
                                            style: TextStyle(
                                                fontSize: 20.sp,
                                                fontFamily: 'Bellota-Regular',
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 140.w,
                                            ),
                                            Text(
                                              DateFormat('yyyy/M/d').format(l.time),
                                              style: TextStyle(
                                                fontSize: 10.sp,
                                                fontFamily: 'Bellota-Regular',
                                                color: Colors.black,
                                              ),
                                            ),
                                            Text(
                                              DateFormat('H:mm').format(l.time),
                                              style: TextStyle(
                                                fontSize: 10.sp,
                                                fontFamily: 'Bellota-Regular',
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Flexible(
                                      child: SingleChildScrollView(
                                          child: Row(
                                        children: [
                                          LimitedBox(
                                            maxWidth: 265.w,
                                            child: Text(
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              l.content,
                                              style: TextStyle(
                                                  fontSize: 14.sp,
                                                  color: const Color.fromARGB(
                                                      255, 138, 138, 138),
                                                  fontFamily: 'Bellota-Regular',
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      )),
                                    )
                                  ],
                                ),
                              ]),
                            ),
                          ),
                        ))
                ],
              ))
        ],
      );
   
  }

  Widget _floatButton(BuildContext context, ThemeCubit themeCubit) {
    return InkWell(
        onTap: () {
          context.go("/contact/history/write");
        },
        child: Container(
          decoration: BoxDecoration(
              color: themeCubit.state.floatingButton,
              border:
                  Border.all(color: const Color.fromARGB(255, 234, 231, 223)),
              borderRadius: BorderRadius.circular(2000)),
          child: Icon(Icons.add, size: 48.sp, color: Colors.black),
        ));
  }
}
