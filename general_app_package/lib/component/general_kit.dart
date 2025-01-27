import 'package:flutter/material.dart';

Widget kit(BuildContext context, Widget header, DropdownButton optionList) {
  return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            margin: const EdgeInsets.all(4),
            child: header,
          ),
          optionList,
        ],
      ));
}
