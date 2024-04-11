import 'package:floating_bottle/api/match/models/matched_user_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactDetailPage extends StatefulWidget {
  const ContactDetailPage({super.key, required this.user});
  final MatchedUserInfo user;

  @override
  State<ContactDetailPage> createState() => _ContactDetailPageState();
}

class _ContactDetailPageState extends State<ContactDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          SafeArea(
              child: Column(
            children: [
              Row(children: [
                Padding(padding: EdgeInsets.only(left: 15.w)),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                    color: const Color.fromARGB(255, 59, 138, 178),
                    size: 35.sp,
                  ),
                ),
              ]),
              _avatarBar(context),
              _genderBar(context),
              _interestsBar(context),
              _personalitiesBar(context),
            ],
          ))
        ],
      ),
    );
  }

  Widget _avatarBar(BuildContext context) {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
    ClipOval(
      child: Image.asset(
        "assetsfolder/bottle.png",
        width: 120.w,
        height: 120.h,
        fit: BoxFit.cover,
      ),
    ),
    Text(
      widget.user.name,
      style: TextStyle(
          color: Colors.black,
          fontSize: 40.sp,
          fontFamily: 'Bellota-Regular',
          fontWeight: FontWeight.bold),
    ),
    Text(
      widget.user.college ?? 'National Chengchi University',
      style: TextStyle(
          color: const Color.fromARGB(255, 146, 145, 145),
          fontSize: 15.sp,
          fontFamily: 'Bellota-Regular',
          fontWeight: FontWeight.bold),
    ),
          ],
        );
  }

  Widget _genderBar(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.only(top: 30.0),
      width: MediaQuery.of(context).size.width,
      height: 80.h,
      child: Row(
        children: [
          Container(
              width: MediaQuery.of(context).size.width * 0.33,
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
              child: Row(
                children: [
                  widget.user.sex == 'Woman'
                      ? const Icon(
                          Icons.female,
                          size: 40,
                        )
                      : const Icon(
                          Icons.male,
                          size: 40,
                        ),
                  Text(
                    widget.user.sex!,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.sp,
                        fontFamily: 'Bellota-Regular',
                        fontWeight: FontWeight.bold),
                  )
                ],
              )),
          Container(
              width: MediaQuery.of(context).size.width * 0.33,
              decoration: const BoxDecoration(
                border: Border(
                    top: BorderSide(color: Colors.black),
                    bottom: BorderSide(color: Colors.black)),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.home_outlined,
                    size: 40,
                  ),
                  Text(
                    widget.user.city!,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.sp,
                        fontFamily: 'Bellota-Regular',
                        fontWeight: FontWeight.bold),
                  )
                ],
              )),
          Container(
              width: MediaQuery.of(context).size.width * 0.34,
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
              child: Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 10.w)),
                  const Icon(
                    Icons.contact_page_outlined,
                    size: 40,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    '${widget.user.age!}y',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.sp,
                        fontFamily: 'Bellota-Regular',
                        fontWeight: FontWeight.bold),
                  )
                ],
              ))
        ],
      ),
    );
  }

  Widget _interestsBar(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5.0),
      width: MediaQuery.of(context).size.width,
      height: 80.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "  I'm interested in ...",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.sp,
              fontFamily: 'Bellota-Regular',
            ),
          ),
          Container(
              padding: EdgeInsets.only(left: 10.w, top: 3.h, bottom: 2.h),
              width: MediaQuery.of(context).size.width,
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.loyalty_outlined,
                    size: 35,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  for (var i = 0; i < widget.user.interests!.length; i++)
                    i == widget.user.interests!.length - 1
                        ? Text(
                            widget.user.interests![i],
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.sp,
                                fontFamily: 'Bellota-Regular',
                                fontWeight: FontWeight.bold),
                          )
                        : Text(
                            '${widget.user.interests![i]}, ',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.sp,
                                fontFamily: 'Bellota-Regular',
                                fontWeight: FontWeight.bold),
                          )
                ],
              )),
        ],
      ),
    );
  }

  Widget _personalitiesBar(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5.0),
      width: MediaQuery.of(context).size.width,
      height: 80.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "  I'm ...",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.sp,
              fontFamily: 'Bellota-Regular',
            ),
          ),
          Container(
              padding: EdgeInsets.only(left: 10.w, top: 3.h, bottom: 2.h),
              width: MediaQuery.of(context).size.width,
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(Icons.auto_stories_outlined, size: 35),
                  const SizedBox(
                    width: 10,
                  ),
                  for (var i = 0; i < widget.user.personalities!.length; i++)
                    i == widget.user.personalities!.length - 1
                        ? Text(
                            widget.user.personalities![i],
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.sp,
                                fontFamily: 'Bellota-Regular',
                                fontWeight: FontWeight.bold),
                          )
                        : Text(
                            '${widget.user.personalities![i]}, ',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.sp,
                                fontFamily: 'Bellota-Regular',
                                fontWeight: FontWeight.bold),
                          )
                ],
              )),
        ],
      ),
    );
  }
}
