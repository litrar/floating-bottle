import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class WriteLetter extends StatefulWidget {
  WriteLetter({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _WriteLetterState();
}

class _WriteLetterState extends State<WriteLetter> {
  String button = 'Bottle It';
  @override
  Widget build(BuildContext context) {
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
            Row(children: [
              Padding(padding: EdgeInsets.only(left: 15.w)),
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  color: const Color.fromARGB(255, 98, 132, 179),
                  size: 35.sp,
                ),
              ),
              Text(' Ann',
                  style: TextStyle(
                      color: const Color.fromARGB(255, 101, 142, 200),
                      fontFamily: 'Abril Fatface',
                      fontSize: 28.sp))
            ]),
            _avatar(context),
            _textField(context),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              _bottleItButton(context),
              _draftButton(context),
            ])
          ],
        ))
      ]),
    );
  }

  Widget _avatar(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15.h),
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        ConstrainedBox(
          constraints: BoxConstraints(minWidth: 50.w),
          child: Row(
            children: [
              ClipOval(
                child: Image.asset(
                  'assetsfolder/friend1.jpg',
                  width: 50.w,
                  height: 50.h,
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                '  Ann',
                style: TextStyle(
                    fontSize: 30.sp,
                    fontFamily: 'Bellota-Regular',
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Row(
          children: [
            // SizedBox(
            //   width: 100.w,
            // ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.attach_file,
                size: 35.sp,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.insert_photo,
                size: 35.sp,
              ),
            ),
          ],
        ),
      ]),
    );
  }

  Widget _textField(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.h),
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: TextFormField(
        keyboardType: TextInputType.multiline,
        maxLines: 25,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white.withOpacity(0.3),
          border: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.black,
              ),
              borderRadius: BorderRadius.circular(5)),
          hintText: 'Write Something',
          hintStyle: const TextStyle(
            color: Color.fromARGB(255, 138, 138, 138),
            fontFamily: 'Bellota-Regular',
          ),
          isDense: true,
        ),
      ),
    );
  }

  Widget _bottleItButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 30.0),
      child: Material(
        color: Colors.white.withOpacity(0.0),
        child: InkWell(
          onTap: () {
            context.go('/contact');
          },
          child: Container(
              height: 40.h,
              width: MediaQuery.of(context).size.width * 0.3,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 203, 217, 221),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Center(
                child: Text(
                  button,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 21.sp,
                      fontFamily: 'Bellota-Regular',
                      fontWeight: FontWeight.bold),
                ),
              )),
        ),
      ),
    );
  }

  Widget _draftButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 30.0),
      child: Material(
        color: Colors.white.withOpacity(0.0),
        child: InkWell(
          onTap: () {},
          child: Container(
              height: 40.h,
              width: MediaQuery.of(context).size.width * 0.3,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 203, 217, 221),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Center(
                child: Text(
                  'Draft',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 21.sp,
                      fontFamily: 'Bellota-Regular',
                      fontWeight: FontWeight.bold),
                ),
              )),
        ),
      ),
    );
  }
}
