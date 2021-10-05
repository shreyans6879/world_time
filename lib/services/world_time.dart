import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {
  String location;
  String? time ;
  String flag;
  String url;

  WorldTime({required this.location,required this.flag,required this.url});

  void getTime() async{
    Response response = await get(Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
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
    time = now.toString();

  }

}