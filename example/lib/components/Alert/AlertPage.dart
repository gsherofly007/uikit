import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';
///@Description     对话框案例 
///@author          gs
///@create          2022-05-04 08:13 
class AlertPage extends StatefulWidget {
  const AlertPage({Key? key}) : super(key: key);

  @override
  _AlertPageState createState() => _AlertPageState();
}

class _AlertPageState extends State<AlertPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('弹框'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [ GSButton(title: "弹框",width: 130,height: 50,bgColor: Colors.red,borderColor: Colors.transparent,
            tapCallBack: (){
              print("自定义按钮响应");
              Alert.show(context,"提示","消息阿斯顿法师法师打发斯蒂芬",(){
                  print("成功");
              },(){
                  print("失败");
              });
            },
          ),],
        ),
      ),
    );
  }
}