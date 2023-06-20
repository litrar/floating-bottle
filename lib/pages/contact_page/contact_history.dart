import 'package:floating_bottle/pages/write_letter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../api/letter.dart';
import '../../api/match.dart';
import '../../api/match/models/matched_user_info.dart';
import '../mailbox_page/letter_content.dart';
import '../theme/theme_bloc.dart';

class ContactHistory extends StatefulWidget {
  ContactHistory({super.key, this.friendInfo, required this.userId, required this.pendingOrNot});
  int userId;
  MatchedUserInfo? friendInfo;
  bool pendingOrNot;

  @override
  State<ContactHistory> createState() => _ContactHistoryState();
}

class _ContactHistoryState extends State<ContactHistory> {
  List<LetterGot>? letterList;

  Future<void> getData(BuildContext context) async {
    LetterApi letterApi = context.read();
    var res = await letterApi.getLetter(widget.userId, widget.friendInfo!.id);
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
        builder: (context, state) {
          if (!(state.connectionState == ConnectionState.done))
            return const Scaffold(
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
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) {
                          //       return ContactPage();
                          //     },
                          //   ),
                          // );
                          Navigator.pop(context);
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
                  _introduction(context, widget.friendInfo!),
                  Expanded(child: _listView(context, letterList!))
                ],
              ))
            ]),
            floatingActionButton: _floatButton(context, themeCubit, widget.pendingOrNot),
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
                "assetsfolder/bottle.png",
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
                                  matcherId: widget.userId,
                                  matchedAccountId: l.matchedAccountId,
                                  name: l.matcherName,
                                  picture: "assetsfolder/bottle.png",
                                  content: l.content,
                                  letterId: l.letterId,
                                  time: l.time,
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
                                  "assetsfolder/bottle.png",
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
                                          widget.friendInfo!.name,
                                          style: TextStyle(
                                              fontSize: 20.sp,
                                              fontFamily: 'Bellota-Regular',
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 120.w,
                                          ),
                                          Text(
                                            DateFormat('yyyy/M/d')
                                                .format(l.time),
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

  Widget _floatButton(
      BuildContext context, ThemeCubit themeCubit, bool pedingOrNot) {
    return InkWell(
        onTap: () async {
          // context.go("/contact/history/write");
          // String userName = await getWriterName(context, widget.userId!);
          print('${widget.userId} before going to WriteLetter()');
          print('${widget.friendInfo!.id} before going to WriteLetter()');
          Future.microtask(() {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return WriteLetter(
                    matcherId: widget.userId,
                    matchedAccountId: widget.friendInfo!.id,
                    time: DateTime.now(),
                    name: widget.friendInfo!.name,
                    replyToPending: pedingOrNot,
                  );
                },
              ),
            );
          });
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
