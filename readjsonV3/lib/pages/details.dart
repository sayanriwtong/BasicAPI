import 'package:flutter/material.dart';
import 'package:readmoreapp/main.dart';
import 'package:readmoreapp/pages/about.dart';
import 'package:readmoreapp/pages/home.dart';

class DetailPage extends StatefulWidget {
  //const DetailPage({ Key? key }) : super(key: key);
  final v1, v2, v3, v4;
  DetailPage(this.v1, this.v2, this.v3, this.v4);
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  var _v1, _v2, _v3, _v4;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _v1 = widget.v1;
    _v2 = widget.v2;
    _v3 = widget.v3;
    _v4 = widget.v4;
  }

  @override
  Widget build(BuildContext context) {
    int _pIndex = 0;
    final tabs = [HomePage(), AboutPage()]; // create TabPage

    return Scaffold(
      appBar: AppBar(
        title: Text("[เนื้อหาของเรื่อง]"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            SizedBox(
              height: 30,
            ),
            myBox(_v1, _v2, _v3, _v4),
            tabs[_pIndex],
          ],
        ),
      ),
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

  Widget myBox(String title, String subtitle, String imageUrl, String detail) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
      //color: Colors.blue[50],
      height: 400,
      decoration: BoxDecoration(
          // color: Colors.blue[50],
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.50), BlendMode.darken))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 25,
                color: Colors.yellowAccent,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            subtitle,
            style: TextStyle(fontSize: 15, color: Colors.white),
          ),
          SizedBox(height: 10),
          Text(
            detail,
            style: TextStyle(fontSize: 15, color: Colors.white),
          ),
          SizedBox(height: 18),
          TextButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => MyApp()));
              },
              child: Text(
                "หน้าแรก",
                style: TextStyle(fontSize: 15, color: Colors.lightGreenAccent),
              ))
        ],
      ),
    );
  }
}
