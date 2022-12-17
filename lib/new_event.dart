import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewEventScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NewEventScreen();
}

class _NewEventScreen extends State<NewEventScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  late FocusNode myFocusNode;

  @override
  void initState() {
    super.initState();

    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    myFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade200,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade800,
        centerTitle: false,
        title: Text('New Event',
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 2.0,
          ),),
        toolbarHeight: 70,
        leading: Builder(builder: (context) {
          return IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          );
        }),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              // margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(style: BorderStyle.none),
                color: Colors.deepPurple.shade800,
              ),
              child: TextFormField(
                focusNode: myFocusNode,
                onTap: () {
                  myFocusNode.requestFocus();
                },
                controller: _textEditingController,
                textInputAction: TextInputAction.newline,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                cursorColor: Colors.white,
                showCursor: true,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.w500,
                ),
                decoration: const InputDecoration(
                  prefixIcon: Align(
                    widthFactor: 2.0,
                    heightFactor: 1.0,
                    child: Icon(
                      Icons.calendar_today,
                      color: Colors.white,
                      size: 30.0,
                    ),
                  ),

                  contentPadding: const EdgeInsets.fromLTRB(12, 24, 12, 24),
                  labelText: 'Event',
                  border: UnderlineInputBorder(borderSide: BorderSide.none),
                  // fillColor: Colors.deepPurple.shade800,
                  // border: UnderlineInputBorder(
                  // borderRadius: BorderRadius.all(Radius.circular(20))),
                  labelStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 20,
                    letterSpacing: 2.0,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
              onPressed: () {
                String newEventText = _textEditingController.text;
                if (newEventText != "") {
                  Navigator.pop(context, newEventText);
                }
              },
              child: Text(
                'ADD',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0)),

                // shape: StadiumBorder(),
                backgroundColor: Colors.deepPurple.shade100,
                padding: EdgeInsets.symmetric(vertical: 15.0),
                minimumSize: Size(double.infinity, 50),
                maximumSize: Size(double.infinity, 50),
              ),
            ),
          )
        ],
      ),
    );
  }
}
