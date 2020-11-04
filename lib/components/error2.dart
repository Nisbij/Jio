import 'dart:ui';

import 'package:flutter/material.dart';

class Error2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 100,
          ),
          Icon(
            Icons.error_outline,
            color: Colors.red,
            size: 100,
          ),
          SizedBox(
            height: 50,
          ),
          Text(
            "Device is not responding",
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 50,
          ),
          Align(
            
            child: Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, ",
              style: TextStyle(fontSize: 15, color: Colors.grey),
            ),
            alignment: Alignment.center,
          ),
          SizedBox(
            height: 30,
          ),
          RaisedButton(child: Text("Try Again"),onPressed: () {},color: Colors.amber[300],)
        ],
      ),
    );
  }
}
