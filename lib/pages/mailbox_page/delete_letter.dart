import 'package:floating_bottle/pages/mailbox_page/letter_content.dart';
import 'package:floating_bottle/pages/mailbox_page/mailbox.dart';
import 'package:floating_bottle/pages/mailbox_page/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'friend.dart';
import 'letter.dart';

class DeleteLetter extends StatefulWidget {
  const DeleteLetter(
      {Key? key,
      required this.name,
      required this.picture,
      required this.content})
      : super(key: key);

  @override
  State<DeleteLetter> createState() => _DeleteLetterState();
  final String name;
  final String picture;
  final String content;
}

class _DeleteLetterState extends State<DeleteLetter> {
  Friend friend = Friend([
    User(
      "assetsfolder/friend1.jpg",
      "Ann",
      Letter("Ann", "assetsfolder/friend1.jpg",
          "It was great to hear from you. I hope this letter finds you well. I’m writing to you to catch up and let you know what’s been going on in my life. Since we last spoke, I’ve been keeping busy with work and personal projects. I’ve started a new job at a marketing agency, which has been both challenging and exciting. The team is great and I’m learning a lot every day. In my free time, I’ve been working on my photography skills and have even started a small business taking photos for local events and weddings. I’ve also been fortunate enough to do some traveling recently. Last month, I went on a trip to Japan and had an amazing time exploring the country and experiencing its culture. The food was incredible and the scenery was breathtaking. I can’t wait to plan my next adventure. How about you? What have you been up to lately? Best regards, Ann"),
      "2023/5/19",
      "20:45",
    ),
    User(
      "assetsfolder/friend2.jpg",
      "Pink",
      Letter("Pink", "assetsfolder/friend2.jpg",
          "Happy Wednesday! I hope this email finds you..."),
      "2023/5/19",
      "20:45",
    ),
    User(
      "assetsfolder/friend3.jpg",
      "HiChew",
      Letter("HiChew", "assetsfolder/friend3.jpg",
          "Thank you for your last email. Sorry for the..."),
      "2023/5/19",
      "20:45",
    ),
  ]);
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          LetterContent(
              name: "${widget.name}",
              picture: "${widget.picture}",
              content: "${widget.content}"),
          Container(
            margin: const EdgeInsets.all(0),
            color: Colors.white60,
          ),
          Container(
              margin: EdgeInsets.only(
                  top: 300.h, left: 70.w, right: 70.w, bottom: 270.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.black54,
              ),
              child: Container(
                padding: EdgeInsets.only(top: 10.h),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Are you sure to\ndelete this letter?",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp,
                            fontFamily: 'Bellota-Regular',
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.white,
                      thickness: 1.5.h,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 11.w, top: 8.h),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 95.w,
                            height: 40.h,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.red),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)))),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return MailBoxPage(friend);
                                    },
                                  ),
                                );
                              },
                              child: Text(
                                "Yes",
                                style: TextStyle(
                                    fontSize: 22.sp,
                                    color: Colors.white,
                                    fontFamily: 'Bellota-Regular'),
                              ),
                            ),
                          ),
                          VerticalDivider(
                            color: Colors.white,
                            width: 7.w,
                          ),
                          SizedBox(
                            width: 95.w,
                            height: 40.h,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.white),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)))),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                "No",
                                style: TextStyle(
                                    fontSize: 22.sp,
                                    color: Colors.black,
                                    fontFamily: 'Bellota-Regular'),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
