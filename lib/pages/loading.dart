import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_practice/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';
class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time ="loading";
  void setupWorldTime() async{
    WorldTime instance = WorldTime(location: 'Pakistan', flag: 'pakistan.png', url: 'asia/karachi', abbreviation:'PK');
    await instance.getTimeData();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDay': instance.isDay
    });
    setState(() {
      time = instance.time;
    });
  }
  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitRotatingCircle(
          color: Colors.white,
          size: 50.0,
        ),
      )
    );
  }
}
