import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Event extends StatefulWidget {
  @override
  _EventState createState() => _EventState();
}

class _EventState extends State<Event> {
  final _formKey = GlobalKey<FormState>();

  String date = "";
  String time = "";
  String venue = "";
  String audience = "";
  String topic = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Include'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Column(children: <Widget>[
        Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(height: 40.0),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                    autofocus: false,
                    initialValue: '',
                    validator: (val) => val.isEmpty ? 'Enter a value' : null,
                    onChanged: (value) {
                      setState(() {
                        date = value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Event Date',
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      fillColor: Colors.white,
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                        borderSide: new BorderSide(),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15.0),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                    autofocus: false,
                    initialValue: '',
                    validator: (val) => val.isEmpty ? 'Enter a value' : null,
                    onChanged: (value) {
                      setState(() {
                        time = value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Event Time',
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      fillColor: Colors.white,
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                        borderSide: new BorderSide(),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15.0),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                    autofocus: false,
                    initialValue: '',
                    validator: (val) => val.isEmpty ? 'Enter a value' : null,
                    onChanged: (value) {
                      setState(() {
                        venue = value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Event Venue',
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      fillColor: Colors.white,
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                        borderSide: new BorderSide(),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15.0),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                    autofocus: false,
                    initialValue: '',
                    validator: (val) => val.isEmpty ? 'Enter a value' : null,
                    onChanged: (value) {
                      setState(() {
                        audience = value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Audience',
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      fillColor: Colors.white,
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                        borderSide: new BorderSide(),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15.0),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                    autofocus: false,
                    initialValue: '',
                    validator: (val) => val.isEmpty ? 'Enter a value' : null,
                    onChanged: (value) {
                      setState(() {
                        topic = value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Topic of event',
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      fillColor: Colors.white,
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                        borderSide: new BorderSide(),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8.0),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        String link =
                            "http://127.0.0.1:5000/application/written_date/" +
                                audience +
                                '/' +
                                topic +
                                '/' +
                                date +
                                '/' +
                                time +
                                '/' +
                                venue;
                        Response response = await get(link);
                        String r = jsonDecode(response.body);
                        print(r);
                      }
                    },
                    padding: EdgeInsets.all(12),
                    color: Color(0xff03da9d),
                    child:
                        Text('Submit', style: TextStyle(color: Colors.black)),
                  ),
                ),
              ],
            )),
      ]),
    );
  }
}
