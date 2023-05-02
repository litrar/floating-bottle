import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage(this.message,{Key? key,this.prevPageUrl}) : super(key: key);

  final String? prevPageUrl;
  final String? message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(message??"未知錯誤"),
      ),
    );
  }
}
