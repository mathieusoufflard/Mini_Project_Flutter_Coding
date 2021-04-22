import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/Controllers/numeralConvertController.dart';

import 'Helpers/inputHelper.dart';
import 'Helpers/converterHelper.dart';

class NumeralConvertPage extends StatefulWidget {
  const NumeralConvertPage({Key? key}) : super(key: key);

  @override
  _NumeralConvertPageState createState() => _NumeralConvertPageState();
}

class _NumeralConvertPageState extends State<NumeralConvertPage> {
  final title = 'Convertisseur numérique';
  String firstDropdownValue = 'DEC';
  String secondDropdownValue = 'BIN';
  NumeralConvertController numeralConvertController =
      new NumeralConvertController();

  String convertValue(String value, String inputUnit, String convertUnit) {
    String decimalValue = "";
    String convertedValue = "";
    if (value.isEmpty) {
      value = "0";
    }
    switch (inputUnit) {
      case 'DEC':
        print("J'ai perdu");
        decimalValue = value;
        break;
      case 'BIN':
        decimalValue = ConverterHelper().binaryToDecimal(value);
        break;
      case 'OCT':
        decimalValue = ConverterHelper().octalToDecimal(value);
        break;
      case 'HEX':
        decimalValue = ConverterHelper().hexaToDecimal(value);
        break;
      default:
        break;
    }

    switch (convertUnit) {
      case 'DEC':
        print("J'ai perdu");
        convertedValue = decimalValue;
        break;
      case 'BIN':
        convertedValue =
            ConverterHelper().decimalToBinary(double.parse(decimalValue));
        break;
      case 'OCT':
        convertedValue =
            ConverterHelper().decimalToOctal(double.parse(decimalValue));
        break;
      case 'HEX':
        convertedValue =
            ConverterHelper().decimalToHexa(double.parse(decimalValue));
        break;
      default:
        break;
    }

    return convertedValue;
  }

  void firstInputOnChanged(String val) {
    setState(() {
      numeralConvertController.secondInputController.text =
          convertValue(val, firstDropdownValue, secondDropdownValue);
    });
  }

  void secondInputOnChanged(String val) {
    setState(() {
      numeralConvertController.firstInputController.text =
          convertValue(val, secondDropdownValue, firstDropdownValue);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.only(
              left: MediaQuery.of(context).size.width / 3.5, top: 60),
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
                      firstInputOnChanged(
                          numeralConvertController.firstInputController.text);
                    },
                    items: <String>['BIN', 'OCT', 'DEC', 'HEX']
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
                      numeralConvertController.firstInputController,
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
                      secondInputOnChanged(
                          numeralConvertController.secondInputController.text);
                    },
                    items: <String>['BIN', 'OCT', 'DEC', 'HEX']
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
                      numeralConvertController.secondInputController,
                      TextInputType.number,
                      false,
                      secondInputOnChanged),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
