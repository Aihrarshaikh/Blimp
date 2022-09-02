import 'package:flutter/material.dart';
// import 'package:knows/getters.dart';
import 'package:knows/models/Data_model.dart';
import 'home.dart';

class read_page extends StatelessWidget {
  String ss;
  // Image
  read_page({Key? key, required this.ss}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [Center(child: Text(ss,
        style: TextStyle(
          color: Colors.black
        ),))],
      ),
    );
  }
}
