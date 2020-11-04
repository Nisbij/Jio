import 'package:flutter/material.dart';
import '../navigationDrawer.dart';
import './error1.dart';
import './error2.dart';

class HomePAge extends StatelessWidget {
  static const String routeName = '/Home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      drawer: NavigationDrawer(),
      body: Error2(),
    );
  }
}
