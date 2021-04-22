import 'temperatureBrain.dart';
import 'package:flutter/material.dart';

class TemperatureView extends StatelessWidget {

  TextEditingController _inputData = TextEditingController();
  TextEditingController _deviceData = TextEditingController();


  printData(_var) {
    return "coucou" ;
  }


  @override
  Widget build(BuildContext context) {
    final title = 'test';

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: new Container(
        color: Color(0xff258DED),
        height: 400.0,
        alignment: Alignment.center,
        child: new Column(
          children: [
            new Container(
              height: 200.0,
              width: 200.0,
              decoration: new BoxDecoration(
                  image: DecorationImage(
                      image: new AssetImage('assets/logo.png'),
                      fit: BoxFit.fill),
                  shape: BoxShape.circle),
            ),
            new Container(
              child: TextField(
                controller: _inputData,
              ),
            ),
            new Container(
              child: TextField(
                controller: _deviceData,
              ),
            ),
            new Container(
              child: Text(''),
            ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // When the user presses the button, show an alert dialog containing
        // the text that the user has entered into the text field.
        onPressed: () {
          String txt = printData(_inputData);
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                // Retrieve the text the that user has entered by using the
                // TextEditingController.
                content: Text(txt),
              );
            },
          );
        },
        tooltip: 'Show me the value!',
        child: Icon(Icons.text_fields),
      ),
    );

  }
}


