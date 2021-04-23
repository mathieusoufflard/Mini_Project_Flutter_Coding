import 'package:flutter/material.dart';
import 'package:flutter_app/CustomPage.dart';
import 'package:flutter_app/fileSizePage.dart';
import 'package:flutter_app/Controllers/DateDiffPage.dart';
import 'package:flutter_app/numeralConvertPage.dart';
import 'package:flutter_app/promotionPage.dart';
import 'package:flutter_app/romanusPage.dart';
import 'package:flutter_app/AgeCalculator.dart';
import 'package:flutter_app/testPage.dart';
import 'package:flutter_app/temperatureView.dart';
import 'package:flutter_app/distancePage.dart';
import 'package:flutter_app/areaPage.dart';

void main() {
  runApp(MyApp());
}

enum disposision { Grid, List, Card }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  disposision _selection = disposision.Grid;

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          PopupMenuButton<disposision>(
            onSelected: (disposision result) {
              setState(() {
                _selection = result;
              });
              print(_selection.toString());
            },
            itemBuilder: (BuildContext context) =>
                <PopupMenuEntry<disposision>>[
              const PopupMenuItem<disposision>(
                value: disposision.Grid,
                child: Text('GridView'),
              ),
              const PopupMenuItem<disposision>(
                value: disposision.List,
                child: Text('List'),
              ),
              const PopupMenuItem<disposision>(
                value: disposision.Card,
                child: Text('Card'),
              ),
            ],
          )
        ],
      ),
      body: CustomPage().getPage(_selection, context)
    );
  }
}
