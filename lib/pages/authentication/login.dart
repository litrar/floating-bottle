import 'package:floating_bottle/pages/authentication/information.dart';
import 'package:floating_bottle/pages/authentication/registration.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../subpage.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginPageState();
  static final GoRoute route =
      GoRoute(path: "/logIn", builder: ((context, state) => Login()));
}

class _LoginPageState extends State<Login> {
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
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
            ListView(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 200),
                  child: Column(
                    children: [
                      const Text(
                        "Hi there!",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 30,
                            color: Colors.white),
                      ),
                      const Text(
                        "Let's Get Penpals",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                          height: 1.5,
                          color: Colors.white,
                        ),
                      ),
                      _emailField(),
                      _passwordField(),
                      _loginButton(),
                      const Text(
                        "or",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w400),
                      ),
                      _createAccountButton(),
                    ],
                  ),
                )
              ],
            )
          ],
        ));
  }

  Widget _emailField() {
    return Container(
      margin: const EdgeInsets.only(left: 35, right: 35, top: 40),
      child: TextField(
        decoration: InputDecoration(
          isDense: true,
          prefixIcon: const Align(
            widthFactor: 2.3,
            child: Icon(
              Icons.email_outlined,
              size: 30,
            ),
          ),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(35)),
              borderSide: BorderSide(color: Colors.transparent)),
          hintText: " Email Address",
          hintStyle: TextStyle(fontSize: 22, color: Colors.grey.shade400),
          filled: true,
          fillColor: Colors.white,
          isCollapsed: true,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 50, vertical: 25),
        ),
        style: const TextStyle(
            fontSize: 22, color: Colors.black, fontWeight: FontWeight.w500),
        cursorWidth: 3,
      ),
    );
  }

  Widget _passwordField() {
    return Container(
      margin: const EdgeInsets.only(left: 35, right: 35, top: 20),
      child: TextField(
        obscureText: !_passwordVisible,
        decoration: InputDecoration(
          isDense: true,
          prefixIcon: const Align(
            widthFactor: 2.3,
            child: Icon(
              Icons.lock,
              size: 30,
            ),
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
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(35)),
              borderSide: BorderSide(color: Colors.transparent)),
          hintText: "Password",
          hintStyle: TextStyle(fontSize: 22, color: Colors.grey.shade400),
          filled: true,
          fillColor: Colors.white,
          isCollapsed: true,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 50, vertical: 25),
        ),
        style: const TextStyle(
            fontSize: 22, color: Colors.black, fontWeight: FontWeight.w500),
        cursorWidth: 3,
      ),
    );
  }

  Widget _loginButton() {
    return Container(
      margin: const EdgeInsets.only(left: 35, right: 35, top: 20, bottom: 25),
      width: 350,
      height: 70,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35)))),
        onPressed: () {
          context.go(SubPage.PERSONAL.route.path);
        },
        child: const Text(
          "Log in",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  Widget _createAccountButton() {
    return Container(
      margin: const EdgeInsets.only(left: 35, right: 35, top: 25, bottom: 40),
      width: 350,
      height: 70,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.grey.shade500),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35)))),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const Registration();
              },
            ),
          );
        },
        child: const Text(
          "Create an account",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
