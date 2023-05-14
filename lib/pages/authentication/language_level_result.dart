import 'package:floating_bottle/pages/authentication/personality.dart';
import 'package:floating_bottle/pages/authentication/search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LanguageLevelResult extends StatefulWidget {
  const LanguageLevelResult({Key? key,required this.level,required this.item}) : super(key: key);
  final String level;
  final String item;

  @override
  State<LanguageLevelResult> createState() => _LanguageLevelResultState();
}
class _LanguageLevelResultState extends State<LanguageLevelResult> {
  Widget build(BuildContext context){
    widget.level;
    widget.item;
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
                                return Personality();
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
                              return LanguageLevelResult(level: '',item: "${widget.item}");
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
                  child: Text("I can speak ...",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                      color: Colors.white
                  ),),
                ),
                Container(
                  margin: EdgeInsets.only(right: 30,left: 30,top: 40),
                  height: 55,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(35),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(35),
                    child: Row(
                      children: <Widget>[
                        Padding(padding: EdgeInsets.only(left: 10,right: 10),
                            child: Icon(Icons.search,color: Colors.black,size: 30,)),
                        Text("Enter the language",style: TextStyle(color: Colors.grey,fontSize: 20),)
                      ],
                    ),
                    onTap: (){
                      //跳轉頁面
                      showSearch(context: context,delegate: SearchBarDelegate());
                    },
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(right: 50,left: 50,top: 25),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white70,
                      ),
                      child: Column(
                        children: [
                          Text("${widget.item} - ${widget.level}",style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),)
                        ],
                      ),
                    )
                ),
                _continueButton(),
              ],
            )
          ]
      ),
    );
  }
  Widget _continueButton() {
    return Container(
      margin: EdgeInsets.only(left: 35, right: 35, top: 450, bottom: 20),
      width: 350,
      height: 70,
      child: ElevatedButton(
        child: Text("Continue", style: TextStyle(
            fontSize: 20,color: Colors.white
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
                return LanguageLevelResult(level: "", item: "");
              },
            ),
          );
        },
      ),
    );
  }
}
