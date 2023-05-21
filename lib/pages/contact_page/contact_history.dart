import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../mailbox_page/friend.dart';
import '../mailbox_page/letter.dart';
import '../mailbox_page/user.dart';
import '../theme/theme_bloc.dart';

class ContactHistory extends StatelessWidget {
  ContactHistory({super.key});

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
      "assetsfolder/avatar.jpg",
      "Me",
      Letter("Me", "assetsfolder/avatar.jpg",
          "Hey, Ann. I'm really sorry for what you told me. I"),
      "2023/5/19",
      "20:45",
    ),
    User(
      "assetsfolder/friend1.jpg",
      "Ann",
      Letter("Ann", "assetsfolder/friend1.jpg",
          "Hi, I got something that I've been thinking for a long time to tell u."),
      "2023/5/19",
      "20:45",
    ),
    User(
      "assetsfolder/avatar.jpg",
      "Me",
      Letter("Me", "assetsfolder/avatar.jpg",
          "Happy Wednesday! I hope this email finds you"),
      "2023/5/19",
      "20:45",
    ),
  ]);

  @override
  Widget build(BuildContext context) {
    ThemeCubit themeCubit = context.read();
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
                    color: Color.fromARGB(255, 98, 132, 179),
                    size: 35.sp,
                  ),
                ),
                Text(' Contact',
                    style: TextStyle(
                        color: Color.fromARGB(255, 101, 142, 200),
                        fontFamily: 'Abril Fatface',
                        fontSize: 28.sp))
              ],
            ),
            _introduction(context),
            Expanded(child: _listView(context))
          ],
        ))
      ]),
      floatingActionButton: _floatButton(context, themeCubit),
    );
  }

  Widget _introduction(BuildContext context) {
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
                friend.friends[0].picture,
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
                  '${friend.friends[0].name}',
                  style: TextStyle(
                      fontSize: 24.sp,
                      fontFamily: 'Bellota-Regular',
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'Cooking, Reading, Pet',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Color.fromARGB(255, 138, 138, 138),
                    fontFamily: 'Bellota-Regular',
                  ),
                )
              ],
            )
          ],
        ));
  }

  Widget _listView(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                for (var f in friend.friends)
                  Container(
                      decoration:
                          BoxDecoration(color: Colors.white.withOpacity(0.5)),
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
                            padding: EdgeInsets.only(left: 20.w),
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
                                          f.name,
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
                                            f.date,
                                            style: TextStyle(
                                              fontSize: 10.sp,
                                              fontFamily: 'Bellota-Regular',
                                              color: Colors.black,
                                            ),
                                          ),
                                          Text(
                                            '  ${f.time}',
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
                                            f.letter.content,
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
              border: Border.all(color: Color.fromARGB(255, 234, 231, 223)),
              borderRadius: BorderRadius.circular(2000)),
          child: Icon(Icons.add, size: 48.sp, color: Colors.black),
        ));
  }
}
