import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time='loading';

  void setWorldTime()async {
    WorldTime instance = new WorldTime(location: 'Berlin',flag: 'Germany.png',url: 'Europe/Berlin');
    await instance.getTime();
    setState(() {
      time= instance.time;
    });

  }

  @override
  void initState() {
    super.initState();
    setWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title:  Text('TIME'),
      //body:Text('loading screen'),
        ),
       body: Padding(
         padding: EdgeInsets.all(50.0),
         child: Text(time),
       ),
    );
  }
}
