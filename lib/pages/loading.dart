import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void getTime() async{
  Response response = await get(Uri.parse('https://worldtimeapi.org/api/timezone/Europe/London'));
  Map data = jsonDecode(response.body);
  String datetime = data['datetime'];
  String offset = data['utc_offset'];
  DateTime now = DateTime.parse(datetime);
  List offsetnum = offset.split(':').map((e)=>int.parse(e)).toList();
  if(offset.substring(0,1)=='+')
    {
      now = now.add(Duration(hours: offsetnum[0],minutes: offsetnum[1]));
    }
  else{
    now = now.subtract(Duration(hours: offsetnum[0],minutes: offsetnum[1]));
  }
  print(now);
  }
  @override
  void initState() {
    super.initState();
    getTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title:  Text('Loading'),
      //body:Text('loading screen'),
        )
    );
  }
}
