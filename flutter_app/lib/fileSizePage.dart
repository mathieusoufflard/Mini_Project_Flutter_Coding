import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/Controllers/fileSizeController.dart';

import 'Helpers/inputHelper.dart';

class FileSizePage extends StatefulWidget {
  const FileSizePage({Key? key}) : super(key: key);

  @override
  _FileSizePageState createState() => _FileSizePageState();
}

class _FileSizePageState extends State<FileSizePage> {
  final title = 'Taille de fichiers';
  String firstDropdownValue = 'O';
  String secondDropdownValue = 'O';
  FileSizeController fileSizeController = new FileSizeController();

  String updateFileSize(String value, String inputUnit, String convertUnit) {
    double convertedValue = 0;
    if (value.isEmpty) {
      value = "0";
    }
    double valueToConvert = double.parse(value);
    Map<String, int> unitValue = {
      'O': 0,
      'Ko': 1,
      'Mo': 2,
      'Go': 3,
      'To': 4,
      'Po': 5
    };
    int convertInterval;
    convertInterval =
        unitValue[inputUnit]!.toInt() - unitValue[convertUnit]!.toInt();
    if (convertInterval == 0) {
      convertedValue = valueToConvert;
    } else if (convertInterval > 0) {
      String multiplyIndex = "1";
      for (int i = 0; i < convertInterval; i++) {
        multiplyIndex += "000";
      }
      convertedValue = valueToConvert * int.parse(multiplyIndex);
    } else if (convertInterval < 0) {
      String multiplyIndex = "1";
      for (int i = 0; i > convertInterval; i--) {
        multiplyIndex += "000";
      }
      convertedValue = valueToConvert / int.parse(multiplyIndex);
    }
    return convertedValue.toString();
  }

  void firstInputOnChanged(String val) {
    setState(() {
      fileSizeController.secondInputController.text = updateFileSize(
          val,
          firstDropdownValue,
          secondDropdownValue);
    });
  }

  void secondInputOnChanged(String val) {
    setState(() {
      fileSizeController.firstInputController.text = updateFileSize(
          val,
          secondDropdownValue,
          firstDropdownValue);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Row(
          children: [
            Column(
              children: [
                DropdownButton(
                  value: firstDropdownValue,
                  onChanged: (String? newValue) {
                    setState(() {
                      firstDropdownValue = newValue!;
                    });
                    firstInputOnChanged(fileSizeController.firstInputController.text);
                  },
                  items: <String>['O', 'Ko', 'Mo', 'Go', 'To', 'Po']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                InputHelper().setInputField(
                    context,
                    "0",
                    fileSizeController.firstInputController,
                    TextInputType.number,
                    false,
                    firstInputOnChanged),
              ],
            ),
            Column(
              children: [
                DropdownButton(
                  value: secondDropdownValue,
                  onChanged: (String? newValue) {
                    setState(() {
                      secondDropdownValue = newValue!;
                    });
                    secondInputOnChanged(fileSizeController.secondInputController.text);
                  },
                  items: <String>['O', 'Ko', 'Mo', 'Go', 'To', 'Po']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                InputHelper().setInputField(
                    context,
                    "0",
                    fileSizeController.secondInputController,
                    TextInputType.number,
                    false,
                    secondInputOnChanged),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
