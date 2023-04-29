
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'gender.dart';

class Information extends StatefulWidget {
  const Information({Key? key}) : super(key: key);

  @override
  State<Information> createState() => _InformationState();
}
class _InformationState extends State<Information> {
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
                      margin: EdgeInsets.only(top: 15,left: 310),
                      child: TextButton(onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return Gender();
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
                  ),
                  _schoolField(),
                  _cityField(),
                  _birthField(),
                  _continueButton(),
                ],
              )

            ]
        )
    );
  }
  Widget _schoolField(){
    return Container(
      margin: EdgeInsets.only(left: 25,right: 25,top: 290),
      child: TextField(
        decoration: InputDecoration(
          isDense: true,
          prefixIcon:
          Align(
            widthFactor: 2.3,
            child: Icon(Icons.school,size: 30,),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(35)),
              borderSide: BorderSide(
                  color: Colors.transparent
              )
          ),
          hintText: " School",
          hintStyle: TextStyle(fontSize: 22,color: Colors.grey.shade400),
          filled: true,
          fillColor: Colors.white,
          isCollapsed: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 50,vertical: 25),
        ),
        style: TextStyle(
            fontSize: 22,color: Colors.black,fontWeight: FontWeight.w500
        ),
        cursorWidth: 3,
      ),
    );
  }
  Widget _cityField(){
    return Container(
      margin: EdgeInsets.only(left: 25,right: 25,top: 20),
      child: TextField(
        decoration: InputDecoration(
          isDense: true,
          prefixIcon:
          Align(
            widthFactor: 2.3,
            child: Icon(Icons.location_city,size: 30,),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(35)),
              borderSide: BorderSide(
                  color: Colors.transparent
              )
          ),
          hintText: " City",
          hintStyle: TextStyle(fontSize: 22,color: Colors.grey.shade400),
          filled: true,
          fillColor: Colors.white,
          isCollapsed: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 50,vertical: 25),
        ),
        style: TextStyle(
            fontSize: 22,color: Colors.black,fontWeight: FontWeight.w500
        ),
        cursorWidth: 3,
      ),
    );
  }
  Widget _birthField(){
    return Container(
      margin: EdgeInsets.only(left: 25,right: 25,top: 20),
      child: TextField(
        decoration: InputDecoration(
          isDense: true,
          prefixIcon:
          Align(
            widthFactor: 2.3,
            child: Icon(Icons.date_range,size: 30,),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(35)),
              borderSide: BorderSide(
                  color: Colors.transparent
              )
          ),
          hintText: " Date of birth",
          hintStyle: TextStyle(fontSize: 22,color: Colors.grey.shade400),
          filled: true,
          fillColor: Colors.white,
          isCollapsed: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 50,vertical: 25),
        ),
        style: TextStyle(
            fontSize: 22,color: Colors.black,fontWeight: FontWeight.w500
        ),
        cursorWidth: 3,
      ),
    );
  }
  Widget _continueButton(){
    return Container(
      margin: EdgeInsets.only(left: 35,right: 35,top: 40,bottom: 40),
      width: 350,
      height: 70,
      child: ElevatedButton(
        child: Text("Continue",style: TextStyle(
            fontSize: 20
        ),),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(35))
            )
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return Gender();
              },
            ),
          );
        },
      ),
    );
  }
}