import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';

class DateDiffAge extends StatefulWidget {
  const DateDiffAge({Key? key}) : super(key: key);

  @override
  _DateDiffPageState createState() => _DateDiffPageState();
}

class _DateDiffPageState extends State<DateDiffAge> {
  String? _firstDate = "";
  String displayText = "";
  String displayTextAge = "";

  String _getDateDiff(String date1) {
    DateTime firstDate = DateTime.parse(date1);
    DateTime secondDate = DateTime.now();

    String year = ((secondDate.year - firstDate.year).abs()).toString();
    String month = ((secondDate.month - firstDate.month).abs()).toString();
    String day = ((secondDate.day - firstDate.day).abs()).toString();
    return "$year années, $month mois et $day jours";
  }

  _getNextBirthDay(String date1){
    DateTime firstDate = DateTime.parse(date1);

    DateTime now = DateTime.now();
    String nextMonth;
    String nextDay;

    String year = firstDate.year.toString();
    String month = firstDate.month.toString();
    String day = firstDate.day.toString();



    print("date" + (year + month + day));
    now = new DateTime(now.year + 1, now.month, now.day);
    print("nextYear : " + year);
    nextMonth = now.month.toString();
    nextDay = now.day.toString();

    DateTime nextYear = new DateTime(DateTime.now().year + 1,DateTime.now().month,DateTime.now().day);
    int nextBdMonth = 0;
    int nextBdDay = 0;

   // DateTime calcul = int.parse(nextYear) - firstDate;

    //nextBdMonth = nextYear.month - firstDate.month;
    //nextBdDay = nextYear.day - firstDate.day;
    
    nextYear.subtract(new Duration(days: ))
    return "ton prochain anniversaire seras dans "
        + (int.parse(nextMonth) - int.parse(month)).toString() + " mois, "
        + (int.parse(nextDay) - int.parse(day)).toString() + " jours";
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
                if  (_firstDate != "")
                {
                  displayText = "il s'est passée " + _getDateDiff(_firstDate.toString()) + "depuis votre naissance";
                  displayTextAge = "Ton prochain anniversaire est dans " + _getNextBirthDay(_firstDate.toString()) + "depuis votre naissance";
                }
              },
            ),
            Text(displayText),
            Text(displayTextAge),
          ],
        ),
      ),
    );
  }
}
