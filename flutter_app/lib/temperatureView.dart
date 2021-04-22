import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/temperatureController.dart';

class TemperatureView extends StatelessWidget {

  TextEditingController initPriceController = TextEditingController();
  TextEditingController typeDegreeTop = TextEditingController();
  TextEditingController typeDegreeBottom = TextEditingController();
  TextEditingController finalPriceController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final title = 'Temperature';
    TemperatureController temperatureController = new TemperatureController();

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
            _setInputField("celsius",
                typeDegreeTop, TextInputType.text),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children :<Widget>[
                IconButton(
                  icon: Image.asset('assets/images/icon-kalvin.png'),
                  tooltip: 'Kelvin',
                  onPressed: () {
                    typeDegreeTop.text = 'kelvin';
                  },
                ),
                IconButton(
                  icon: Image.asset('assets/images/icon-fahrenheit.png'),
                  tooltip: 'Fahrenheit',
                  onPressed: () {
                    typeDegreeTop.text = 'fahrenheit';

                  },
                ),
                IconButton(
                  icon: Image.asset('assets/images/icon-celsius.png'),
                  tooltip: 'Celsius',
                  onPressed: () {
                    typeDegreeTop.text = 'celsius';

                  },
                ),
              ],
            ),
              Text("Type de dégré converti"),
              _setInputField(
                  "fahrenheit",
                  typeDegreeBottom,
                  TextInputType.text),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children :<Widget>[
                IconButton(
                  icon: Image.asset('assets/images/icon-kalvin.png'),
                  tooltip: 'Kelvin',
                  onPressed: () {
                    typeDegreeBottom.text = 'kelvin';
                  },
                ),
                IconButton(
                  icon: Image.asset('assets/images/icon-fahrenheit.png'),
                  tooltip: 'Fahrenheit',
                  onPressed: () {
                    typeDegreeBottom.text = 'fahrenheit';

                  },
                ),
                IconButton(
                  icon: Image.asset('assets/images/icon-celsius.png'),
                  tooltip: 'Celsius',
                  onPressed: () {
                    typeDegreeBottom.text = 'celsius';

                  },
                ),
              ],
            ),

            Text("Degré converti "),
            _setInputField(
                "0",
                finalPriceController,
                TextInputType.number,
                true),
            ElevatedButton(onPressed: () {
              finalPriceController.text = temperatureController.getConversion(initPriceController.text,typeDegreeTop.text,typeDegreeBottom.text);
            }, child: Text("Calculer"))
          ],
        ),
      ),
    );
  }
}
