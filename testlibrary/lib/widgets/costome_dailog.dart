import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void cumstomeDailog(BuildContext context, String title , description) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        elevation: 0.0,
        actionsPadding: const EdgeInsets.symmetric(vertical: 30),
        title:  Text(
          title,
        ),
        content:  Text(
          description,
        ),
        actions: [
          GestureDetector(
              onTap: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text(
                'Cancenl',
              )),
          GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Ok',
              )),
        ],
      );
    },
  );
}
