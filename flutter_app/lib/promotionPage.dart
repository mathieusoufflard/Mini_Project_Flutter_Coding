import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/Controllers/promotionController.dart';
import 'package:flutter_app/Helpers/inputHelper.dart';

class PromotionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Promotion';

    PromotionController promotionController = new PromotionController();

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          children: [
            Text("Prix initial : "),
            InputHelper().setInputField(context, "0",
                promotionController.initPriceController, TextInputType.number),
            Text("Pourcentage de réduction : "),
            InputHelper().setInputField(context, "0",
                promotionController.promoRateController, TextInputType.number),
            Text("Valeur de réduction : "),
            InputHelper().setInputField(
                context,
                "0",
                promotionController.promoValueController,
                TextInputType.number,
                true),
            Text("Prix final : "),
            InputHelper().setInputField(
                context,
                "0",
                promotionController.finalPriceController,
                TextInputType.number,
                true),
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
