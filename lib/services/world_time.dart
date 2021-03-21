import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime{
  String location;
  String time;
  String flag;
  String  url;
  bool isDay;
  String abbreviation;

  WorldTime({this.location, this. flag, this.url, this.abbreviation});

  Future<void> getTimeData() async {
    try{
      Response response = await get(Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
      Map map = jsonDecode(response.body);
      String date = map['datetime'];
      String offset = map['utc_offset'].substring(1,3);

      DateTime now = DateTime.parse(date);
      now = now.add(Duration(hours: int.parse(offset)));
      isDay = now.hour > 0 && now.hour <24 ? true : false;
      time = DateFormat.jm().format(now);
    }catch(e){
      time = 'something went wrong';

    }

    // print(map['title']);
  }
}