import 'dart:ffi';

import 'package:flutter/material.dart';

/// 输入框输入变化的监听
typedef InputTextChangeCallback = void Function(String input);

/// 输入框提交的监听
typedef InputTextSubmitCallback = void Function(String input);

/// 输入完成点击键盘监听
typedef InputTextEditingCompleteCallback = Function(String input);
///@Description     输入文本样式1 
///@author          gs
///@create          2022-04-24 07:02 
class InputText extends StatefulWidget {
  const InputText({Key? key, this.title,this.textStyle, this.hint,
                    this.onInputSubmit,this.onTextChange,
                    this.inputBgColor,this.inputBorderColor
                   ,this.inputWidth,this.inputHeight,this.borderRadius,
                    this.focusNode}) : super(key: key);
  /// 搜索框输入内容改变时候的回调函数
  final InputTextChangeCallback? onTextChange;

  /// 点击确定后的回调
  final InputTextSubmitCallback? onInputSubmit;
  // const InputText(this.title);
  final String? title;
  final TextStyle? textStyle;//标题文本样式
  final String? hint;
  final Color?  inputBgColor;//输入文本背景框
  final Color?  inputBorderColor;//边框
  final double?  inputWidth;//宽度
  final double?  inputHeight;//高度
  final double?  borderRadius;//边框圆角
  final FocusNode? focusNode;
  /// 用于对 TextField  更精细的控制，若传入该字段，[textString] 参数将失效，可使用 TextEditingController.text 进行赋值。
  // final TextEditingController? textEditingController;
  @override
  _InputTextState createState() => _InputTextState();

}

class _InputTextState extends State<InputText> {



  @override
  Widget build(BuildContext context) {
    return _textInputWidget(context);
}
  Widget _textInputWidget(BuildContext context){

    return Container(
        // height: ,
      padding: const EdgeInsets.only (left: 15,right: 15),

      child:
          Row(
            children:   <Widget>[
          //标题
          Text(widget.title ?? "标题", textAlign: TextAlign.left,style:widget.textStyle),
              const SizedBox(width:20),
              //在这里套了个Expanded
              // ignore: prefer_const_constructors
              Expanded(child:
                  Container(
                    decoration: BoxDecoration(
                      color: widget.inputBgColor ?? Colors.transparent,
                      border: Border.all(color: widget.inputBorderColor?? Colors.grey),
                      // ignore: deprecated_member_use_from_same_package
                      borderRadius: BorderRadius.circular(widget.borderRadius ?? 10),
                    ),
                    child:
                     //输入框
                      TextField(
                         // controller: _controller,
                        style: TextStyle(fontSize: widget.textStyle?.fontSize),
                        focusNode: widget.focusNode
                          ,

                          decoration:  InputDecoration(
                           hintText: widget.hint,
                            hintStyle: TextStyle(fontSize: widget.textStyle?.fontSize),
                            contentPadding: const EdgeInsets.only(left: 15.0),
                            // border: InputBorder.none,
                            border: const OutlineInputBorder(borderSide: BorderSide.none),
                          ),
                        onSubmitted: (text) {
                          if(widget.focusNode != null) {
                            widget.focusNode?.nextFocus();
                          }
                          if (widget.onInputSubmit != null) {
                           widget.onInputSubmit!(text);
                          }
                        },

                        onChanged: (text) {
                          if (widget.onTextChange != null) {
                            widget.onTextChange!(text);
                          }
                        },
                       ),
                  )

              )
            ]
    ),
      );
  }
}
