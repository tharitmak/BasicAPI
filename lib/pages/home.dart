import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:layout/pages/detail.dart';
import 'package:layout/pages/galic.dart';
import 'package:layout/pages/steak.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class HomePage extends StatefulWidget {
  // const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // --------------------------------------------------ตัวแปรรรร----------------------------------------------------
  var steak =
      ('https://cdn.pixabay.com/photo/2017/11/10/15/04/steak-2936531_1280.jpg');
  var garic =
      ('https://media.istockphoto.com/id/1143864356/th/%E0%B8%A3%E0%B8%B9%E0%B8%9B%E0%B8%96%E0%B9%88%E0%B8%B2%E0%B8%A2/%E0%B8%82%E0%B9%89%E0%B8%B2%E0%B8%A7%E0%B8%AB%E0%B8%A1%E0%B8%B9%E0%B8%9C%E0%B8%B1%E0%B8%94%E0%B8%AD%E0%B8%B2%E0%B8%AB%E0%B8%B2%E0%B8%A3%E0%B9%84%E0%B8%97%E0%B8%A2.jpg?s=1024x1024&w=is&k=20&c=pOSbzilBwAqE-O-Ius7xQo7TQpU3szuwhs7a8VHPYYA=');
  var page_galic = Galic();
  var Page_steak = Steak();

  // --------------------------------------------------ตัวแปรรรร----------------------------------------------------

  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'F(00)D',
                style: TextStyle(fontSize: 30, color: Colors.amber.shade50),
              ),
            ],
          ),
          backgroundColor: Colors.red.shade900,
        ),
        body: Padding(
            padding: EdgeInsets.all(50),
            child: FutureBuilder(
              builder: (context, AsyncSnapshot snapshot) {
                //var data = json.decode(snapshot.data.toString());
                return ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return MyBox(
                      //ก่อนใช้ future: getData(),
                      // data[index]['title'],
                      // data[index]['subtitle'],
                      // data[index]['image_url'],
                      // data[index]['detail'],
                      // หลังใช้จะเป็น
                      snapshot.data[index]['title'],
                      snapshot.data[index]['subtitle'],
                      snapshot.data[index]['image_url'],
                      snapshot.data[index]['detail'],
                    );
                  },
                  itemCount: snapshot.data.length, //นับจำนวน data
                );
              },
              // ดึงข้อมูลจากเครื่อง json มา => ส่งไปที่ snapshot [{},{},{}]=> เปลี่ยเป็น String
              //future:DefaultAssetBundle.of(context).loadString('assets/data.json'),
              //เปลี่ยนเป็นอันใหม่อยู่(ด้านล่าง)
              future: getData(),
            )));
    return scaffold;
  }

  //---------------------------------------------------- WIDGET MYBOX -----------------------------------------------------
  Widget MyBox(
    String title,
    String subtitle,
    String image_url,
    //var NextPage,
    String detail,
  ) {
    //---------------------------------------------------------------------------------------------------------------------
    //---------------------------------------- STRUCTURE OF CONTAINER -------------------------------------------
    var V1, V2, V3, V4;
    V1 = title;
    V2 = subtitle;
    V3 = image_url;
    V4 = detail;

    return Container(
      margin: EdgeInsets.all(20), // ระยะห่างจากขอบนอกไปข้างนอก
      padding: EdgeInsets.all(20), // ระยะห่างภายในกล่องกับข้อความ
      // color: Color.fromARGB(255, 171, 224, 255), กรณีไม่มี decoration
      height: 250,
      decoration: BoxDecoration(
        //color: Color.fromARGB(255, 171, 224, 255), กรณีมี decoration
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
            image: NetworkImage(image_url),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.grey.withOpacity(0.4), BlendMode.saturation)
            //Colors.white70.withOpacity(0.1618), BlendMode.color),
            ),
      ),
      //-----------------------------------------------------------------------------------------------------------

      //------------------------------------- STRUCTURE OF DETAIL IN CONTAINER---------------------------------------------
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, //แนวหลัก
        crossAxisAlignment: CrossAxisAlignment.center, //แนวรอง
        // column แนวตั้ง
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(subtitle,
              style: TextStyle(
                fontSize: 15,
              )),
          SizedBox(height: 12),
          //-------------------------------------- BUTTON ----------------------------------------------
          TextButton(
            onPressed: () {
              print('Next Page');
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailPage(V1, V2, V3, V4)));
            },
            //---------------------------------------------------------------------------------------------
            child: Text(
              'ทำกันเลย',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  color: Color.fromARGB(255, 243, 8, 8)),
            ),
          )
        ],
      ),
    );
  }

  // เรียกข้อมมูลจาก เวป ตรงนี้ใช้ Github
  //async = ใช้เวลาในการดาวโหลดและเรียกแอพพร้อมกัน
  Future getData() async {
    //https://raw.githubusercontent.com/tharitmak/BasicAPI/main/data.json
    var url = Uri.https(
        'raw.githubusercontent.com', '/tharitmak/BasicAPI/main/data.json');
    var response = await http.get(url);
    var result = json.decode(response.body);
    return result;
  }
}




// 'https://media.istockphoto.com/id/1143864356/th/%E0%B8%A3%E0%B8%B9%E0%B8%9B%E0%B8%96%E0%B9%88%E0%B8%B2%E0%B8%A2/%E0%B8%82%E0%B9%89%E0%B8%B2%E0%B8%A7%E0%B8%AB%E0%B8%A1%E0%B8%B9%E0%B8%9C%E0%B8%B1%E0%B8%94%E0%B8%AD%E0%B8%B2%E0%B8%AB%E0%B8%B2%E0%B8%A3%E0%B9%84%E0%B8%97%E0%B8%A2.jpg?s=1024x1024&w=is&k=20&c=pOSbzilBwAqE-O-Ius7xQo7TQpU3szuwhs7a8VHPYYA='
// https://cdn.pixabay.com/photo/2017/11/10/15/04/steak-2936531_1280.jpg