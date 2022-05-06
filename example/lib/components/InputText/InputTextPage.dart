import 'package:flutter/material.dart';
// import 'package:uikit/uikit.dart';
 import 'package:uikit/src/components/InputText/InputText.dart';
///@Description     输入文本样式1 
///@author          gs
///@create          2022-04-24 07:02 
class InputTextPage extends StatefulWidget {
  // const InputText({Key? key, this.title}) : super(key: key);
  const InputTextPage(this.title);
  final title;


  @override
  _InputTextPageState createState() => _InputTextPageState();
}

class _InputTextPageState extends State<InputTextPage> {
  final FocusNode oneNode = FocusNode();
  final FocusNode twoNode = FocusNode();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('InputText案例'),
      ),
      // body: SingleChildScrollView(
      //   child: Column(
      //     children:  <Widget>[
      //       // Text("账号"),
      //     // Container(
      //       SizedBox(height: 50,),
      //       InputText(title: "账号",hint: "请输入",onInputSubmit:
      //       (String text){
      //         print("已输入文本"+text);
      //       },
      //         onTextChange: onChange,
      //         focusNode: FocusNode(),
      //      )
      //
      //      ],
      //   ),
      // ),
      body: GestureDetector(
      onTap: () {
          print("单击空白");
          oneNode.unfocus();
          twoNode.unfocus();
      },
        // child: Container(
        //   color: Colors.transparent,
        //   alignment: Alignment.center,
        //   child: TextField(
        //     focusNode: focusNode,
        //   ),
        // ),

      child:Container(
        color: Colors.transparent,
        alignment: Alignment.topLeft,
      child:
      SingleChildScrollView(

        child: Column(
          children:  <Widget>[
            // Text("账号"),
            // Container(
            SizedBox(height: 50,),
            InputText(title: "账号",textStyle: TextStyle(color: Colors.grey,fontSize: 12.0),hint: "请输入",onInputSubmit:
                (String text){

              print("已输入文本"+text);
            },
              onTextChange: onChange,
              focusNode: oneNode,
            ),
            InputText(title: "账号",hint: "请输入",onInputSubmit:
                (String text){
              print("已输入文本"+text);
            },
              onTextChange: onChange,
              focusNode: twoNode,
            )
          ],
        ),
      ),
      ),
      )
    );

  }
  Widget titleWidget(){
    return  Container(
        padding: const EdgeInsets.only(top: 10.0,left: 30.0,right: 10.0),
    color: Colors.red,
    child: Row(children:[],

    ));
  }
  //文本变化
  void onChange(String text){
    print("文本变化"+text);
  }

}