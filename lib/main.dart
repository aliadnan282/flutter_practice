import 'dart:ui';

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: NinjaCard()));

class NinjaCard extends StatefulWidget {
  @override
  _NinjaCardState createState() => _NinjaCardState();
}

class _NinjaCardState extends State<NinjaCard> {
  int counter =0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('Ninja ID Card'),
        backgroundColor: Colors.grey[850],
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/sp1.jpeg'),
                radius: 50,
              ),
            ),
            Text(
              'Name',
              style: TextStyle(letterSpacing: 5, color: Colors.grey),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Chun-Li',
              style: TextStyle(
                  color: Colors.amber, fontSize: 25, fontFamily: 'SansBold'),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Ninja Level',
              style: TextStyle(letterSpacing: 5, color: Colors.grey),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              '$counter',
              style: TextStyle(
                  color: Colors.amber, fontSize: 25, fontFamily: 'SansBold'),
            ),
            SizedBox(
              height: 5,
            ),
            Row(children: <Widget>[
              Icon(
                Icons.email,
                color: Colors.grey[400],
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'adnan.systemsltd@gmail.com',
                style: TextStyle(
                    fontSize: 18, letterSpacing: 1, color: Colors.grey[400]),
              )
            ]),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              counter += 1;
            });
          },
          tooltip: 'Increment',
          backgroundColor: Colors.grey[800],
          child: Icon(
            Icons.add,
          )), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
