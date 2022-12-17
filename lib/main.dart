import 'package:event_scheduler/new_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  final List<Widget> _list = [];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.deepPurple.shade200,
        appBar: AppBar(
          backgroundColor: Colors.deepPurple.shade800,
          centerTitle: false,
          toolbarHeight: 70,
          title: Text(
            'Event Scheduler',
            style: TextStyle(
              color: Colors.white,
              letterSpacing: 2.0,
            ),
          ),
        ),
        body: ListView.builder(
            itemCount: _list.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: ListTile(
                  title: Center(child: _list[index]),
                  tileColor: Colors.white,
                  isThreeLine: false,
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                ),
              );
            }),
        floatingActionButton: Builder(builder: (context) {
          return FloatingActionButton(
            backgroundColor: Colors.deepPurple.shade800,
            onPressed: () async {
              String newText = await Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NewEventScreen()));
              setState(() {
                _list.add(Text(newText, textAlign: TextAlign.center, style: TextStyle(
                  fontSize: 18,
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.w500,
                ),));
              });
            },
            child: Icon(Icons.add),
          );
        }),
      ),
    );
  }
}
