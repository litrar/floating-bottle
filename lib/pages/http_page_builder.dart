import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../api/http_response.dart';
import 'loading_indicator.dart';

class HttpPageBuilder<T> extends StatefulWidget {

  HttpPageBuilder({
    Key? key,
    required this.future,
    required this.builder,
    this.appBar
  }) : super(key: key){
  }

  final Future<HttpRes<T>> Function() future;
  final PreferredSizeWidget? appBar;
  final Widget Function(HttpRes<T> response,BuildContext context,void Function() refresh) builder;


  @override
  _HttpPageBuilderState<T> createState() => _HttpPageBuilderState<T>();

}

class _HttpPageBuilderState<T> extends State<HttpPageBuilder<T>> {

  late Future<HttpRes<T>> _future;
  late void Function() _refresh;

  @override
  Widget build(BuildContext context) {
    _future = widget.future();
    _refresh = (){
      setState(() {
        _future = widget.future();
      });
    };
    return FutureBuilder<HttpRes<T>>(
        future: _future,
        builder: (context, snapshot){
          if(snapshot.connectionState != ConnectionState.done) {
            return Scaffold(
              appBar: widget.appBar,
              body: LoadingIndicator(),
            );
          }
          else if(snapshot.data?.isSuccess ?? false) {
            return widget.builder(snapshot.data!, context,_refresh);
          } else if(snapshot.error is DioError){
            return Scaffold(
              appBar: widget.appBar,
              body: Center(
                child: Column(
                  children: [
                    Text("連線錯誤"),
                    TextButton(
                      onPressed: () {
                        _refresh();
                      },
                      child: Text("重試"),
                    )
                  ],
                ),
              ),
            );
          }
          else {
            print(snapshot.error);
            return Scaffold(
              appBar: widget.appBar,
              body: Center(
                child: Text(
                    snapshot.data?.message ?? snapshot.error?.toString() ?? "未知錯誤"
                ),
              ),
            );
          }
        }
    );
  }

}


