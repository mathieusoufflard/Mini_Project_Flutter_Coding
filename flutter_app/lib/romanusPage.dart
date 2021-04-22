import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:romanice/romanice.dart';


class RomanusView extends StatelessWidget {

  TextEditingController decimalData = TextEditingController();
  TextEditingController romanData = TextEditingController();



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
            Text("Chiffre romain "),
            _setInputField(
                "0",
                romanData,
                TextInputType.text,
                ),
            ElevatedButton(onPressed: () {
              if(decimalData.text.isNotEmpty){
                romanData.text = standardToRoman(int.parse(decimalData.text));
              }
              else if(romanData.text.isNotEmpty){
                decimalData.text = standardToRoman.inverse()(romanData.text).toString();
              }
            }, child: Text("Calculer"))
          ],
        ),
      ),
    );
  }
}
