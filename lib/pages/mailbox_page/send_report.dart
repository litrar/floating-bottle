import 'package:floating_bottle/pages/mailbox_page/mailbox.dart';
import 'package:floating_bottle/pages/mailbox_page/report.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SendReport extends StatefulWidget {
  const SendReport({Key? key}) : super(key: key);

  @override
  State<SendReport> createState() => _SendReportState();
}

class _SendReportState extends State<SendReport> {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          const Report(),
          Container(
            margin: const EdgeInsets.all(0),
            color: Colors.white60,
          ),
          Container(
            margin: EdgeInsets.only(
                top: 340.h, left: 85.w, right: 70.w, bottom: 270.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.black54,
            ),
            child: SizedBox(
              width: 200.w,
              height: 50.h,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)))),
                onPressed: () {
                  int count = 0;
                  Navigator.of(context).popUntil((_) => count++ > 2);
                  // MaterialPageRoute(
                  //   builder: (context) {
                  //     return MailBoxPage();
                  //   },
                  // );
                },
                child: Text(
                  "Report",
                  style: TextStyle(
                      fontSize: 22.sp,
                      color: Colors.white,
                      fontFamily: 'Bellota-Regular'),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
