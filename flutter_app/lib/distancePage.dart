import 'package:flutter_app/Helpers/inputHelper.dart';
import 'package:units_converter/Length.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:romanice/romanice.dart';

class DistancePage extends StatefulWidget {
  const DistancePage({Key? key}) : super(key: key);

  @override
  _DistancePageState createState() => _DistancePageState();
}

class _DistancePageState extends State<DistancePage> {
  TextEditingController firstInputController = TextEditingController();
  TextEditingController secondInputController = TextEditingController();
  String dropdownValue = 'mètre';
  String dropdownValueBottom = 'mètre';
  String valueTop = "";

  double? selectMesure(value, mesure, type) {
    value = double?.parse(value);
    var length = Length(
        removeTrailingZeros:
            false); //initialize Length object, let's specify that we want to keep the trailing zeros (e.g. 1.00) for stringValue
    late var unit; //We get all ther others units
    //var unit = length.kilometers; //We get all ther others units
    //print('name:${unit.name}, value:${unit.value}, stringValue:${unit.stringValue}, symbol:${unit.symbol}');
    print('type: ${type}');

    switch (mesure) {
      case "kilomètre":
        length.convert(LENGTH.kilometers, value); //We give 1 meter as input
        break;
      case "mètre":
        length.convert(LENGTH.meters, value); //We give 1 meter as input
        break;
      case "decimètre":
        length.convert(LENGTH.meters, (value / 10)); //We give 1 meter as input
        break;
      case "centimètre":
        length.convert(LENGTH.centimeters, value); //We give 1 meter as input
        break;
      case "milimètre":
        length.convert(LENGTH.millimeters, value); //We give 1 meter as input
        break;
      case "nanomètre":
        length.convert(LENGTH.nanometers, value); //We give 1 meter as input
        break;
      case "yard":
        length.convert(LENGTH.yards, value); //We give 1 meter as input
        break;
      case "pied":
        length.convert(LENGTH.feet, value); //We give 1 meter as input
        break;
      case "pouce":
        length.convert(LENGTH.inches, value); //We give 1 meter as input
        break;
    }

    switch (type) {
      case "kilomètre":
        unit = length.kilometers; //We give 1 meter as input
        break;
      case "mètre":
        unit = length.meters;
        break;
      case "decimètre":
        unit = (length.meters);
        return (unit.value) * 10;
        break;
      case "centimètre":
        unit = length.centimeters;
        break;
      case "milimètre":
        unit = length.millimeters;
        break;
      case "nanomètre":
        unit = length.nanometers;
        break;
      case "yard":
        unit = length.yards;
        break;
      case "pied":
        unit = length.feet;
        break;
      case "pouce":
        unit = length.inches;
        break;
      default:
        unit = length.meters;
    }
    return unit.value;
  }

  String convertValue(String value, String inputUnit, String convertUnit) {
    double convertedValue = 0;
    if (value.isEmpty) {
      value = "0";
    }
    double valueToConvert = double.parse(value);
    var length = Length(removeTrailingZeros: false);
    late var unit;
    switch (inputUnit) {
      case "kilomètre":
        length.convert(
            LENGTH.kilometers, valueToConvert); //We give 1 meter as input
        break;
      case "mètre":
        length.convert(
            LENGTH.meters, valueToConvert); //We give 1 meter as input
        break;
      case "decimètre":
        length.convert(
            LENGTH.meters, (valueToConvert / 10)); //We give 1 meter as input
        break;
      case "centimètre":
        length.convert(
            LENGTH.centimeters, valueToConvert); //We give 1 meter as input
        break;
      case "milimètre":
        length.convert(
            LENGTH.millimeters, valueToConvert); //We give 1 meter as input
        break;
      case "nanomètre":
        length.convert(
            LENGTH.nanometers, valueToConvert); //We give 1 meter as input
        break;
      case "yard":
        length.convert(LENGTH.yards, valueToConvert); //We give 1 meter as input
        break;
      case "pied":
        length.convert(LENGTH.feet, valueToConvert); //We give 1 meter as input
        break;
      case "pouce":
        length.convert(
            LENGTH.inches, valueToConvert); //We give 1 meter as input
        break;
    }

    switch (convertUnit) {
      case "kilomètre":
        unit = length.kilometers; //We give 1 meter as input
        break;
      case "mètre":
        unit = length.meters;
        break;
      case "decimètre":
        unit = (length.meters);
        unit.value *= 10;
        break;
      case "centimètre":
        unit = length.centimeters;
        break;
      case "milimètre":
        unit = length.millimeters;
        break;
      case "nanomètre":
        unit = length.nanometers;
        break;
      case "yard":
        unit = length.yards;
        break;
      case "pied":
        unit = length.feet;
        break;
      case "pouce":
        unit = length.inches;
        break;
      default:
        unit = length.meters;
    }
    print(unit.value);
    return unit.value.toStringAsFixed(2);
  }

  createUpDropdown() {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
          // this.isDropDownTop ? dropdownValue = newValue! : dropdownValueBottom = newValue!;
        });
        bottomDropDownOnChanged(secondInputController.text);
      },
      items: <String>[
        'kilomètre',
        'mètre',
        'decimètre',
        'centimètre',
        'milimètre',
        'nanomètre',
        'yard',
        'pied',
        'pouce'
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  createBottomDropDown() {
    return DropdownButton<String>(
      value: dropdownValueBottom,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValueBottom = newValue!;
        });
        upDropDownOnChanged(secondInputController.text);
      },
      items: <String>[
        'kilomètre',
        'mètre',
        'decimètre',
        'centimètre',
        'milimètre',
        'nanomètre',
        'yard',
        'pied',
        'pouce'
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  void upDropDownOnChanged(String val) {
    setState(() {
      secondInputController.text =
          convertValue(val, dropdownValue, dropdownValueBottom);
    });
  }

  void bottomDropDownOnChanged(String val) {
    setState(() {
      firstInputController.text =
          convertValue(val, dropdownValueBottom, dropdownValue);
    });
  }

  @override
  Widget build(BuildContext context) {
    final title = 'Distance';

    //printData(title);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          children: [
            Text("Chiffre decimal :"),
            InputHelper().setInputField(context, "0", firstInputController,
                TextInputType.number, false, upDropDownOnChanged),
            createUpDropdown(),
            createBottomDropDown(),
            Text("Resultat "),
            InputHelper().setInputField(context, "0", secondInputController,
                TextInputType.text, false, bottomDropDownOnChanged),
            /*ElevatedButton(
                onPressed: () {
                  double? mesure = selectMesure(
                      firstInputController.text, dropdownValue, dropdownValueBottom);
                  secondInputController.text = mesure!.toStringAsExponential(3);
                  print('coucou ' + dropdownValue);
                },
                child: Text("Calculer"))*/
          ],
        ),
      ),
    );
  }
}
