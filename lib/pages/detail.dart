import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  //const DetailPage({super.key});
  final V1, V2, V3, V4;
  DetailPage(this.V1, this.V2, this.V3, this.V4); //กำหนดว่าจะมีอะไรบ้าง
  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  var _V1, _V2, _V3, _V4;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _V1 = widget.V1;
    _V2 = widget.V2;
    _V3 = widget.V3;
    _V4 = widget.V4;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [Text(_V1), Text(_V2), Image.network(_V3), Text(_V4)],
        ),
      ),
    );
  }
}
/*json /n/n ใช้เพื่อขึ้นบรรทัดใหม่ข้อมูลต้องเป็นบรรทัดเดียว */