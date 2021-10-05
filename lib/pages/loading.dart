import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setWorldTime(){
    WorldTime instance = new WorldTime(location: 'Berlin',flag: 'Germany.png',url: 'Europe/Berlin');
    instance.getTime();
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
        title:  Text('Loading'),
      //body:Text('loading screen'),
        )
    );
  }
}
