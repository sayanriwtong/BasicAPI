import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:readmoreapp/pages/about.dart';
import 'package:readmoreapp/pages/details.dart';

import 'package:http/http.dart' as http; //as is alias name
import 'dart:async';

class HomePage extends StatefulWidget {
  //const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final tabs = [HomePage(), AboutPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("แอพพลิเคชั่นแนะนำการ์ตูนสำหรับเด็ก"),
      ),
      body: Padding(
          padding: EdgeInsets.all(20),
          child: FutureBuilder(
            builder: (context, AsyncSnapshot snapshot) {
              //var data = json.decode(snapshot.data.toString()); //data: list type

              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return myBox(
                      snapshot.data[index]['title'],
                      snapshot.data[index]['subtitle'],
                      snapshot.data[index]['image_url'],
                      snapshot.data[index]['detail']);
                },
                itemCount: snapshot.data.length, //กำหนดจำนวนข้อมูล
              );
            },
            //future: DefaultAssetBundle.of(context).loadString('assets/data.json'),
            future: getData(),
          )),
    );
  }

  Widget myBox(String title, String subtitle, String imageUrl, String detail) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      //color: Colors.blue[50],
      height: 150,
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
                color: Colors.deepOrangeAccent,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            subtitle,
            style: TextStyle(fontSize: 15, color: Colors.white),
          ),
          SizedBox(height: 18),
          TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            DetailPage(title, subtitle, imageUrl, detail)));
              },
              child: Text(
                "อ่านต่อ",
                style: TextStyle(fontSize: 15, color: Colors.lightGreenAccent),
              ))
        ],
      ),
    );
  }

  Future getData() async {
    var url = Uri.https(
        'raw.githubusercontent.com', '/sayanriwtong/BasicAPI/main/data.json');
    var response = await http.get(url);

    var result = json.decode(response.body);

    return result;
  }
}
