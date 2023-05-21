import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'mailbox.dart';

class LetterContent extends StatefulWidget {
  const LetterContent({Key? key,required this.name,required this.picture,required this.content}) : super(key: key);
  final String name;
  final String picture;
  final String content;

  @override
  State<LetterContent> createState() => _LetterContentState();
}
class _LetterContentState extends State<LetterContent> {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assetsfolder/personal_background.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15,right: 20,top: 70),
            child: Row(
              children: [
                IconButton(
                  onPressed:(){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return MailBoxPage();
                        },
                      ),
                    );
                  },
                  icon: Icon(Icons.arrow_back_ios_rounded,size: 35,color: Colors.blueGrey,),),
                  Text("  ${widget.name}",style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Bellota-Regular',
                ),)
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 130,left: 40),
            child: Row(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(500),
                    child: Image.asset("${widget.picture}",height: 60,width: 60,)
                ),
                Text("  ${widget.name}  ",style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 30,
                  color: Colors.black,
                  fontFamily: 'Bellota-Regular',
                ),),
                InkWell(
                    child: Icon(Icons.delete,size: 35,),
                    onTap: (){

                    },
                  ),
              ],
            ),
          ),
          Container(
            height: 550,
            width: 500,
            margin: EdgeInsets.only(top: 210,left: 50,right: 50),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(15)
            ),
            child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                removeBottom: true,
                child: ListView(
                  children: [
                    Text("${widget.content}",style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Bellota-Regular',
                      fontWeight: FontWeight.w600
                    ),),
                  ],
                ))
          ),
          Container(
            margin: EdgeInsets.only(top: 800,left: 70),
            child: SizedBox(
              width: 100,
              height: 50,
              child: ElevatedButton(
                child: Text("Reply", style: TextStyle(
                    fontSize: 22,color: Colors.black,fontFamily: 'Bellota-Regular'
                ),),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                    )
                ),
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) {
                  //       return LanguageLevelResult(level: "", item: "");
                  //     },
                  //   ),
                  // );
                },
              ),
            )
          ),
          Container(
            margin: EdgeInsets.only(top: 800,left: 250),
            child: SizedBox(
              width: 100,
              height: 50,
              child: ElevatedButton(
                child: Text("Report", style: TextStyle(
                    fontSize: 22,color: Colors.white,fontFamily: 'Bellota-Regular'
                ),),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                    )
                ),
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) {
                  //       return LanguageLevelResult(level: "", item: "");
                  //     },
                  //   ),
                  // );
                },
              ),
            )
          )
        ],
      ),
    );
  }
}