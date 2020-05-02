import 'package:include/models/user.dart';
import 'package:include/screens/event.dart';
import 'package:include/screens/wrapper.dart';
import 'package:include/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
        routes: {'/event': (context) => Event()},
      ),
    );
  }
}
