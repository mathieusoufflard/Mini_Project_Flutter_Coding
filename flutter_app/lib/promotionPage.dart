import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/Controllers/promotionController.dart';

class PromotionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Promotion';

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

    PromotionController promotionController = new PromotionController();

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          children: [
            Text("Prix initial : "),
            _setInputField("0", promotionController.initPriceController,
                TextInputType.number),
            Text("Pourcentage de réduction : "),
            _setInputField("0", promotionController.promoRateController,
                TextInputType.number),
            Text("Valeur de réduction : "),
            _setInputField("0", promotionController.promoValueController,
                TextInputType.number, true),
            Text("Prix final : "),
            _setInputField("0", promotionController.finalPriceController,
                TextInputType.number, true),
            ElevatedButton(
                onPressed: () {
                  if (promotionController.initPriceController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Il faut renseigner un prix initial")));
                  } else if (promotionController
                      .promoRateController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                            "Il faut renseigner un pourcentage de réduction")));
                  } else {
                    double initPrice = double.parse(
                        promotionController.initPriceController.text);
                    double promoRate = double.parse(
                        promotionController.promoRateController.text);
                    if (promoRate < 0 || promoRate > 100) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                              "Il faut renseigner un pourcentage de réduction")));
                    } else {
                      double promoValue = (initPrice * promoRate) / 100;
                      double finalPrice = initPrice - promoValue;
                      promotionController.promoValueController.text =
                          promoValue.toString();
                      promotionController.finalPriceController.text =
                          finalPrice.toString();
                    }
                  }
                },
                child: Text("Calculer"))
          ],
        ),
      ),
    );
  }
}
