import 'package:flutter/material.dart';

class Test extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final title = 'test';

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Text("test"),

        ),
      );
  }
}