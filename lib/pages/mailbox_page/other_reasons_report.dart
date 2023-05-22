import 'package:floating_bottle/pages/mailbox_page/report.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtherReasonsReport extends StatefulWidget {
  const OtherReasonsReport({Key? key}) : super(key: key);

  @override
  State<OtherReasonsReport> createState() => _OtherReasonsReportState();
}
class _OtherReasonsReportState extends State<OtherReasonsReport> {
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
        margin: EdgeInsets.only(top: 200.h),
        padding: EdgeInsets.symmetric(horizontal: 50.w),
        child:
            TextFormField(
              keyboardType: TextInputType.multiline,
              maxLines: 13,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(10)),
                hintText: 'Reasons：',
                hintStyle: const TextStyle(
                  color: Color.fromARGB(255, 138, 138, 138),
                  fontFamily: 'Bellota-Regular',
                ),
                isDense: true,
              ),
            ),
      ),
          Container(
            margin: EdgeInsets.only(top: 440.h,left: 80.w),
            child: SizedBox(
              width: 200.w,
              height: 50.h,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                    )
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Report", style: TextStyle(
                    fontSize: 22.sp,color: Colors.white,fontFamily: 'Bellota-Regular'
                ),),
              ),
            ),
          )
        ],
      ),
    );
  }
}