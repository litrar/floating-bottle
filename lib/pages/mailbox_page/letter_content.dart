import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'mailbox.dart';

class LetterContent extends StatefulWidget {
  const LetterContent({Key? key,required this.name}) : super(key: key);
  final String name;


  @override
  State<LetterContent> createState() => _LetterContentState();
}
class _LetterContentState extends State<LetterContent> {
  Widget build(BuildContext context) {
    widget.name;
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
                  fontWeight: FontWeight.w500
                ),)
              ],
            ),
          ),
        ],
      ),
    );
  }
}