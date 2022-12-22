import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:knows/home.dart';
import 'package:knows/splashscreen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'LoginPage.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://cpkdwipmwufpavfncpcz.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImNwa2R3aXBtd3VmcGF2Zm5jcGN6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzE3MDgyOTksImV4cCI6MTk4NzI4NDI5OX0.FsOZi2zTSA1Lpz3l99tLI53JReyDmaXwArQpAMReuMI',
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blimp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: GoogleFonts.poppins().fontFamily,
        textTheme: TextTheme(
          bodyText1: TextStyle(),
          bodyText2: TextStyle(),
        ).apply(
          bodyColor: Colors.white,
        ),
      ),
debugShowCheckedModeBanner:false,
      initialRoute: '/login',
      routes: <String, WidgetBuilder>{
        '/': (_) => const SplashPage(),
        '/login': (_) => const LoginPage(),
        '/homepage' : (_)=>const MyHomePage()
      },
    );
  }
}
