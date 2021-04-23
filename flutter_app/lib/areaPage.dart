import 'package:units_converter/Length.dart';
import 'package:units_converter/Area.dart';


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:romanice/romanice.dart';

String dropdownValue = 'hectares';
String dropdownValueBottom = 'hectares';



class AreaPage extends StatelessWidget {

  TextEditingController decimalData = TextEditingController();
  TextEditingController romanData = TextEditingController();

  double? selectMesure(value,mesure,type) {
    var area = Area(removeTrailingZeros: false);
    value = double?.parse(value);
    late var unit ; //We get all ther others units
    //var unit = length.kilometers; //We get all ther others units
    //print('name:${tempo.name}, value:${tempo.value}, stringValue:${tempo.stringValue}, symbol:${tempo.symbol}');
    print('type: ${type}');

    switch (mesure) {
      case "hectares":
        area.convert(AREA.hectares, value);
        break;
      case "acres":
        area.convert(AREA.acres, value);
        break;
      case "are" :
        area.convert(AREA.are, value);
        break;
      case "kilomètre²":
        area.convert(AREA.square_kilometers, value);
        break;
      case "mètre²":
        area.convert(AREA.square_meters, value);
        break;
      case "centimètre²":
        area.convert(AREA.square_centimeters, value);
        break;
      case "milimètre²":
        area.convert(AREA.square_millimeters, value);
        break;
      case "yard²":
        area.convert(AREA.square_yard, value);
        break;
      case "pied²":
        area.convert(AREA.square_feet, value);
        break;
      case "pouce²":
        area.convert(AREA.square_inches, value);
        break;

    }

    switch (type) {
      case "hectares":
        unit = area.hectares;
        break;
      case "acres":
        unit = area.acres;
        break;
      case "are" :
        unit = area.are;
        break;
      case "kilomètre²":
        unit = area.square_kilometers;
        break;
      case "mètre²":
        unit = area.square_meters;
        break;
      case "centimètre²":
        unit = area.square_centimeters;
        break;
      case "milimètre²":
        unit = area.square_millimeters;
        break;
      case "yard²":
        unit = area.square_yard;
        break;
      case "pied²":
        unit = area.square_feet;
        break;
      case "pouce²":
        unit = area.square_inches;
        break;

    }
    return unit.value;

  }


  @override
  Widget build(BuildContext context) {
    final title = 'Area';
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
            MyStatefulWidgetDown(),
            Text("Resultat "),
            _setInputField(
              "0",
              romanData,
              TextInputType.text,false
            ),
            ElevatedButton(onPressed: () {
              double? mesure = selectMesure(decimalData.text,dropdownValue,dropdownValueBottom);
              romanData.text = mesure!.toStringAsExponential(3);
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
      items: <String>["hectares", "acres", "are" , "kilomètre²", "mètre²", "centimètre²", "milimètre²", "yard²", "pied²", "pouce²"]
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

class MyStatefulWidgetDown extends StatefulWidget {
  const MyStatefulWidgetDown({Key? key}) : super(key: key);

  @override
  _MyStatefulWidgetStateDown createState() => _MyStatefulWidgetStateDown();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetStateDown extends State<MyStatefulWidgetDown> {


  @override
  Widget build(BuildContext context) {
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
          dropdownValueBottom = newValue! ;
        });
      },
      items: <String>["hectares", "acres", "are" , "kilomètre²", "mètre²", "centimètre²", "milimètre²", "yard²", "pied²", "pouce²"]
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

