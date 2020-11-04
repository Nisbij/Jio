import 'dart:ui';

import 'package:flutter/material.dart';

class Error1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 100,),
          Icon(Icons.error_outline,color: Colors.red,size: 100,),
          SizedBox(height: 50,),
          Text("Failed to link the device!",style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),),
          SizedBox(height: 50,),
          Text("Check your internet",style: TextStyle(fontSize: 23,color: Colors.grey),)

        ],
      ),
    );
  }
}