import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_files_clone/ui/MyHomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Files',
      theme: ThemeData(fontFamily: "OpenSans"),
      home: MyHomePage(title: 'Files'),
    );
  }
}
