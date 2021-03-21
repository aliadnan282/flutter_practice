import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map data = {};
  String bgImage;
  Color bgColor;
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    bgImage = data['isDay'] == true ? 'sp2.jpeg' : 'sp1.jpeg';
    bgColor = data['isDay'] == true ? Colors.brown[300] : Colors.grey;
    print(data);
    return Scaffold(
        backgroundColor: bgColor,
        body: SafeArea(
            child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/$bgImage'), fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                TextButton(
                    onPressed: () async {
                     dynamic results = await Navigator.pushNamed(context, '/location');
                     setState(() {
                       data = {
                         'time': results['time'],
                         'location': results['location'],
                         'flag': results['flag'],
                         'isDay': results['isDay']
                       };
                     });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.location_on,
                          color: Colors.white,
                        ),
                        Text(
                          'Edit Location',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    )),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['location'],
                      style: TextStyle(
                          fontSize: 28,
                          letterSpacing: 2.0,
                          color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  data['time'],
                  style: TextStyle(fontSize: 66, letterSpacing: 2.0, color: Colors.white),
                ),
              ],
            ),
          ),
        )));
  }
}
