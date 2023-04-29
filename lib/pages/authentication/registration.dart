import 'package:floating_bottle/pages/authentication/vertification.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}
class _RegistrationState extends State<Registration>{
  bool _passwordVisible = false;
  bool isChecked = false;

  Widget build(BuildContext context){
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
            // IconButton(onPressed: onPressed, icon: icon),
            ListView(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 90,left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Create an account!",style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                          color: Colors.white
                      ),),
                      Text("Register to get started.",style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 25,
                        height: 1.5,
                        color: Colors.white,
                      ),),

                    ],
                  ),
                ),
                _nickNameField(),
                _emailField(),
                _passwordField(),
                _confirmPasswordField(),
                _agreeCheckbox(),
                _registerButton(),
                _loginTextButton(),
              ],
            )
          ]
      ),
    );
  }
  Widget _nickNameField(){
    return Container(
      margin: EdgeInsets.only(left: 25,right: 25,top: 40),
      child: TextField(
        decoration: InputDecoration(
          isDense: true,
          prefixIcon:
          Align(
            widthFactor: 2.3,
            child: Icon(Icons.person,size: 30,),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(35)),
              borderSide: BorderSide(
                  color: Colors.transparent
              )
          ),
          hintText: " Nickname",
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
  Widget _emailField(){
    return Container(
      margin: EdgeInsets.only(left: 25,right: 25,top: 10),
      child: TextField(
        decoration: InputDecoration(
          isDense: true,
          prefixIcon:
          Align(
            widthFactor: 2.3,
            child: Icon(Icons.email_outlined,size: 30,),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(35)),
              borderSide: BorderSide(
                  color: Colors.transparent
              )
          ),
          hintText: " Email Address",
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
  Widget _passwordField(){
    return Container(
      margin: EdgeInsets.only(left: 25,right: 25,top: 10),
      child: TextField(
        obscureText: !_passwordVisible,
        decoration: InputDecoration(
          isDense: true,
          prefixIcon:
          Align(
            widthFactor: 2.3,
            child: Icon(Icons.lock,size: 30,),
          ),
          suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _passwordVisible = !_passwordVisible;
                });
              },
              icon: Icon(
                  _passwordVisible ? Icons.visibility : Icons.visibility_off,
                  size: 25,
                  color: Theme.of(context).primaryColorDark)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(35)),
              borderSide: BorderSide(
                  color: Colors.transparent
              )
          ),
          hintText: " Password",
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
  Widget _confirmPasswordField(){
    return Container(
      margin: EdgeInsets.only(left: 25,right: 25,top: 10),
      child: TextField(
        obscureText: !_passwordVisible,
        decoration: InputDecoration(
          isDense: true,
          prefixIcon:
          Align(
            widthFactor: 2.3,
            child: Icon(Icons.lock,size: 30,),
          ),
          suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _passwordVisible = !_passwordVisible;
                });
              },
              icon: Icon(
                  _passwordVisible ? Icons.visibility : Icons.visibility_off,
                  size: 25,
                  color: Theme.of(context).primaryColorDark)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(35)),
              borderSide: BorderSide(
                  color: Colors.transparent
              )
          ),
          hintText: " Confirm Password",
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
  Widget _agreeCheckbox(){
    return Container(
      margin: EdgeInsets.only(left: 25,right: 25,top: 10),
      child: CheckboxListTile(
        title: Text("By registering, you are agreeing with our Terms of Use and Privacy Policy",style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 20,
            color: Colors.white
        ),),
        side: BorderSide(color: Colors.white),
        checkColor: Colors.white,
        controlAffinity: ListTileControlAffinity.leading,
        value: isChecked,
        onChanged: (bool? value) {
          setState(() {
            isChecked = value!;
          });
        },
      ),
    );
  }
  Widget _registerButton(){
    return Container(
      margin: EdgeInsets.only(left: 35,right: 35,top: 25,bottom: 40),
      width: 350,
      height: 70,
      child: ElevatedButton(
        child: Text("Register",style: TextStyle(
            fontSize: 20
        ),),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(35))
            )
        ),
        onPressed: () {
          if (isChecked == true) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return Vertification();
                },
              ),
            );
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return Registration();
                },
              ),
            );
          }
        }
      ),
    );
  }
  Widget _loginTextButton(){
    return Container(
      margin: EdgeInsets.only(left: 0,right: 0,top: 15,bottom: 0),
      color: Color(0xFFB0C4DE),
      width: 200,
      height: 60,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("          Already have an account?",style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Colors.black
          ),),
          TextButton(onPressed: (){
            Navigator.of(context).pop();
          },
              child: Text("Log in",style: TextStyle(
                  color: Colors.indigo,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                  decoration: TextDecoration.underline
              ),))
        ],
      ),
    );
  }


}