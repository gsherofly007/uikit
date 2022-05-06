import 'package:flutter/material.dart';

///@Description     路由 
///@author          gs
///@create          2022-04-24 18:03 
class RouteManage extends StatefulWidget {
  const RouteManage({Key? key}) : super(key: key);

  @override
  _RouteManageState createState() => _RouteManageState();
}

class _RouteManageState extends State<RouteManage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('xxx'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}