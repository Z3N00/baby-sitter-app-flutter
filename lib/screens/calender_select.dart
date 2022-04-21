import 'package:babycare/screens/cart.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DateRanges extends StatefulWidget {
  const DateRanges(
      {Key? key,
      required this.nameofSitter,
      required this.emailofSitter,
      required this.parentEmail})
      : super(key: key);

  final String emailofSitter;
  final String parentEmail;
  final String nameofSitter;

  @override
  SelectedDateRange createState() => SelectedDateRange();
}

List<String> views = <String>['Month', 'Year', 'Decade', 'Century'];

class SelectedDateRange extends State<DateRanges> {
  late List<DateTime> _blackoutDates;
  late String _startDate, _endDate;
  final DateRangePickerController _controller = DateRangePickerController();

  @override
  void initState() {
    final DateTime today = DateTime.now();
    _startDate = DateFormat('yyyy-MM-dd').format(today).toString();
    _endDate = DateFormat('yyyy-MM-dd').format(today.add(Duration(days: 3))).toString();
    _controller.selectedRange =
        PickerDateRange(today, today.add(Duration(days: 3)));
    _blackoutDates = [];
    _getblackoutDates();

    super.initState();
  }

  _getblackoutDates()  async {
    final List<DateTime> dates = <DateTime>[];
    final CollectionReference users =
    FirebaseFirestore.instance.collection('users');
    var snapshot = await users.get();
    snapshot.docs.forEach((element) {
      Map<String, dynamic>? data = element.data() as Map<String, dynamic>?;
      if (data != null && data['email'] == widget.emailofSitter) {
        for (var i = 0; i < data['blackout'].length; i++) {
          dates.add(DateTime.parse(data['blackout'][i]));
        }

        }


      });

    _blackoutDates = dates;
  }


  // final DateTime blackoutDate = DateTime.now();
  // dates.add(blackoutDate.add(Duration(days: 1)));
  // dates.add(blackoutDate.add(Duration(days: 2)));
  // dates.add(blackoutDate.add(Duration(days: 3)));
  //
  // return dates;
  List<String> _generateBlackoutDates() {
    var start = DateTime.parse(_startDate);
    var end = DateTime.parse(_endDate);

    final List<String> dates = <String>[];
    for (int i = 0; i <= end.difference(start).inDays; i++) {
      dates.add(start.add(Duration(days: i)).toString());
    }


    print(dates);
    // dates.add(DateTime.parse("2022-04-23"));
    return dates;
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: PopupMenuButton<String>(
            icon: Icon(Icons.calendar_today),
            itemBuilder: (BuildContext context) => views.map((String choice) {
              return PopupMenuItem<String>(
                value: choice,
                child: Text(choice),
              );
            }).toList(),
            onSelected: (String value) {
              if (value == 'Month') {
                _controller.view = DateRangePickerView.month;
              } else if (value == 'Year') {
                _controller.view = DateRangePickerView.year;
              } else if (value == 'Decade') {
                _controller.view = DateRangePickerView.decade;
              } else if (value == 'Century') {
                _controller.view = DateRangePickerView.century;
              }
            },
          ),
        ),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                  margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  height: 50,
                  child: Text('Start Date:   ' '$_startDate')),
              Container(height: 50, child: Text('End Date:   ' '$_endDate')),
              Card(
                margin: const EdgeInsets.fromLTRB(50, 40, 50, 100),
                child: SfDateRangePicker(
                  controller: _controller,
                  selectionMode: DateRangePickerSelectionMode.range,
                  onSelectionChanged: selectionChanged,
                  monthViewSettings: DateRangePickerMonthViewSettings(
                      blackoutDates: _blackoutDates),
                  allowViewNavigation: false,
                  enablePastDates: false,
                ),
              ),
              Expanded(
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 2.0),
                        child: SizedBox(
                          width: 329,
                          height: 52.34,
                          child: ElevatedButton(
                            onPressed: () {

                              Navigator.push(
                                context,
                                (MaterialPageRoute(
                                  builder: (context) => new CartScreen(
                                      emailofSitter: widget.emailofSitter,
                                      parentEmail: widget.parentEmail,
                                      nameofSitter: widget.nameofSitter,
                                      startdate: _startDate,
                                      enddate: _endDate,
                                  dates:_generateBlackoutDates() ),
                                )),
                              );
                            },
                            child: const Text(
                              'Confirm',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                      )))
            ],
          ),
        ),
      ),
    );
  }

  void selectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      _startDate =
          DateFormat('yyyy-MM-dd').format(args.value.startDate).toString();
      _endDate = DateFormat('yyyy-MM-dd')
          .format(args.value.endDate ?? args.value.startDate)
          .toString();
    });
  }
}
