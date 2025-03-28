import 'package:flutter/material.dart';
import 'package:travel_app/config/constants.dart';
// ignore: depend_on_referenced_packages
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:travel_app/widgets/custom_nevigationbar.dart';

class SelectdatePage extends StatefulWidget {
  const SelectdatePage({super.key});

  @override
  State<SelectdatePage> createState() => _SelectdatePageState();
}

class _SelectdatePageState extends State<SelectdatePage> {
  List<DateTime?> singleDatePicker = [];
  @override
  void initState() {
    super.initState();
    DateTime now = DateTime.now();
    singleDatePicker = [
      DateTime(now.year, now.month, now.day),
    ]; // Set to current date with time reset
  }

  @override
  Widget build(BuildContext context) {
    final config = CalendarDatePicker2Config(
      firstDate: DateTime.now(),
      calendarType: CalendarDatePicker2Type.single,
      selectedDayHighlightColor: AppColors.orange,
      weekdayLabels: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
      weekdayLabelTextStyle: TextStyle(
        color: Colors.black87,
        fontFamily: Fonts.medium,
      ),
      dayTextStyle: TextStyle(color: Colors.black87, fontFamily: Fonts.medium),
      monthTextStyle: TextStyle(
        color: Colors.black87,
        fontFamily: Fonts.medium,
      ),
      disabledMonthTextStyle: TextStyle(
        color: AppColors.subText,
        fontFamily: Fonts.medium,
      ),
      yearTextStyle: TextStyle(color: Colors.black87, fontFamily: Fonts.medium),
      selectedDayTextStyle: TextStyle(
        color: Colors.white,
        fontFamily: Fonts.medium,
      ),
      todayTextStyle: TextStyle(color: Colors.blue),
      controlsTextStyle: TextStyle(
        color: Colors.black87,
        fontFamily: Fonts.medium,
      ),
      dayBorderRadius: BorderRadius.circular(8),
      selectableDayPredicate:
          (day) => day.isAfter(DateTime.now().subtract(Duration(days: 1))),
    );

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: () {}),
        title: Text(
          'Select Date',
          style: TextStyle(
            fontSize: WidgetSize.fontSize_24,
            fontFamily: Fonts.regular,
          ),
        ),
        centerTitle: true,
        actions: [IconButton(icon: Icon(Icons.more_vert), onPressed: () {})],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              height: 50,
              width: double.infinity,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.textFieldBorder),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  "Calendar",
                  style: TextStyle(
                    fontFamily: Fonts.medium,
                    fontWeight: FontWeight.bold,
                    fontSize: WidgetSize.fontSize_20,
                  ),
                ),
              ),
            ),
            SizedBox(height: 8),
            CalendarDatePicker2(
              config: config,
              value: singleDatePicker,
              // onValueChanged: (dates) => _dates = dates,
            ),
            SizedBox(height: 8),
            InkWell(
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: AppColors.orange,
                  borderRadius: BorderRadius.all(
                    Radius.circular(WidgetSize.borderRadius_8),
                  ),
                ),
                child: Text(
                  'Start Tour Now',
                  style: TextStyle(
                    fontFamily: Fonts.semiBold,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),

            Spacer(),
            CustomNavigationBar(),
          ],
        ),
      ),
    );
  }
}
