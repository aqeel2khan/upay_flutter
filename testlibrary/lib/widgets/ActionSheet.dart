
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custome_text.dart';

class ActionSheet{

  final double _kItemExtent = 32.0;
  final int _selectedFruit = 0;
  final List<String> _fruitNames = <String>[
    'Apple',
    'Mango',
    'Banana',
    'Orange',
    'Pineapple',
    'Strawberry',
  ];
  /*
  Created By Jawed Akhtar
  created date - 15 feb 2023
  This shows a CupertinoModalPopup which hosts a CupertinoActionSheet.*/

  static void showActionSheet(BuildContext context,String title,String description,Function galleryPressed,Function cameraPressed) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title:  CustomText(title,size: 16,color: Colors.black,weight: FontWeight.w500,),
        //message:  Text(description),
        actions: <CupertinoActionSheetAction>[
          CupertinoActionSheetAction(
            isDefaultAction: false,
            onPressed: () {
             // galleryPressed();
            },
            child:  CustomText('Gallery',size: 14,color: Colors.black,),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              //cameraPressed();
            },
            child:  CustomText('Camera',size: 14,color: Colors.black,),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          onPressed: () {
            Navigator.pop(context);
          },
          child: CustomText('Cancel', size: 14,color: Colors.red,),
        ),
      ),
    );
  }

  // This shows a CupertinoModalPopup with a reasonable fixed height which hosts CupertinoPicker.
 static void showDialog(Widget child, BuildContext context) {
    showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => Container(
          height: 216,
          padding: const EdgeInsets.only(top: 6.0),
          // The Bottom margin is provided to align the popup above the system navigation bar.
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          // Provide a background color for the popup.
          color: CupertinoColors.systemBackground.resolveFrom(context),
          // Use a SafeArea widget to avoid system overlaps.
          child: SafeArea(
            top: false,
            child: child,
          ),
        ));
  }
  /*
  *
  CupertinoPicker(
                  magnification: 1.22,
                  squeeze: 1.2,
                  useMagnifier: true,
                  itemExtent: _kItemExtent,
                  // This is called when selected item is changed.
                  onSelectedItemChanged: (int selectedItem) {
                    setState(() {
                      _selectedFruit = selectedItem;
                    });
                  },
                  children:
                  List<Widget>.generate(_fruitNames.length, (int index) {
                    return Center(
                      child: Text(
                        _fruitNames[index],
                      ),
                    );
                  }),
                ), context, ),
              child: const Text('Cupertino Picker'),
  * */
}