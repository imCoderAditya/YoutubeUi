import 'package:flutter/material.dart';
import 'package:youtubeui/YotubeUI_Main.dart';
import 'package:youtubeui/screen/HomePage.dart';

void main() {

 
  runApp(MaterialApp(
    
    initialRoute: '/',
    routes: {
      '/': (context) => const MyApp(),
      'Home': (context) => const HomePage(),
    },
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const YotubeUI_Main();
  }
}
