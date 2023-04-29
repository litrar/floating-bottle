import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'gender.dart';

class Interest extends StatefulWidget {
  const Interest({Key? key}) : super(key: key);

  @override
  State<Interest> createState() => _InterestState();
}
class _InterestState extends State<Interest> {
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
                                return Gender();
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
                              return Interest();
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
                  margin: EdgeInsets.only(left: 40,top: 30),
                  child: Text("My Interests",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                      color: Colors.white
                  ),),
                ),
              ],
            )
          ]
      ),
    );
  }
}