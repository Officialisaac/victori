import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:victoria/screen/welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Victoria',
      theme: ThemeData(
          primarySwatch: Colors.orange,
          textTheme:
              GoogleFonts.montserratTextTheme(Theme.of(context).textTheme),
          primaryColor: Colors.deepOrangeAccent,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: const WelcomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
