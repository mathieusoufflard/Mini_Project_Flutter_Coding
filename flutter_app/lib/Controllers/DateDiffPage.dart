import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';

class DateDiffPage extends StatefulWidget {
  const DateDiffPage({Key? key}) : super(key: key);

  @override
  _DateDiffPageState createState() => _DateDiffPageState();
}

class _DateDiffPageState extends State<DateDiffPage> {
  String? _firstDate = "";
  String? _secondDate = "";
  String displayText = "";

  String _getDateDiff(String date1, String date2) {
    DateTime firstDate = DateTime.parse(date1);
    DateTime secondDate = DateTime.parse(date2);

    String year = ((secondDate.year - firstDate.year).abs()).toString();
    String month = ((secondDate.month - firstDate.month).abs()).toString();
    String day = ((secondDate.day - firstDate.day).abs()).toString();
    return "$year années, $month mois et $day, jours";
  }

  @override
  Widget build(BuildContext context) {
    final title = 'Différence de date';

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          children: [
            Text("1er jour"),
            DateTimePicker(
              initialValue: '',
              firstDate: DateTime(0),
              lastDate: DateTime.now(),
              dateLabelText: 'Date',
              onChanged: (val) {
                print(val);
                setState(() {
                  _firstDate = val;
                });
                if  (_firstDate != "" && _secondDate != "")
                {
                  displayText = "il s'est passée " + _getDateDiff(_firstDate.toString(), _secondDate.toString()) + "depuis la première rencontre";
                }
              },
            ),
            Text("2eme jour"),
            DateTimePicker(
              initialValue: '',
              firstDate: DateTime(0),
              lastDate: DateTime.now(),
              dateLabelText: 'Date',
              onChanged: (val) {
                print(val);
                setState(() {
                  _secondDate = val;
                });
                if  (_firstDate != "" && _secondDate != "")
                {
                  displayText = "il s'est passé " + _getDateDiff(_firstDate.toString(), _secondDate.toString()) + " depuis la première rencontre";
                }
              },
            ),
            Text(displayText),
          ],
        ),
      ),
    );
  }
}
