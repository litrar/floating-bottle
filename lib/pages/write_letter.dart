import 'dart:io';
import 'package:floating_bottle/api/match.dart';
import 'package:floating_bottle/pages/recreatable.dart';
import 'package:floating_bottle/pages/subpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../api/letter.dart';
import 'components/bottom_bar.dart';

class WriteLetter extends StatefulWidget {
  WriteLetter(
      {Key? key,
      required this.matcherId,
      this.matchedAccountId,
      this.time,
      this.name})
      : super(key: key);
  @override
  State<StatefulWidget> createState() => _WriteLetterState();
  int matcherId;
  int? matchedAccountId;
  DateTime? time;
  String? name;
}

class _WriteLetterState extends State<WriteLetter> {
  XFile? image;
  final ImagePicker picker = ImagePicker();
  final myController = TextEditingController();
  String button = 'Bottle It';
  String text = '';

  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    myController.addListener(_printLatestValue);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    myController.dispose();
    super.dispose();
  }

  void _printLatestValue() {
    print('Second text field: ${myController.text}');
  }

  @override
  Widget build(BuildContext context) {
    LetterApi letterApi = context.read();
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
              Text(widget.name!,
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

  // Future getImage(ImageSource media) async {
  //   var img = await picker.pickImage(source: media);

  //   setState(() {
  //     image = img;
  //   });
  // }

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
                  'assetsfolder/bottle.png',
                  width: 50.w,
                  height: 50.h,
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                widget.name!,
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
            // IconButton(
            //   onPressed: () async {},
            //   icon: Icon(
            //     Icons.attach_file,
            //     size: 35.sp,
            //   ),
            // ),
            IconButton(
              onPressed: () async {
                XFile? x = await picker.pickImage(source: ImageSource.gallery);
                if (x == null) return;
                setState(() {
                  image = x;
                });
              },
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
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 10.h),
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: TextFormField(
            // initialValue: text,
            controller: myController,
            keyboardType: TextInputType.multiline,
            maxLines: 22,
            decoration: InputDecoration(
              prefix: image != null
                  ? Padding(
                      padding: EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.file(
                          //to show image, you type like this.
                          File(image!.path),
                          fit: BoxFit.cover,
                          width: 50.w,
                          height: 50.w,
                        ),
                      ),
                    )
                  : null,
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
        ),
      ],
    );
  }

  Widget _bottleItButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 30.0),
      child: Material(
        color: Colors.white.withOpacity(0.0),
        child: InkWell(
          onTap: () async {
            MatchApi matchApi = context.read<MatchApi>();
            String imagePath = "";
            if (image != null) {
              imagePath = image!.path;
            }
            if (await matchApi.insertUserPair(
                widget.matcherId, widget.matchedAccountId!)) {
              var letterApi = context.read<LetterApi>();
              var result = await letterApi.sendLetter(LetterSent(
                  image: imagePath,
                  matcherId: widget.matcherId,
                  matchedAccountId: widget.matchedAccountId!,
                  topic: myController.text.split("\n")[0],
                  content: myController.text,
                  time: widget.time!));
              print('$result成功了沒');
            }

            Get.toNamed('${SubPage.CONTACT.route.name}',
                arguments: BottomBar.userId);
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
          onTap: () {
            text = myController.text;
            print(widget.matcherId);
            print(widget.matchedAccountId);
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
