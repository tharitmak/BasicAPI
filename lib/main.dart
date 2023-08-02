import 'package:flutter/material.dart';
// import home page
import 'package:layout/pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //เอาคำว่า debug ออก
      home: HomePage(),
    );
  }
}


/*
STL ; widget ที่ไม่มีการเปลี่ยนแปลง 
STF ; widget ที่มีการเปลี่ยนแปลง

 body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          //set icon ของแต่ละหน้า
          BottomNavigationBarItem(icon: (Icon(Icons.home)), label: "หน้าแรก"),
          BottomNavigationBarItem(
              icon: (Icon(Icons.calculate)), label: "คำนวณ"),
          BottomNavigationBarItem(
              icon: (Icon(Icons.contact_mail)), label: "ติดต่อเรา"),
        ],




*/