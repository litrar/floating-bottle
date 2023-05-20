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
      "assetsfolder/avatar.jpg",
      "Ann",
      Letter("Ann", "assetsfolder/avatar.jpg", "It was great to hear from you. I'm writing to you..."),
      "2023/5/19",
      "20:45",
    ),
    User(
      "assetsfolder/avatar.jpg",
      "Pink",
      Letter("Pink", "assetsfolder/avatar.jpg", "Happy Wednesday! I hope this email finds you..."),
      "2023/5/19",
      "20:45",
    ),
    User(
      "assetsfolder/avatar.jpg",
      "HiChew",
      Letter("HiChew", "assetsfolder/avatar.jpg", "Thank you for your last email. Sorry for the late..."),
      "2023/5/19",
      "20:45",
    ),
    User(
      "assetsfolder/avatar.jpg",
      "Emma Lin",
      Letter("Emma Lin", "assetsfolder/avatar.jpg", "April Fool's pranks are way too predictable. I'll..."),
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
                margin: EdgeInsets.only(top: 100,bottom: 200),
                child: Column(
                  children: [
                    Text(
                      'New Letters',
                      style: TextStyle(
                        fontSize: 30.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.blueGrey,
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
                margin: EdgeInsets.only(top: 105),
                child: ListView(
                  children: friend.friends.map((fp) {
                    return Container(
                      margin: EdgeInsets.only(top: 0,bottom: 0,right: 10,left: 10),
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
                                            fontWeight: FontWeight.w500,
                                            fontSize: 20,
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                Text("    ${fp.date}"),
                                                Text("  ${fp.time}")
                                              ],
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("  ${fp.letter.content}",style: TextStyle(
                                            color: Colors.grey.shade700
                                        ),)
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => LetterContent(name: "${fp.name}"),
                                ),
                              );
                            },
                          ),
                          Divider(
                            color: Colors.black,
                            thickness: 2,
                            indent: 0,
                            endIndent: 0,
                          ),
                        ],
                      ),
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


