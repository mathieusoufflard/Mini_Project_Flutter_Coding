

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputHelper {

  setInputField(BuildContext context, String hintText, TextEditingController fieldController,
      TextInputType inputType,
      [bool readOnly = false]) {
    return Container(
      width: MediaQuery.of(context).size.width / 5,
      margin: EdgeInsets.all(10),
      child: TextField(
        controller: fieldController,
        keyboardType: inputType,
        inputFormatters: inputType == TextInputType.number
            ? <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp('[0-9.]'))
        ]
            : [],
        decoration: InputDecoration(hintText: hintText),
        readOnly: readOnly,
      ),
    );
  }
}