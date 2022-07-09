// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, sized_box_for_whitespace, use_key_in_widget_constructors

import 'package:flutter/material.dart';

typedef OnTap = void Function();

class RadioTile extends StatelessWidget {
  final String message;
  final OnTap onTap;
  final Widget widget;
  final bool isSelected;

  RadioTile(
      {required this.message,
      required this.onTap,
      required this.widget,
      required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 16.0, right: 16.0, top: 4.0, bottom: 4.0),
      child: InkWell(
        onTap: () => onTap(),
        child: Container(
          width: MediaQuery.of(context).size.width - 30,
          height: 35,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  widget,
                  SizedBox(
                    width: 20.0,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 150,
                    child: Text(
                      message,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                          color: isSelected ? Colors.teal : Color(0xFF20313B),
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0),
                    ),
                  )
                ],
              ),
              isSelected ? checkedIcon(context) : uncheckedIcon(context)
            ],
          ),
        ),
      ),
    );
  }

  Icon checkedIcon(context) => Icon(
        Icons.radio_button_checked,
        color: Colors.teal,
      );

  Icon uncheckedIcon(context) =>
      Icon(Icons.radio_button_off_outlined, color: Colors.black);
}
