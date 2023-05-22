import 'package:floating_bottle/pages/mailbox_page/friend.dart';
import 'package:floating_bottle/pages/mailbox_page/letter.dart';
import 'package:floating_bottle/pages/mailbox_page/user.dart';
import 'package:floating_bottle/pages/subpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../components/bottom_bar.dart';
import '../theme/color_theme.dart';
import '../theme/theme_bloc.dart';
import 'letter_content.dart';
import 'mail_route.dart';


class MailboxSubPage implements SubPage {
  MailboxSubPage();

  @override
  Widget getIcon(bool active) {
    return active
        ? Image.asset("assetsfolder/mailbox.jpg",
        cacheHeight: 50, cacheWidth: 50)
        : Image.asset("assetsfolder/mailbox.jpg",
        cacheHeight: 50, cacheWidth: 50);
  }

  @override
  GoRoute get route => mail_route;
}

class MailBoxPage extends StatelessWidget {
  MailBoxPage({Key? key}) : super(key: key);

  final Friend friend = Friend([
    User(
      "assetsfolder/friend1.jpg",
      "Ann",
      Letter("Ann", "assetsfolder/friend1.jpg", "It was great to hear from you. I'm writing to ..."),
      "2023/5/19",
      "20:45",
    ),
    User(
      "assetsfolder/friend2.jpg",
      "Pink",
      Letter("Pink", "assetsfolder/friend2.jpg", "Happy Wednesday! I hope this email finds you..."),
      "2023/5/19",
      "20:45",
    ),
    User(
      "assetsfolder/friend3.jpg",
      "HiChew",
      Letter("HiChew", "assetsfolder/friend3.jpg", "Thank you for your last email. Sorry for the..."),
      "2023/5/19",
      "20:45",
    ),
    User(
      "assetsfolder/friend4.jpg",
      "Emma Lin",
      Letter("Emma Lin", "assetsfolder/friend4.jpg", "April Fool's pranks are way too predictable. I'll..."),
      "2023/5/19",
      "20:45",
    ),
  ]);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ColorTheme>(
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
              Container(
                margin: EdgeInsets.only(top: 80.h),
                child: Column(
                  children: [
                    Text(
                      'New Letters',
                      style: TextStyle(
                        fontSize: 30.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.blueGrey,
                        fontFamily: 'Bellota-Regular',
                      ),
                    ),
                    Divider(
                      color: Colors.black,
                      endIndent: 0,
                      indent: 0,
                      thickness: 2.h,
                    ),
                  ],
                ),
              ),
              Container(
                width: 450.w,
                margin: EdgeInsets.only(top: 120.h,right: 1.w),
                child:
                CustomScrollView(
                  slivers: [
                    SliverFillRemaining(
                      child: Column(
                        children: [
                          for(var fp in friend.friends)
                            Container(
                              decoration: BoxDecoration(color: Colors.white.withOpacity(0.5)),
                              child: Material(
                                color: Colors.white.withOpacity(0.0),
                                child: InkWell(
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(color: Colors.black),
                                        )),
                                    height: 60.h,
                                    padding: EdgeInsets.only(left: 20.w),
                                    child: Row(
                                      children: [
                                        ClipOval(
                                          child: Image.asset(
                                            "${fp.picture}",
                                            width: 60.w,
                                            height: 55.h,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                ConstrainedBox(
                                                    constraints: BoxConstraints(minWidth: 45.w),
                                                child: Text(
                                                  "  ${fp.name}",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 20.sp,
                                                    fontFamily: 'Bellota-Regular',
                                                  ),
                                                ),),
                                                Row(
                                                  children: [
                                                    Text("    ${fp.date}",style: TextStyle(
                                                        fontFamily: 'Bellota-Regular',
                                                        fontWeight: FontWeight.w600),),
                                                    Text("  ${fp.time}",style: TextStyle(
                                                        fontFamily: 'Bellota-Regular',
                                                        fontWeight: FontWeight.w600
                                                    ),)
                                                  ],
                                                )
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
                                                          "   ${fp.letter.content}",
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
                                        )
                                      ],
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => LetterContent(name: "${fp.name}", picture: "${fp.picture}", content: "${fp.letter.content}",),
                                      ),
                                    );
                                    },
                                ),
                              ),
                            )
                        ],
                      ),
                    )
                  ],
                )
              )
            ],
          ),
        );
      },
    );
  }
}
