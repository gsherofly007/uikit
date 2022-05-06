import 'package:flutter/material.dart';
import 'package:uikit/src/Utils/Utils.dart';
///@Description     自定义按钮 
///@author          gs
///@create          2022-04-25 19:24 
class GSButton extends StatefulWidget {
  const GSButton({Key? key,this.title,this.bgColor,this.borderColor,this.borderRadius,
                  this.width,this.height,this.tapCallBack}) : super(key: key);
  final String? title;
  final Color?  bgColor;
  final Color?  borderColor;
  final double? borderRadius;
  final double? width;//宽度
  final double? height;//高度
  final Param0Callback? tapCallBack;//按钮响应


  @override
  _GSButtonState createState() => _GSButtonState();
}

class _GSButtonState extends State<GSButton> {
  Color? fontColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    Color? fColor = this.fontColor;
    final size =MediaQuery.of(context).size;
    return Container(
        // height: ,
      padding: const EdgeInsets.all(15),
        // color: Colors.red,

        // child:
             // Text(widget.title ?? ""),
        child: GestureDetector(
                onTap: () {
                    // print("点击");
                    selectedFontColor();
                    if (widget.tapCallBack != null){
                        widget.tapCallBack!();
                    }
                  },
                child: Container(
                  padding: const EdgeInsets.all(15),
                  alignment: Alignment(0, 0),
                    // color: Colors.grey,
                  decoration: BoxDecoration(
                    color: widget.bgColor ?? Colors.blue,
                    border: Border.all(color: widget.borderColor?? Colors.grey),
                    // ignore: deprecated_member_use_from_same_package
                    borderRadius: BorderRadius.circular(widget.borderRadius ?? 8),
                  ),
                   //height: 28,
                   width: widget.width ?? size.width,
                  height: widget.height ?? 50,
                  child: Text(widget.title ?? "",
                    style: TextStyle(
                    fontSize:15.0, // 文字大小
                    color:fontColor, // 文字颜色
                  ),
                  ),
                ),
    ),
    );
  }
  //选中改变按钮文字颜色
  selectedFontColor(){
    fontColor = Colors.grey;
    setState(() {


          Future.delayed(const Duration(milliseconds: 100), ()
          {
               fontColor = Colors.white;
               setState(() {
               });

           });

    });
  }
}