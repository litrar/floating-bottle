import 'package:flutter/material.dart';

import 'information.dart';
// import 'package:flutter_verification_box/verification_box.dart';

class Vertification extends StatefulWidget {
  const Vertification({Key? key}) : super(key: key);

  @override
  State<Vertification> createState() => _VertificationState();
}
class _VertificationState extends State<Vertification> {
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
            children: <Widget>[
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assetsfolder/registration.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              ListView(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 150, left: 20),
                    child:
                    const Text("Almost there!", style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10, left: 20),
                    child: const Text(
                      "Plese enter the code that we have sent to your email for vertification.",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Colors.white,
                          height: 1.5
                      ),),
                  ),
                  _verifiField(),
                  _submitButton(),
                  _resendButton(),
                ],
              )
            ]
        )
    );
  }

  Widget _verifiField() {
    // return Container(
    //   height: 45,
    //   child: VerificationBox(
    //     count: 4,
    //   ),
    // );
    return Container(
      margin: const EdgeInsets.only(left: 25,right: 25,top: 30),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            SizedBox(
                width: 70,
                child: TextField(
                  decoration: InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(
                            color: Colors.transparent
                        )
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    isCollapsed: true,
                    contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                  ),
                  maxLength: 1,
                  style: TextStyle(
                    fontSize: 25,color: Colors.black,fontWeight: FontWeight.w500,
                  ),
                )
            ),

            SizedBox(
                width: 70,
                child: TextField(
                  decoration: InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(
                            color: Colors.transparent
                        )
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    isCollapsed: true,
                    contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                  ),
                  maxLength: 1,
                  style: TextStyle(
                    fontSize: 25,color: Colors.black,fontWeight: FontWeight.w500,
                  ),
                )
            ),

            SizedBox(
                width: 70,
                child: TextField(
                  decoration: InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(
                            color: Colors.transparent
                        )
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    isCollapsed: true,
                    contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                  ),
                  maxLength: 1,
                  style: TextStyle(
                    fontSize: 25,color: Colors.black,fontWeight: FontWeight.w500,
                  ),
                )
            ),

            SizedBox(
                width: 70,
                child: TextField(
                  decoration: InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(
                            color: Colors.transparent
                        )
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    isCollapsed: true,
                    contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                  ),
                  maxLength: 1,
                  style: TextStyle(
                    fontSize: 25,color: Colors.black,fontWeight: FontWeight.w500,
                  ),
                )
            ),
          ]
      ),
    );
  }

  Widget _submitButton() {
    return Container(
      margin: const EdgeInsets.only(left: 35, right: 35, top: 25, bottom: 20),
      width: 350,
      height: 70,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.grey.shade500),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(35))
            )
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const Information();
              },
            ),
          );
        },
        child: const Text("Submit", style: TextStyle(
            fontSize: 20
        ),),
      ),
    );
  }

  Widget _resendButton() {
    return Container(
      margin: const EdgeInsets.only(left: 0, right: 0, top: 5, bottom: 0),
      width: 200,
      height: 60,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(onPressed: () {
            Navigator.of(context).pop();
          },
              child: const Text("Resend code", style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                  decoration: TextDecoration.underline
              ),))
        ],
      ),
    );
  }
}

