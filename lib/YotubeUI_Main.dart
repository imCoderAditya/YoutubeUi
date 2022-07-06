import 'package:flutter/material.dart';
import 'package:youtubeui/Theme/MyTheme.dart';
import 'package:youtubeui/screen/LibraryScreen.dart';
import 'package:youtubeui/screen/ShortScreen.dart';
import 'package:youtubeui/screen/SubcriptionScreen.dart';
import 'screen/HomePage.dart';


// ignore: camel_case_types
class YotubeUI_Main extends StatefulWidget {
  const YotubeUI_Main({Key? key}) : super(key: key);

  @override
  State<YotubeUI_Main> createState() => _MyAppState();
}

class _MyAppState extends State<YotubeUI_Main> {

 bool _selectedSwitch = true;
 int _curentIndex = 0;

 final _screen = <Widget>[
   const HomePage(),
   const ShortScreen(),
   const Center(
    child: Text("Create Reel"),
   ),
   const SubcriptionScreen(),
   const LibraryScreen(),

 ];

 
  _onTapped(int index){
    setState(() {
      _curentIndex = index;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _selectedSwitch?MyTheme.lightTheme:MyTheme.darktTheme,
      home:  Scaffold(
        appBar: AppBar(  
          title: _selectedSwitch?Image.asset(
            "assets/images/youtube-logo.png",
            width: 98,
            height: 70,
          ):Image.asset("assets/images/youtube-logo-white.png",
            width:98,
            height:70,
          ),
          actions: <Widget>[
            Switch(
              activeColor: Colors.white,
              activeTrackColor : _selectedSwitch?Colors.black:Colors.white,
              value: _selectedSwitch, 
              onChanged: (newValue){
                setState(() {
                  _selectedSwitch = newValue;
                });
              }),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.videocam),
            ),
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.notifications_none)),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.account_circle),
            ),
          ],
        ),
        body: _screen[_curentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _curentIndex,
          selectedItemColor:_selectedSwitch?Colors.black:Colors.white,
          onTap: _onTapped,
          type: BottomNavigationBarType.fixed,
          items:const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.whatshot),
            
            label: "Shorts"),
           BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline,size: 30),
            label: "",
            ),
          BottomNavigationBarItem(
              icon: Icon(Icons.subscriptions), 
              label: "Subcription"),
    
          BottomNavigationBarItem(
              icon: Icon(Icons.video_library_outlined),
              label: "Library"),
        ]),
      ),
    );
  }

}
