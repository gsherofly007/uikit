import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';
// import 'package:uikit/src/components/Button/GSButton.dart';
///@Description     自定义按钮列表 
///@author          gs
///@create          2022-04-25 19:33 
class ButtonPage extends StatefulWidget {
  //const ButtonPage({Key? key,this.title}) : super(key: key);
  ButtonPage(this.title);
  final String title;
  @override
  _ButtonPageState createState() => _ButtonPageState();
}

class _ButtonPageState extends State<ButtonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children:  <Widget>[
            GSButton(title: "自定义按钮"),
            GSButton(title: "自定义按钮1",width: 130,height: 50,bgColor: Colors.red,borderColor: Colors.transparent,
              tapCallBack: (){
                  print("自定义按钮响应");
                  _logoutClick();
              },
            ),
          ]),
        ),
      );
  }
  _logoutClick(){

  }
}