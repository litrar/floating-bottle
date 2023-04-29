import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Gender extends StatefulWidget {
  const Gender({Key? key}) : super(key: key);

  @override
  State<Gender> createState() => _GenderState();
}
class _GenderState extends State<Gender> {
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
                ],
              )
            ]
        )
    );
  }
}