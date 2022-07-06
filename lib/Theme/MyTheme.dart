


import 'package:flutter/material.dart';

class MyTheme{

static final lightTheme = ThemeData(

brightness: Brightness.light,
appBarTheme: const AppBarTheme(
  backgroundColor: Colors.white,
  iconTheme: IconThemeData(color:Colors.grey)
),
textTheme: const TextTheme(
  bodyText2: TextStyle(
    color: Colors.black,
  )
)

);
static final darktTheme = ThemeData(
  
  brightness: Brightness.dark,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    iconTheme: IconThemeData(color:Colors.white)
  ),
  textTheme: const TextTheme(
    bodyText2: TextStyle(
      color: Colors.white
    )
  )
);

}
