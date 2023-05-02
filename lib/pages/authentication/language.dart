import 'package:floating_bottle/pages/authentication/personality.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Language extends StatefulWidget {
  Language({Key? key}) : super(key: key);
  // final List<String> interests = ["Cooking","Photography","Art","Basketball","Dance"];
  @override
  State<Language> createState() => _LanguageState();
}
class _LanguageState extends State<Language> {
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
                  margin: const EdgeInsets.only(left: 20,right: 20,top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed:(){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return Personality();
                              },
                            ),
                          );
                        },
                        icon: const Icon(Icons.arrow_back_ios_rounded,size: 40,color: Colors.white,),),
                      TextButton(onPressed: (){
                        context.go("/personal");
                      },
                        child: const Text("Skip",style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                            color: Colors.white
                        ),),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 40,top: 30),
                  child: const Text("I can speak ...",style: TextStyle(
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