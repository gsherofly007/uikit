import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:uikit/src/Utils/Utils.dart';

///@Description     弹框 
///@author          gs
///@create          2022-05-04 08:47 
class Alert{

  static  show(
      BuildContext context,String tip,String message,Param0Callback okCallback,Param0Callback cancelCallback)
  {
    if (Platform.isIOS) {
      showCupertinoDialog(
          context: context,
         builder: (context) {
            return CupertinoAlertDialog(
            title: Text(tip),
            content: Text(message),
            actions: [

            CupertinoDialogAction(
              child: Text('取消'),
              onPressed: () {
                Navigator.of(context).pop();
                cancelCallback();
              },
            ),
            CupertinoDialogAction(
              child: Text('确定'),
              onPressed: () {
                Navigator.of(context).pop();
                okCallback();
              },
            ),
          ],
          insetAnimationDuration: Duration(seconds: 2),
        );

      },
    );
    }else{
      showDialog<String>(
          context: context,
          barrierDismissible:false,
          builder: (context) {
            return AlertDialog(
              title: Text(tip),
              content: Text(message),
              actions: <Widget>[
                FlatButton(
                  child: Text('确定'),
                  onPressed: () {
                    Navigator.of(context).pop();
                    okCallback();
                  },
                ),
                FlatButton(
                  child: Text('取消'),
                  onPressed: () {
                    Navigator.of(context).pop();
                    cancelCallback();
                  },
                )
              ],
            );
    });
  }
  }
}
