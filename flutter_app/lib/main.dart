import 'package:flutter/material.dart';
import 'package:flutter_app/testPage.dart';

void main() {
  runApp(MyApp());
}

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

  String textItem(int index)
  {
    switch (index){
      case 0 :
        return "1 HONK";
        break;
      case 1 :
        return "2 HONK";
        break;
      case 2 :
        return "3 HONK";
        break;
      case 3 :
        return "4 HONK";
        break;
      case 4 :
        return "5 HONK";
        break;
      case 5 :
        return "6 HONK";
        break;
      case 6 :
        return "7 HONK";
        break;
      case 7 :
        return "7 HONK";
        break;
      case 8 :
        return "9 HONK";
        break;
      default :
        return "HONK";

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GridView.count(
        // Create a grid with 2 columns. If you change the scrollDirection to
        // horizontal, this produces 2 rows.
        crossAxisCount: 2,
        // Generate 100 widgets that display their index in the List.
        children: List.generate(9, (index) {
          return Center(
            child: TextButton(
              onPressed: () {
                switch (index) {
                  case 0 :
                    Navigator.push(context,
                        new MaterialPageRoute(builder: (BuildContext context) {
                          return new Test();
                        }));
                    break;
                  case 1 :
                    Navigator.push(context,
                        new MaterialPageRoute(builder: (BuildContext context) {
                          return new Test();
                        }));
                    break;
                  case 2 :
                    Navigator.push(context,
                        new MaterialPageRoute(builder: (BuildContext context) {
                          return new Test();
                        }));
                    break;
                  case 3 :
                    Navigator.push(context,
                        new MaterialPageRoute(builder: (BuildContext context) {
                          return new Test();
                        }));
                    break;
                  case 4 :
                    Navigator.push(context,
                        new MaterialPageRoute(builder: (BuildContext context) {
                          return new Test();
                        }));
                    break;
                  case 5 :
                    Navigator.push(context,
                        new MaterialPageRoute(builder: (BuildContext context) {
                          return new Test();
                        }));
                    break;
                  case 6 :
                    Navigator.push(context,
                        new MaterialPageRoute(builder: (BuildContext context) {
                          return new Test();
                        }));
                    break;
                  case 7 :
                    Navigator.push(context,
                        new MaterialPageRoute(builder: (BuildContext context) {
                          return new Test();
                        }));
                    break;
                  case 8 :
                    Navigator.push(context,
                        new MaterialPageRoute(builder: (BuildContext context) {
                          return new Test();
                        }));
                    break;

                }
              },
              child: Text(
                textItem(index),
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
          );
        }),
      ),
    );
  }
}
