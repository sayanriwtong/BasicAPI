import 'package:flutter/material.dart';
import 'package:readmoreapp/pages/about.dart';
import 'package:readmoreapp/pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, home: MainPage() //code Main Page
        );
  }
}

class MainPage extends StatefulWidget {
  //const MainPage({ Key? key }) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _pIndex = 0;
  final tabs = [HomePage(), AboutPage()]; // create TabPage

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_pIndex], //ref index Page

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _pIndex, //หน้าปัจจุบัน default 0
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "HomePage"),
          BottomNavigationBarItem(
              icon: Icon(Icons.contact_mail), label: "About"),
        ],
        onTap: (index) {
          setState(() {
            //print(index);
            _pIndex = index;
          });
        },
      ),
    );
  }
}
