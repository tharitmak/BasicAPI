import 'package:flutter/material.dart';

class Steak extends StatefulWidget {
  const Steak({super.key});

  @override
  State<Steak> createState() => _DetailPageState();
}

class _DetailPageState extends State<Steak> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('เสต็ก')),
      body: ListView(
        children: [Text('วิธีทำ steak')],
      ),
    );
  }
}
