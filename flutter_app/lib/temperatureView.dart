import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/temperatureBrain.dart';

class TemperatureView extends StatelessWidget {

  TextEditingController initPriceController = TextEditingController();
  TextEditingController promoRateController = TextEditingController();
  TextEditingController promoValueController = TextEditingController();
  TextEditingController finalPriceController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final title = 'Promotion';
    TemperatureBrain temperatureBrain = new TemperatureBrain();

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
            Text("Degré :"),
            _setInputField("0",
                initPriceController, TextInputType.number),
            Text("Type de degré "),
            _setInputField("0",
                promoRateController, TextInputType.text),
            Text("Type de dégré converti"),
            _setInputField(
                "0",
                promoValueController,
                TextInputType.text),
            Text("Degré converti "),
            _setInputField(
                "0",
                finalPriceController,
                TextInputType.number,
                true),
            ElevatedButton(onPressed: () {
              finalPriceController.text = temperatureBrain.getConversion(initPriceController.text,promoRateController.text,promoValueController.text);
            }, child: Text("Calculer"))
          ],
        ),
      ),
    );
  }
}
