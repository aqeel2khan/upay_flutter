// import 'dart:html';

import 'package:flutter/cupertino.dart';

class DeleteAlertDialog extends StatelessWidget {
  String? _title;
  String? _content;
  Function? _cancelPressed;
  Function? _deletePressed;
  String? _buttonName;

  DeleteAlertDialog({required String title,required String content,required Function cancelPressed,required Function deletePressed,
    required String buttonName}){
    this._title = title;
    this._content = content;
    this._cancelPressed = cancelPressed;
    this._deletePressed = deletePressed;
    this._buttonName = buttonName;

  }

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title:  Text(_title!),
      content:  Text(_content!),
      actions: <Widget>[
        CupertinoDialogAction(
          onPressed: () {
            _cancelPressed!();
          },
          child: const Text('Cancel'),
        ),
        CupertinoDialogAction(
          onPressed: () {
            _deletePressed!();
            getStringValuesSF();
          },
          child:  Text(_buttonName.toString()),
        ),
      ],
    );

  }
  getStringValuesSF() async {


  }
}
