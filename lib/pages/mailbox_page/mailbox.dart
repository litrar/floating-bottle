import 'package:dio/dio.dart';
import 'package:floating_bottle/pages/mailbox_page/friend.dart';
import 'package:floating_bottle/pages/mailbox_page/user.dart';
import 'package:floating_bottle/pages/subpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../api/letter.dart';
import '../../api/match.dart';
import '../components/bottom_bar.dart';
import '../theme/color_theme.dart';
import '../theme/theme_bloc.dart';
import 'letter.dart';
import 'letter_content.dart';
import 'mail_route.dart';


class MailboxSubPage implements SubPage {
  MailboxSubPage();

  @override
  Widget getIcon(bool active) {
    return active
        ? Image.asset("assetsfolder/mail_black-removebg-preview.png",
            cacheHeight: 50, cacheWidth: 50)
        : Image.asset("assetsfolder/mail_white-removebg-preview.png",
            cacheHeight: 50, cacheWidth: 50);
  }

  @override
  GetPage get route => mail_route;
}

class MailBoxPage extends StatefulWidget {
  MailBoxPage(this.friend, {Key? key}) : super(key: key);
  int userId = Get.arguments;
  final Friend friend;

  _MailBoxPageState createState() => _MailBoxPageState();

}
class _MailBoxPageState extends State<MailBoxPage> {
  late final Dio _dio;
  late final MatchApi _matchApi;
  late final LetterApi _letterApi;
  List<LetterGot> letters = [];

  // get index => letters.length;

  void initState() {
    super.initState();
    _dio = Dio();
    _matchApi = MatchApi(_dio);
    _letterApi = LetterApi(_dio);
    fetchNewLetters();
  }

  void removeLetter(User letter) {
    setState(() {
      widget.friend.friends.remove(letter);
    });
  }

  Future<void> fetchNewLetters() async {
    try {
      for (int index = 0; index < letters.length; index++) {
        final response = await _letterApi.getLetter(
          letters[index].matcherId,
          letters[index].matchedAccountId,
        );

        if (response.isSuccess) {
          final jsonData = response.data as List<dynamic>;
          setState(() {
            letters = jsonData
                .map((json) => LetterGot.fromJson(json as Map<String, dynamic>))
                .toList();
            final List<User> convertedLetters = letters.map((letter) =>
                User(
                  "assetsfolder/大頭照.jpg",
                  letter.matcherName,
                  Letter(
                    letter.matcherName,
                    "assetsfolder/大頭照.jpg",
                    letter.content,
                  ),
                  "",
                  letter.time,
                )).toList();
            widget.friend.friends.addAll(convertedLetters);
          });
        } else {
          throw Exception('Failed to fetch letters');
        }
      }
    } catch (e) {
      // Handle error
      print(e);
    }
  }


  // Future<void> fetchNewLetters() async {
  //   try {
  //     final response = await _letterApi.getLetter(
  //         letters[index].matcherId, letters[index].matchedAccountId);
  //     if (response.isSuccess) {
  //       final jsonData = response.data as List<dynamic>;
  //       setState(() {
  //         letters = jsonData
  //             .map((json) => LetterGot.fromJson(json as Map<String, dynamic>))
  //             .toList();
  //         final List<User> convertedLetters = letters.map((letter) =>
  //             User(
  //                 "assetsfolder/大頭照.jpg", letters[index].matcherName, Letter(letters[index].matcherName, "assetsfolder/大頭照.jpg", letter.content), "",
  //                 letters[index].time
  //             )).toList();
  //         widget.friend.friends.addAll(convertedLetters);
  //       });
  //     } else {
  //       throw Exception('Failed to fetch letters');
  //     }
  //   } catch (e) {
  //     // Handle error
  //     print(e);
  //   }
  // }


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
                  margin: EdgeInsets.only(top: 120.h, right: 1.w),
                  child: CustomScrollView(
                    slivers: [
                      SliverFillRemaining(
                        child: Column(
                          children: [
                            for (var fp in widget.friend.friends)
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.5)),
                                child: Material(
                                  color: Colors.white.withOpacity(0.0),
                                  child: InkWell(
                                    child: Container(
                                      decoration: const BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                                color: Colors.black),
                                          )),
                                      height: 60.h,
                                      padding: EdgeInsets.only(left: 20.w),
                                      child: Row(
                                        children: [
                                          ClipOval(
                                            child: Image.asset(
                                              "${fp.picture}",
                                              width: 40.w,
                                              height: 40.h,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 20.w),
                                            child: Text(
                                              "${fp.name}",
                                              style: TextStyle(
                                                fontSize: 20.sp,
                                                color: Colors.black,
                                                fontFamily: 'Bellota-Regular',
                                              ),
                                            ),
                                          ),
                                          Expanded(child: Container()),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                right: 20.w),
                                            child: Text(
                                              "${fp.time}",
                                              style: TextStyle(
                                                fontSize: 20.sp,
                                                color: Colors.black,
                                                fontFamily: 'Bellota-Regular',
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    onTap: () {
                                      int index = widget.friend.friends.indexOf(fp); // 获取fp在friends列表中的索引
                                      if (index >= 0 && index < letters.length) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => LetterContent(
                                              name: fp.name,
                                              picture: fp.picture,
                                              content: fp.letter.content,
                                              matcherId: letters[index].matcherId,
                                              matchedAccountId: letters[index].matchedAccountId,
                                              time: fp.time,
                                              letterId: letters[index].letterId,
                                            ),
                                          ),
                                        );
                                        removeLetter(fp);
                                      }
                                    },

                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        );
      },
    );
  }
}