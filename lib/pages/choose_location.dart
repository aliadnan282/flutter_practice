import 'package:flutter/material.dart';
import 'package:flutter_practice/services/world_time.dart';
class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> location = [
    WorldTime(location: 'Pakistan', flag: 'pakistan.png', url: 'asia/pakistan', abbreviation:'PK'),
    WorldTime(location: 'London', flag: 'london.png', url: 'Europe/london', abbreviation:'AU')
  ];

  void updateTime(index) async{
    WorldTime instance = location[index];
    await instance.getTimeData();
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDay': instance.isDay
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Choose Location'),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: location.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
            child: Card(
              child: ListTile(
                onTap: (){
                  return updateTime(index);
                },
                title: Text(location[index].location),
                leading: CircleAvatar(
                  radius: 25,
                backgroundImage: NetworkImage('https://www.countryflags.io/${location[index].abbreviation}/flat/64.png'),
                )
              ),
            ),
          );
        },
      ),
    );
  }
}
