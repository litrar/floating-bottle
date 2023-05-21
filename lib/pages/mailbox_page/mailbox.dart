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
                margin: EdgeInsets.only(top: 100),
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
                      thickness: 2,
                    ),
                  ],
                ),
              ),
              Container(
                width: 450,
                margin: EdgeInsets.only(top: 102,right: 1),
                child: ListView(
                  children: friend.friends.map((fp) {
                    return Container(
                      decoration: BoxDecoration(color: Colors.white.withOpacity(0.5)),
                        child: Container(
                          decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(color: Colors.black),
                              )),
                          height: 60.h,
                          padding: EdgeInsets.only(left: 20.w),
                          child: Expanded(
                            child: Column(
                              children: [
                                InkWell(
                                  child: Row(
                                    children: [
                                      ClipRRect(
                                          borderRadius: BorderRadius.circular(500),
                                          child: Image.asset("${fp.picture}",height: 70,width: 70,)
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                "  ${fp.name}",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 20,
                                                  fontFamily: 'Bellota-Regular',
                                                ),
                                              ),
                                              Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text("    ${fp.date}",style: TextStyle(
                                                          fontFamily: 'Bellota-Regular',
                                                          fontWeight: FontWeight.w600
                                                      ),),
                                                      Text("  ${fp.time}",style: TextStyle(
                                                          fontFamily: 'Bellota-Regular',
                                                          fontWeight: FontWeight.w600
                                                      ),)
                                                    ],
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text("  ${fp.letter.content}",style: TextStyle(
                                                color: Colors.grey.shade800,
                                                fontFamily: 'Bellota-Regular',
                                              ),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                softWrap: true,
                                              )
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => LetterContent(name: "${fp.name}", picture: "${fp.picture}", content: "${fp.letter.content}",),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        )
                    );
                  }).toList(),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
