import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:knows/home.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: GoogleFonts.poppins().fontFamily,
        textTheme: TextTheme(
          bodyText1: TextStyle(),
          bodyText2: TextStyle(),
        ).apply(
          bodyColor: Colors.white,
          // displayColor: Colors.blue,
        ),
      ),
debugShowCheckedModeBanner:false,
      home: const MyHomePage(),
    );
  }
}
