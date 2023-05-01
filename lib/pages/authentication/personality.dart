import 'package:floating_bottle/pages/authentication/interest.dart';
import 'package:floating_bottle/pages/authentication/language.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Personality extends StatefulWidget {
  Personality({Key? key}) : super(key: key);
  // final List<String> interests = ["Cooking","Photography","Art","Basketball","Dance"];
  @override
  State<Personality> createState() => _PersonalityState();
}
class _PersonalityState extends State<Personality> {
  bool pressed1 = true;
  bool pressed2 = true;
  bool pressed3 = true;
  bool pressed4 = true;
  bool pressed5 = true;
  bool pressed6 = true;
  bool pressed7 = true;
  bool pressed8 = true;
  bool pressed9 = true;
  bool pressed10 = true;
  bool pressed11 = true;
  bool pressed12 = true;
  bool pressed13 = true;
  bool pressed14 = true;
  bool pressed15 = true;
  bool pressed16 = true;
  bool pressed17 = true;
  bool pressed18 = true;
  bool pressed19 = true;
  bool pressed20 = true;
  bool cpressed = true;

  Widget build(BuildContext context){
    return Scaffold(
      body: Stack(
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assetsfolder/information_background.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            ListView(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20,right: 20,top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed:(){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return Interest();
                              },
                            ),
                          );
                        },
                        icon: Icon(Icons.arrow_back_ios_rounded,size: 40,color: Colors.white,),),
                      TextButton(onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return Language();
                            },
                          ),
                        );
                      },
                        child: Text("Skip",style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                            color: Colors.white
                        ),),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 40,top: 5),
                  child: Text("My Personalities",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                      color: Colors.white
                  ),),
                ),
                Container(
                  margin: EdgeInsets.only(left: 14,right: 10),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          _advenButton(),
                          _analyButton(),
                          _confidentButton(),
                          _creativeButton(),
                          _empatheticButton(),
                          _friendButton(),
                          _independentButton(),
                          _introButton(),
                          _optimisticButton(),
                          _orgaButton()
                        ],
                      ),
                      Column(
                        children: [
                          _reliaButton(),
                          _perfectButton(),
                          _meticuButton(),
                          _outgoingButton(),
                          _sponButton(),
                          _thoughButton(),
                          _trustButton(),
                          _visionButton(),
                          _warmButton(),
                          _wittyButton()
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 45,right: 40),
                  child: Row(
                    children: [
                      _continueButton()
                    ],
                  ),
                )
              ],
            )
          ]
      ),
    );
  }
  Widget _advenButton(){
    return TextButton(
        onPressed: (){
          setState(() {
            pressed1 = !pressed1;
          });
        },
        child: Container(
            margin: EdgeInsets.only(top: 5),
            height: 45,
            width: 175,
            decoration: pressed1
                ? BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(35))
                : BoxDecoration(color: Colors.blueGrey, borderRadius: BorderRadius.circular(35)),
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(left: 5,right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [pressed1
                  ?Icon(Icons.compass_calibration_outlined,size: 25,color: Colors.black,)
                  :Icon(Icons.compass_calibration_outlined,size: 25,color: Colors.white,),
                  Text("Adventurous",style: pressed1
                      ? TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold)
                      : TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)
                  ),
                ],
              ),
            )
        )
    );
  }
  Widget _analyButton(){
    return TextButton(
        onPressed: (){
          setState(() {
            pressed2 = !pressed2;
          });
        },
        child: Container(
            margin: EdgeInsets.only(top: 0),
            height: 45,
            width: 175,
            decoration: pressed2
                ? BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(35))
                : BoxDecoration(color: Colors.blueGrey, borderRadius: BorderRadius.circular(35)),
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(left: 5,right: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [pressed2
                  ?Icon(Icons.analytics_outlined,size: 25,color: Colors.black,)
                  :Icon(Icons.analytics_outlined,size: 25,color: Colors.white,),
                  Text("Analytical",style: pressed2
                      ? TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold)
                      : TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)
                  ),
                ],
              ),
            )
        )
    );
  }
  Widget _confidentButton(){
    return TextButton(
        onPressed: (){
          setState(() {
            pressed3 = !pressed3;
          });
        },
        child: Container(
            margin: EdgeInsets.only(top: 0),
            height: 45,
            width: 175,
            decoration: pressed3
                ? BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(35))
                : BoxDecoration(color: Colors.blueGrey, borderRadius: BorderRadius.circular(35)),
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(left: 0,right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [pressed3
                  ?Icon(Icons.star,size: 25,color: Colors.black,)
                  :Icon(Icons.star,size: 25,color: Colors.white,),
                  Text("Confident",style: pressed3
                      ? TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold)
                      : TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)
                  ),
                ],
              ),
            )
        )
    );
  }
  Widget _creativeButton(){
    return TextButton(
        onPressed: (){
          setState(() {
            pressed4 = !pressed4;
          });
        },
        child: Container(
            margin: EdgeInsets.only(top: 0),
            height: 45,
            width: 175,
            decoration: pressed4
                ? BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(35))
                : BoxDecoration(color: Colors.blueGrey, borderRadius: BorderRadius.circular(35)),
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(left: 5,right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [pressed4
                  ?Icon(Icons.create_outlined,size: 25,color: Colors.black,)
                  :Icon(Icons.create_outlined,size: 25,color: Colors.white,),
                  Text("Creative",style: pressed4
                      ? TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold)
                      : TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)
                  ),
                ],
              ),
            )
        )
    );
  }
  Widget _empatheticButton(){
    return TextButton(
        onPressed: (){
          setState(() {
            pressed5 = !pressed5;
          });
        },
        child: Container(
            margin: EdgeInsets.only(top: 0),
            height: 45,
            width: 175,
            decoration: pressed5
                ? BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(35))
                : BoxDecoration(color: Colors.blueGrey, borderRadius: BorderRadius.circular(35)),
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(left: 5,right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [pressed5
                  ?Icon(Icons.monitor_heart_outlined,size: 25,color: Colors.black,)
                  :Icon(Icons.monitor_heart_outlined,size: 25,color: Colors.white,),
                  Text("Empathetic",style: pressed5
                      ? TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold)
                      : TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)
                  ),
                ],
              ),
            )
        )
    );
  }
  Widget _friendButton(){
    return TextButton(
        onPressed: (){
          setState(() {
            pressed6 = !pressed6;
          });
        },
        child: Container(
            margin: EdgeInsets.only(top: 0),
            height: 45,
            width: 175,
            decoration: pressed6
                ? BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(35))
                : BoxDecoration(color: Colors.blueGrey, borderRadius: BorderRadius.circular(35)),
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(left: 5,right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [pressed6
                  ?Icon(Icons.people_alt,size: 25,color: Colors.black,)
                  :Icon(Icons.people_alt,size: 25,color: Colors.white,),
                  Text("Friendly",style: pressed6
                      ? TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold)
                      : TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)
                  ),
                ],
              ),
            )
        )
    );
  }
  Widget _independentButton(){
    return TextButton(
        onPressed: (){
          setState(() {
            pressed7 = !pressed7;
          });
        },
        child: Container(
            margin: EdgeInsets.only(top: 0),
            height: 45,
            width: 175,
            decoration: pressed7
                ? BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(35))
                : BoxDecoration(color: Colors.blueGrey, borderRadius: BorderRadius.circular(35)),
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(left: 5,right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [pressed7
                  ?Icon(Icons.person_rounded,size: 25,color: Colors.black,)
                  :Icon(Icons.person_rounded,size: 25,color: Colors.white,),
                  Text("Indepedent",style: pressed7
                      ? TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold)
                      : TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)
                  ),
                ],
              ),
            )
        )
    );
  }
  Widget _introButton(){
    return TextButton(
        onPressed: (){
          setState(() {
            pressed8 = !pressed8;
          });
        },
        child: Container(
            margin: EdgeInsets.only(top: 0),
            height: 45,
            width: 175,
            decoration: pressed8
                ? BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(35))
                : BoxDecoration(color: Colors.blueGrey, borderRadius: BorderRadius.circular(35)),
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(left: 5,right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [pressed8
                  ?Icon(Icons.mood_bad_outlined,size: 25,color: Colors.black,)
                  :Icon(Icons.mood_bad_outlined,size: 25,color: Colors.white,),
                  Text("Introverted",style: pressed8
                      ? TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold)
                      : TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)
                  ),
                ],
              ),
            )
        )
    );
  }
  Widget _optimisticButton(){
    return TextButton(
        onPressed: (){
          setState(() {
            pressed9 = !pressed9;
          });
        },
        child: Container(
            margin: EdgeInsets.only(top: 0),
            height: 45,
            width: 175,
            decoration: pressed9
                ? BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(35))
                : BoxDecoration(color: Colors.blueGrey, borderRadius: BorderRadius.circular(35)),
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(left: 5,right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [pressed9
                  ?Icon(Icons.tag_faces,size: 25,color: Colors.black,)
                  :Icon(Icons.tag_faces,size: 25,color: Colors.white,),
                  Text("Optimistic",style: pressed9
                      ? TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold)
                      : TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)
                  ),
                ],
              ),
            )
        )
    );
  }
  Widget _orgaButton(){
    return TextButton(
        onPressed: (){
          setState(() {
            pressed10 = !pressed10;
          });
        },
        child: Container(
            margin: EdgeInsets.only(top: 0),
            height: 45,
            width: 175,
            decoration: pressed10
                ? BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(35))
                : BoxDecoration(color: Colors.blueGrey, borderRadius: BorderRadius.circular(35)),
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(left: 5,right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [pressed10
                  ?Icon(Icons.add_chart,size: 25,color: Colors.black,)
                  :Icon(Icons.add_chart,size: 25,color: Colors.white,),
                  Text("Organized",style: pressed10
                      ? TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold)
                      : TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)
                  ),
                ],
              ),
            )
        )
    );
  }
  Widget _reliaButton(){
    return TextButton(
        onPressed: (){
          setState(() {
            pressed11 = !pressed11;
          });
        },
        child: Container(
            margin: EdgeInsets.only(top: 5),
            height: 45,
            width: 175,
            decoration: pressed11
                ? BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(35))
                : BoxDecoration(color: Colors.blueGrey, borderRadius: BorderRadius.circular(35)),
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(left: 5,right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [pressed11
                  ?Icon(Icons.people_alt_outlined,size: 25,color: Colors.black,)
                  :Icon(Icons.people_alt_outlined,size: 25,color: Colors.white,),
                  Text("Reliable",style: pressed11
                      ? TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold)
                      : TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)
                  ),
                ],
              ),
            )
        )
    );
  }
  Widget _perfectButton(){
    return TextButton(
        onPressed: (){
          setState(() {
            pressed12 = !pressed12;
          });
        },
        child: Container(
            margin: EdgeInsets.only(top: 0),
            height: 45,
            width: 175,
            decoration: pressed12
                ? BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(35))
                : BoxDecoration(color: Colors.blueGrey, borderRadius: BorderRadius.circular(35)),
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(left: 0,right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [pressed12
                  ?Icon(Icons.thumb_up_alt_outlined,size: 25,color: Colors.black,)
                  :Icon(Icons.thumb_up_alt_outlined,size: 25,color: Colors.white,),
                  Text("Perfectionist",style: pressed12
                      ? TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold)
                      : TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)
                  ),
                ],
              ),
            )
        )
    );
  }
  Widget _meticuButton(){
    return TextButton(
        onPressed: (){
          setState(() {
            pressed13 = !pressed13;
          });
        },
        child: Container(
            margin: EdgeInsets.only(top: 0),
            height: 45,
            width: 175,
            decoration: pressed13
                ? BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(35))
                : BoxDecoration(color: Colors.blueGrey, borderRadius: BorderRadius.circular(35)),
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(left: 0,right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [pressed13
                  ?Icon(Icons.center_focus_strong_outlined,size: 25,color: Colors.black,)
                  :Icon(Icons.center_focus_strong_outlined,size: 25,color: Colors.white,),
                  Text("Meticulous",style: pressed13
                      ? TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold)
                      : TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)
                  ),
                ],
              ),
            )
        )
    );
  }
  Widget _outgoingButton(){
    return TextButton(
        onPressed: (){
          setState(() {
            pressed14 = !pressed14;
          });
        },
        child: Container(
            margin: EdgeInsets.only(top: 0),
            height: 45,
            width: 175,
            decoration: pressed14
                ? BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(35))
                : BoxDecoration(color: Colors.blueGrey, borderRadius: BorderRadius.circular(35)),
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(left: 5,right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [pressed14
                  ?Icon(Icons.accessibility_new_outlined,size: 25,color: Colors.black,)
                  :Icon(Icons.accessibility_new_outlined,size: 25,color: Colors.white,),
                  Text("Outgoing",style: pressed14
                      ? TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold)
                      : TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)
                  ),
                ],
              ),
            )
        )
    );
  }
  Widget _sponButton(){
    return TextButton(
        onPressed: (){
          setState(() {
            pressed15 = !pressed15;
          });
        },
        child: Container(
            margin: EdgeInsets.only(top: 0),
            height: 45,
            width: 175,
            decoration: pressed15
                ? BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(35))
                : BoxDecoration(color: Colors.blueGrey, borderRadius: BorderRadius.circular(35)),
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(left: 5,right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [pressed15
                  ?Icon(Icons.self_improvement_outlined,size: 25,color: Colors.black,)
                  :Icon(Icons.self_improvement_outlined,size: 25,color: Colors.white,),
                  Text("Spontaneous",style: pressed15
                      ? TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold)
                      : TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)
                  ),
                ],
              ),
            )
        )
    );
  }
  Widget _thoughButton(){
    return TextButton(
        onPressed: (){
          setState(() {
            pressed16 = !pressed16;
          });
        },
        child: Container(
            margin: EdgeInsets.only(top: 0),
            height: 45,
            width: 175,
            decoration: pressed16
                ? BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(35))
                : BoxDecoration(color: Colors.blueGrey, borderRadius: BorderRadius.circular(35)),
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(left: 5,right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [pressed16
                  ?Icon(Icons.face,size: 25,color: Colors.black,)
                  :Icon(Icons.face,size: 25,color: Colors.white,),
                  Text("Thoughtful",style: pressed16
                      ? TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold)
                      : TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)
                  ),
                ],
              ),
            )
        )
    );
  }
  Widget _trustButton(){
    return TextButton(
        onPressed: (){
          setState(() {
            pressed17 = !pressed17;
          });
        },
        child: Container(
            margin: EdgeInsets.only(top: 0),
            height: 45,
            width: 175,
            decoration: pressed17
                ? BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(35))
                : BoxDecoration(color: Colors.blueGrey, borderRadius: BorderRadius.circular(35)),
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(left: 5,right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [pressed17
                  ?Icon(Icons.badge_outlined,size: 25,color: Colors.black,)
                  :Icon(Icons.badge_outlined,size: 25,color: Colors.white,),
                  Text("Trustworthy",style: pressed17
                      ? TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold)
                      : TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)
                  ),
                ],
              ),
            )
        )
    );
  }
  Widget _visionButton(){
    return TextButton(
        onPressed: (){
          setState(() {
            pressed18 = !pressed18;
          });
        },
        child: Container(
            margin: EdgeInsets.only(top: 0),
            height: 45,
            width: 175,
            decoration: pressed18
                ? BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(35))
                : BoxDecoration(color: Colors.blueGrey, borderRadius: BorderRadius.circular(35)),
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(left: 5,right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [pressed18
                  ?Icon(Icons.schedule,size: 25,color: Colors.black,)
                  :Icon(Icons.schedule,size: 25,color: Colors.white,),
                  Text("Visionary",style: pressed18
                      ? TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold)
                      : TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)
                  ),
                ],
              ),
            )
        )
    );
  }
  Widget _warmButton(){
    return TextButton(
        onPressed: (){
          setState(() {
            pressed19 = !pressed19;
          });
        },
        child: Container(
            margin: EdgeInsets.only(top: 0),
            height: 45,
            width: 175,
            decoration: pressed19
                ? BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(35))
                : BoxDecoration(color: Colors.blueGrey, borderRadius: BorderRadius.circular(35)),
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(left: 5,right: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [pressed19
                  ?Icon(Icons.heart_broken,size: 25,color: Colors.black,)
                  :Icon(Icons.heart_broken,size: 25,color: Colors.white,),
                  Text("Warm-hearted",style: pressed19
                      ? TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold)
                      : TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)
                  ),
                ],
              ),
            )
        )
    );
  }
  Widget _wittyButton(){
    return TextButton(
        onPressed: (){
          setState(() {
            pressed20 = !pressed20;
          });
        },
        child: Container(
            margin: EdgeInsets.only(top: 0),
            height: 45,
            width: 175,
            decoration: pressed20
                ? BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(35))
                : BoxDecoration(color: Colors.blueGrey, borderRadius: BorderRadius.circular(35)),
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(left: 5,right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [pressed20
                  ?Icon(Icons.wb_incandescent_outlined,size: 25,color: Colors.black,)
                  :Icon(Icons.wb_incandescent_outlined,size: 25,color: Colors.white,),
                  Text("Witty",style: pressed20
                      ? TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold)
                      : TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)
                  ),
                ],
              ),
            )
        )
    );
  }
  Widget _continueButton(){
    return TextButton(
        onPressed: (){
          if(pressed1 == false || pressed2 == false || pressed3 == false || pressed4 == false ||pressed5 == false || pressed6 == false || pressed7 == false || pressed8 == false || pressed9 == false || pressed10 == false
              || pressed11 == false || pressed12 == false || pressed13 == false || pressed14 == false ||pressed15 == false || pressed16 == false || pressed17 == false || pressed18 == false || pressed19 == false || pressed20 == false){
            setState(() {
              cpressed = !cpressed;
            });
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return Language();
                },
              ),
            );
          }
        },
        child: Container(
          margin: EdgeInsets.only(top: 10),
          height: 65,
          width: 310,
          decoration: pressed1&&pressed2&&pressed3&&pressed4&&pressed5&&pressed6&&pressed7&&pressed8&&pressed9&&pressed10
              &&pressed11&&pressed12&&pressed13&&pressed14&&pressed15&&pressed16&&pressed17&&pressed18&&pressed19&&pressed20
              ? BoxDecoration(color: Colors.white60, borderRadius: BorderRadius.circular(35))
              : BoxDecoration(color: Colors.blueGrey, borderRadius: BorderRadius.circular(35)),
          alignment: Alignment.center,
          child: Text("Continue",style: pressed1&&pressed2&&pressed3&&pressed4&&pressed5&&pressed6&&pressed7&&pressed8&&pressed9&&pressed10
              &&pressed11&&pressed12&&pressed13&&pressed14&&pressed15&&pressed16&&pressed17&&pressed18&&pressed19&&pressed20
              ? TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold)
              : TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)
          ),
        )
    );
  }
}