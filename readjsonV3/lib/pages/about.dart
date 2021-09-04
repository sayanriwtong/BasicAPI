import 'package:flutter/material.dart';
import 'package:readmoreapp/main.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("[เกี่ยวกับฉัน]"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            SizedBox(
              height: 30,
            ),
            myBox(
                "About ME",
                "",
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR58CGiNYKhEdYxR3R017uKTTnYavIbPHv5XA&usqp=CAU",
                500),
          ],
        ),
      ),
    );
  }

  Widget myBox(String name, String descript, String url, double h) {
    return Container(
      padding: EdgeInsets.all(20),
      //color: Colors.green[400],
      height: h,
      //ขอบภาพ
      decoration: BoxDecoration(
          //color: Colors.green[400],
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
              image: NetworkImage(url),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.20), BlendMode.darken))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(name,
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.yellow.shade400,
                  fontWeight: FontWeight.bold)),
          Text(descript,
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.pink[600],
                  fontWeight: FontWeight.bold)),
          SizedBox(
            height: 40,
          ),
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
