import 'package:floating_bottle/pages/mailbox_page/delete_letter.dart';
import 'package:floating_bottle/pages/mailbox_page/report.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../write_letter.dart';
import 'mailbox.dart';

class LetterContent extends StatefulWidget {
  const LetterContent(
      {Key? key,
      required this.name,
      required this.picture,
      required this.content})
      : super(key: key);
  final String name;
  final String picture;
  final String content;

  @override
  State<LetterContent> createState() => _LetterContentState();
}

class _LetterContentState extends State<LetterContent> {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assetsfolder/personal_background.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15.w, right: 20.w, top: 50.h),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) {
                    //       return MailBoxPage();
                    //     },
                    //   ),
                    // );
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_rounded,
                    size: 35.sp,
                    color: Colors.blueGrey,
                  ),
                ),
                Text(
                  "  ${widget.name}",
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 32.sp,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Bellota-Regular',
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 100.h, left: 40.w),
            child: Row(
              children: [
                ClipOval(
                  child: Image.asset(
                    "${widget.picture}",
                    width: 60.w,
                    height: 55.h,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  "  ${widget.name}  ",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 30.sp,
                    color: Colors.black,
                    fontFamily: 'Bellota-Regular',
                  ),
                ),
                InkWell(
                  child: Icon(
                    Icons.delete,
                    size: 35.sp,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return DeleteLetter(
                            name: '${widget.name}',
                            picture: '${widget.picture}',
                            content: '${widget.content}',
                          );
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Container(
              height: 420.h,
              width: 550.w,
              margin: EdgeInsets.only(top: 165.h, left: 40.w, right: 40.w),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(15)),
              child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  removeBottom: true,
                  child: ListView(
                    children: [
                      Text(
                        "${widget.content}",
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: 'Bellota-Regular',
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ))),
          Container(
              margin: EdgeInsets.only(top: 620.h, left: 60.w),
              child: SizedBox(
                width: 95.w,
                height: 43.h,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)))),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return WriteLetter();
                        },
                      ),
                    );
                  },
                  child: Text(
                    "Reply",
                    style: TextStyle(
                        fontSize: 22.sp,
                        color: Colors.black,
                        fontFamily: 'Bellota-Regular'),
                  ),
                ),
              )),
          Container(
              margin: EdgeInsets.only(top: 620.h, left: 210.w),
              child: SizedBox(
                width: 100.w,
                height: 43.h,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)))),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const Report();
                        },
                      ),
                    );
                  },
                  child: Text(
                    "Report",
                    style: TextStyle(
                        fontSize: 22.sp,
                        color: Colors.white,
                        fontFamily: 'Bellota-Regular'),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
