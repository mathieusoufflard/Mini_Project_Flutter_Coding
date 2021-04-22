import 'package:units_converter/Length.dart';


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:romanice/romanice.dart';

String dropdownValue = 'mètre';
String dropdownValueBottom = 'mètre';



class DistancePage extends StatelessWidget {

  TextEditingController decimalData = TextEditingController();
  TextEditingController romanData = TextEditingController();

  double? selectMesure(value,mesure) {
    value = double?.parse(value);
    var length = Length(removeTrailingZeros: false); //initialize Length object, let's specify that we want to keep the trailing zeros (e.g. 1.00) for stringValue
    var unit = length.inches; //We get all ther others units
    print('name:${unit.name}, value:${unit.value}, stringValue:${unit.stringValue}, symbol:${unit.symbol}');

    switch (mesure) {
      case "kilomètre":
        length.convert(LENGTH.kilometers, value); //We give 1 meter as input
        break;
      case "mètre":
        length.convert(LENGTH.meters, value); //We give 1 meter as input
        break;
      case "decimètre" :
        length.convert(LENGTH.meters, value); //We give 1 meter as input
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
    return unit.value;

}





  @override
  Widget build(BuildContext context) {
    final title = 'Temperature';
    final ToRoman standardToRoman = ToRoman();
    final FromRoman unicodeFromRoman = FromRoman.unicode();

    _setInputField(String hintText, TextEditingController fieldController,
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


    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          children: [
            Text("Chiffre decimal :"),
            _setInputField("0",
                decimalData, TextInputType.number),
            MyStatefulWidget(),
            MyStatefulWidget(),
            Text("Chiffre romain "),
            _setInputField(
              "0",
              romanData,
              TextInputType.text,
            ),
            ElevatedButton(onPressed: () {
              double? mesure = selectMesure(decimalData.text,dropdownValue);
              romanData.text = mesure.toString();
              print('coucou '+dropdownValue);
            }, child: Text("Calculer"))
          ],
        ),
      ),
    );
  }

}


class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {

  /*_MyStatefulWidgetState(isDropDownTop){
    isDropDownTop = this.isDropDownTop;
}*/

  /*bool get isDropDownTop {
    return isDropDownTop;
  }

  void set isDropDownTop(bool isDropDownTop) {
    isDropDownTop = isDropDownTop;
  }*/


  @override
  Widget build(BuildContext context) {
    //print(this.isDropDownTop);
    //String isDropped = this.isDropDownTop ? dropdownValue : dropdownValueBottom;

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
          dropdownValue = newValue! ;
         // this.isDropDownTop ? dropdownValue = newValue! : dropdownValueBottom = newValue!;
        });
      },
      items: <String>['kilomètre', 'mètre','decimètre','centimètre', 'milimètre','nanomètre', 'yard','pied','pouce']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
