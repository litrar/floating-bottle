import 'package:floating_bottle/pages/personal_page/change_email_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../api/user/profile.dart';
import 'bloc/profile_cubit.dart';

class EditEmail extends StatefulWidget {
  const EditEmail({Key? key, required this.profile}) : super(key: key);
  final Profile profile;
  @override
  State<EditEmail> createState() => _EditEmailState();
}

class _EditEmailState extends State<EditEmail> {
  String _textFieldValue = '';
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => ProfileCubit(widget.profile),
        child: Builder(builder: (context) {
          return Scaffold(
              body: Stack(
            children: <Widget>[
              ChangeEmail(
                profile: widget.profile,
              ),
              Container(
                margin: const EdgeInsets.all(0),
                color: Colors.white60,
              ),
              BlocBuilder<ProfileCubit, Profile>(builder: (context, state) {
                return ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          top: 280.h, left: 70.w, right: 70.w, bottom: 340.h),
                      child: TextFormField(
                        onChanged: (value) {
                          // setState(() {
                          //   _textFieldValue = value;
                          // });
                          context.read().changeEmail(value);
                        },
                        keyboardType: TextInputType.multiline,
                        maxLines: 1,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ChangeEmail(
                                    profile: widget.profile,
                                  ),
                                ),
                              );
                            },
                            icon: Icon(
                              Icons.check,
                              size: 20.sp,
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.black54,
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.black,
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          hintText: '         New Email',
                          hintStyle: TextStyle(
                              color: Colors.white54,
                              fontFamily: 'Bellota-Regular',
                              fontSize: 20.sp),
                          isDense: true,
                        ),
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Bellota-Regular',
                            fontSize: 20.sp),
                      ),
                    ),
                  ],
                );
              })
            ],
          ));
        }));
  }
}
