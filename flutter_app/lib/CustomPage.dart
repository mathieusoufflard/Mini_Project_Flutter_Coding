import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/AgeCalculator.dart';
import 'package:flutter_app/Controllers/DateDiffAge.dart';
import 'package:flutter_app/areaPage.dart';
import 'package:flutter_app/promotionPage.dart';
import 'package:flutter_app/romanusPage.dart';
import 'package:flutter_app/temperatureView.dart';
import 'package:flutter_app/testPage.dart';

import 'Controllers/DateDiffPage.dart';
import 'distancePage.dart';
import 'fileSizePage.dart';
import 'main.dart';
import 'numeralConvertPage.dart';

class CustomPage {
  String _textItem(int index) {
    switch (index) {
      case 0:
        return "Taille de fichiers";
        break;
      case 1:
        return "Temps de vie";
        break;
      case 2:
        return "Promotion";
        break;
      case 3:
        return "Rencontre entre amis";
        break;
      case 4:
        return "Convertisseur de distances";
        break;
      case 5:
        return "Convertisseur numérique";
        break;
      case 6:
        return "Convertisseur d'unités métrique";
        break;
      case 7:
        return "Convertisseur de température";
        break;
      case 8:
        return "Convertisseur romain";
        break;
      default:
        return "HONK";
    }
  }

  Icon _iconItem(int index) {
    switch (index) {
      case 0:
        return Icon(
          Icons.file_copy,
          color: Colors.black,
        );
        break;
      case 1:
        return Icon(
          Icons.volunteer_activism,
          color: Colors.black,
        );
        break;
      case 2:
        return Icon(
          Icons.attach_money,
          color: Colors.black,
        );
        break;
      case 3:
        return Icon(
          Icons.wc,
          color: Colors.black,
        );
        break;
      case 4:
        return Icon(
          Icons.agriculture,
          color: Colors.black,
        );
        break;
      case 5:
        return Icon(
          Icons.calculate,
          color: Colors.black,
        );
        break;
      case 6:
        return Icon(
          Icons.add_road,
          color: Colors.black,
        );
        break;
      case 7:
        return Icon(
          Icons.ac_unit,
          color: Colors.black,
        );
        break;
      case 8:
        return Icon(
          Icons.format_list_numbered,
          color: Colors.black,
        );
        break;
      default:
        return Icon(
          Icons.phone,
          color: Colors.black,
        );
    }
  }

  _setItem(int index, BuildContext context) {
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

  _setListItem(BuildContext context) {
    List<Widget> listItem = List.empty(growable: true);

    for (int i = 0; i < 9; i++) {
      listItem.add(OutlinedButton(
        onPressed: () {
          _setActionButton(i, context);
        },
        child: Container(
          margin: EdgeInsets.all(10),
          child: Row(
            children: [
              _iconItem(i),
              Text(
                _textItem(i),
                style: Theme.of(context).textTheme.headline5,
              ),
            ],
          ),
        ),
      ));
    }
    return listItem;
  }

  _setCardListItem(BuildContext context) {
    //List<Card> cards = [];
    List<Widget> cards = List.empty(growable: true);

    for (int i = 0; i < 9; i++) {
      cards.add(Card(
          child: OutlinedButton(
              onPressed: () {
                _setActionButton(i, context);
              },
              child: Container(
                width: MediaQuery.of(context).size.width / 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _iconItem(i),
                    Text(
                      _textItem(i),
                      style: Theme.of(context).textTheme.headline5,
                    )
                  ],
                ),
              ))));
    }

    return cards;
  }

  _setActionButton(int index, BuildContext context) {
    switch (index) {
      case 0:
        Navigator.push(context,
            new MaterialPageRoute(builder: (BuildContext context) {
          return new FileSizePage();
        }));
        break;
      case 1:
        Navigator.push(context,
            new MaterialPageRoute(builder: (BuildContext context) {
          return new DateDiffAge();
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
          return new DistancePage();
        }));
        break;
      case 5:
        Navigator.push(context,
            new MaterialPageRoute(builder: (BuildContext context) {
          return new NumeralConvertPage();
        }));
        break;
      case 6:
        Navigator.push(context,
            new MaterialPageRoute(builder: (BuildContext context) {
          return new AreaPage();
        }));
        break;
      case 7:
        Navigator.push(context,
            new MaterialPageRoute(builder: (BuildContext context) {
          return new TemperatureView();
        }));
        break;
      case 8:
        Navigator.push(context,
            new MaterialPageRoute(builder: (BuildContext context) {
          return new RomanusPage();
        }));
        break;
    }
  }

  Widget getPage(disposision enumerate, BuildContext context) {
    switch (enumerate) {
      case disposision.Grid:
        return Container(
          child: GridView.count(
            crossAxisCount: 3,
            mainAxisSpacing: 5,
            crossAxisSpacing: 2,
            children: List.generate(9, (index) {
              return Center(
                child: TextButton(
                    onPressed: () {
                      switch (index) {
                        case 0:
                          Navigator.push(context, new MaterialPageRoute(
                              builder: (BuildContext context) {
                            return new FileSizePage();
                          }));
                          break;
                        case 1:
                          Navigator.push(context, new MaterialPageRoute(
                              builder: (BuildContext context) {
                            return new Test();
                          }));
                          break;
                        case 2:
                          Navigator.push(context, new MaterialPageRoute(
                              builder: (BuildContext context) {
                            return new PromotionPage();
                          }));
                          break;
                        case 3:
                          Navigator.push(context, new MaterialPageRoute(
                              builder: (BuildContext context) {
                            return new DateDiffPage();
                          }));
                          break;
                        case 4:
                          Navigator.push(context, new MaterialPageRoute(
                              builder: (BuildContext context) {
                            return new Test();
                          }));
                          break;
                        case 5:
                          Navigator.push(context, new MaterialPageRoute(
                              builder: (BuildContext context) {
                            return new DistancePage();
                          }));
                          break;
                        case 6:
                          Navigator.push(context, new MaterialPageRoute(
                              builder: (BuildContext context) {
                            return new TemperatureView();
                          }));
                          break;
                        case 7:
                          Navigator.push(context, new MaterialPageRoute(
                              builder: (BuildContext context) {
                            return new RomanusPage();
                          }));
                          break;
                        case 8:
                          Navigator.push(context, new MaterialPageRoute(
                              builder: (BuildContext context) {
                            return new NumeralConvertPage();
                          }));
                          break;
                      }
                    },
                    child: _setItem(index, context)),
              );
            }),
          ),
        );
        break;

      case disposision.List:
        return Container(
          child: Column(
            children: _setListItem(context),
          ),
        );
        break;

      case disposision.Card:
        return Container(
            child: Center(
          child: Column(
            children: _setCardListItem(context),
          ),
        ));
        break;

      default:
        return Container();
        break;
    }
  }
}
