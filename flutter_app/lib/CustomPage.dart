import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
        return "2 HONK";
        break;
      case 2:
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
        return "8 HONK";
        break;
      case 8:
        return "Convertisseur numérique";
        break;
      default:
        return "HONK";
    }
  }

  Icon _iconItem(int index) {
    switch (index) {
      case 0:
        return Icon(
          Icons.add,
          color: Colors.green,
        );
        break;
      case 1:
        return Icon(
          Icons.home,
          color: Colors.black,
        );
        break;
      case 2:
        return Icon(
          Icons.ac_unit,
          color: Colors.black,
        );
        break;
      case 3:
        return Icon(
          Icons.access_alarm,
          color: Colors.black,
        );
        break;
      case 4:
        return Icon(
          Icons.access_time,
          color: Colors.black,
        );
        break;
      case 5:
        return Icon(
          Icons.accessibility,
          color: Colors.black,
        );
        break;
      case 6:
        return Icon(
          Icons.accessible,
          color: Colors.black,
        );
        break;
      case 7:
        return Icon(
          Icons.account_balance,
          color: Colors.black,
        );
        break;
      case 8:
        return Icon(
          Icons.account_balance_wallet,
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
          return new DistancePage();
        }));
        break;
      case 6:
        Navigator.push(context,
            new MaterialPageRoute(builder: (BuildContext context) {
          return new TemperatureView();
        }));
        break;
      case 7:
        Navigator.push(context,
            new MaterialPageRoute(builder: (BuildContext context) {
          return new RomanusPage();
        }));
        break;
      case 8:
        Navigator.push(context,
            new MaterialPageRoute(builder: (BuildContext context) {
          return new NumeralConvertPage();
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
