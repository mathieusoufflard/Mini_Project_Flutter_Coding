import 'package:flutter/material.dart';
import 'package:flutter_app/Controllers/DateDiffPage.dart';
import 'package:flutter_app/promotionPage.dart';
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

  String _textItem(int index) {
    switch (index) {
      case 0:
        return "1 HONK";
        break;
      case 1:
        return "2 HONK";
        break;
      case 2 :
        return "Promo";
        break;
      case 3:
        return "4 HONK";
        break;
      case 4:
        return "5 HONK";
        break;
      case 5:
        return "6 HONK";
        break;
      case 6:
        return "7 HONK";
        break;
      case 7:
        return "7 HONK";
        break;
      case 8:
        return "9 HONK";
        break;
      default:
        return "HONK";
    }
  }

  Icon _iconItem(int index) {
    switch (index) {
      case 0:
        return Icon(Icons.add, color: Colors.green,);
        break;
      case 1:
        return Icon(Icons.home, color: Colors.black,);
        break;
      case 2:
        return Icon(Icons.ac_unit, color: Colors.black,);
        break;
      case 3:
        return Icon(Icons.access_alarm, color: Colors.black,);
        break;
      case 4:
        return Icon(Icons.access_time, color: Colors.black,);
        break;
      case 5:
        return Icon(Icons.accessibility, color: Colors.black,);
        break;
      case 6:
        return Icon(Icons.accessible, color: Colors.black,);
        break;
      case 7:
        return Icon(Icons.account_balance, color: Colors.black,);
        break;
      case 8:
        return Icon(Icons.account_balance_wallet, color: Colors.black,);
        break;
      default:
        return Icon(Icons.phone, color: Colors.black,);
    }
  }

  _setItem(int index){
    return Column(
      children: [
        _iconItem(index),
        Text(
          _textItem(index),
          style: Theme.of(context).textTheme.headline5,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GridView.count(
        crossAxisCount: 3,
        mainAxisSpacing: 5,
        crossAxisSpacing: 2,
        children: List.generate(9, (index) {
          return Center(
            child: TextButton(
              onPressed: () {
                switch (index) {
                  case 0:
                    Navigator.push(context,
                        new MaterialPageRoute(builder: (BuildContext context) {
                      return new Test();
                    }));
                    break;
                  case 1:
                    Navigator.push(context,
                        new MaterialPageRoute(builder: (BuildContext context) {
                      return new Test();
                    }));
                    break;
                  case 2:
                    Navigator.push(context,
                        new MaterialPageRoute(builder: (BuildContext context) {
                          return new PromotionPage();
                        }));
                    break;
                  case 3:
                    Navigator.push(context,
                        new MaterialPageRoute(builder: (BuildContext context) {
                      return new DateDiffPage();
                    }));
                    break;
                  case 4:
                    Navigator.push(context,
                        new MaterialPageRoute(builder: (BuildContext context) {
                      return new Test();
                    }));
                    break;
                  case 5:
                    Navigator.push(context,
                        new MaterialPageRoute(builder: (BuildContext context) {
                      return new Test();
                    }));
                    break;
                  case 6:
                    Navigator.push(context,
                        new MaterialPageRoute(builder: (BuildContext context) {
                      return new Test();
                    }));
                    break;
                  case 7:
                    Navigator.push(context,
                        new MaterialPageRoute(builder: (BuildContext context) {
                      return new Test();
                    }));
                    break;
                  case 8:
                    Navigator.push(context,
                        new MaterialPageRoute(builder: (BuildContext context) {
                      return new Test();
                    }));
                    break;
                }
              },
              child: _setItem(index)
            ),
          );
        }),
      ),
    );
  }
}
