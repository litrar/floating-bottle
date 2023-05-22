import 'package:floating_bottle/pages/authentication/language.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'language_level_result.dart';

class LanguageLevel extends StatefulWidget {
  const LanguageLevel({Key? key,required this.item}) : super(key: key);
  final String item;

  @override
  _LanguageLevelState createState() => _LanguageLevelState();
}
class _LanguageLevelState extends State<LanguageLevel> {
  Widget build(BuildContext context){
    widget.item;
    return Scaffold(
        body: Stack(
            children: <Widget>[
              LanguageLevelResult(level: '', item: "${widget.item}"),
              Container(
                margin: const EdgeInsets.all(0),
                color: Colors.white60,
              ),
              // for(var l in language)
              Container(
                  margin: EdgeInsets.only(top: 250.h,left: 70.w,right: 70.w,bottom: 205.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black54,
                  ),
                  child: Container(
                    margin: EdgeInsets.only(top: 10.h),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("My ${widget.item} level is...",style: TextStyle(
                                color: Colors.white70,
                                fontSize: 18.sp
                            ),)
                          ],
                        ),
                        Divider(color: Colors.white,thickness: 1.5.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => LanguageLevelResult(level: "Native Speaker", item: "${widget.item}"),
                                    ),
                                  );
                                },
                                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black12),),
                                child: Text("Native Speaker",style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.sp
                                ),))
                          ],
                        ),
                        Divider(color: Colors.white,thickness: 1.5.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => LanguageLevelResult(level: "Beginner", item: "${widget.item}"),
                                    ),
                                  );
                                },
                                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black12),),
                                child: Text("Beginner",style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.sp
                                ),))
                          ],
                        ),
                        Divider(color: Colors.white,thickness: 1.5.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => LanguageLevelResult(level: "Intermediate", item: "${widget.item}"),
                                    ),
                                  );
                                },
                                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black12),),
                                child: Text("Intermediate",style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.sp
                                ),))
                          ],
                        ),
                        Divider(color: Colors.white,thickness: 1.5.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => LanguageLevelResult(level: "Advanced", item: "${widget.item}"),
                                    ),
                                  );
                                },
                                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black12),),
                                child: Text("Advanced",style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.sp
                                ),))
                          ],
                        ),
                      ],
                    ),
                  )
              )
            ]
        )
    );
  }
}
