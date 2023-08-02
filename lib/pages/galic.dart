import 'package:flutter/material.dart';

class Galic extends StatefulWidget {
  const Galic({super.key});

  @override
  State<Galic> createState() => _DetailPageState();
}

class _DetailPageState extends State<Galic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('หมูทอดกระเทียม')),
      body: ListView(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('นี้คือวิธีทำหมูทอดกระเทียม',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900))
          ],
        )
      ]),
    );
  }
}
