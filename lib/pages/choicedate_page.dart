import 'package:flutter/material.dart';
import 'package:travel_app/config/constants.dart';
import 'package:travel_app/widgets/custom_nevigationbar.dart';

class ChoicedatePage extends StatefulWidget {
  const ChoicedatePage({super.key});

  @override
  State<ChoicedatePage> createState() => _ChoicedatePageState();
}

class _ChoicedatePageState extends State<ChoicedatePage> {
  List<String> selectedFilters = [];
  List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];
  List<String> travelDays = [
    '30 Day\'s or less',
    '15-7 Day',
    '7-4 Day',
    '5-2 Day',
  ];
  List<String> persons = ['1', '2', '3', '7', '10'];
  void addFilter(String filter) {
    setState(() {
      if (!selectedFilters.contains(filter)) {
        selectedFilters.add(filter);
      }
    });
  }

  void removeFilter(String filter) {
    setState(() {
      selectedFilters.remove(filter);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: () {}),
        title: Text(
          'Choice Date',
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
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 50,
                width: double.infinity,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.textFieldBorder),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: SingleChildScrollView(
                  // Make it scrollable
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children:
                        selectedFilters.map((filter) {
                          return Padding(
                            padding: const EdgeInsets.only(
                              right: 8.0,
                            ), // Add spacing between chips
                            child: Chip(
                              backgroundColor: AppColors.orange,
                              label: Text(
                                filter,
                                style: TextStyle(
                                  fontFamily: Fonts.medium,
                                  color: AppColors.white,
                                ),
                              ),
                              deleteIconColor: AppColors.white,
                              onDeleted: () => removeFilter(filter),
                            ),
                          );
                        }).toList(),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Travel Time',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: Fonts.medium,
                ),
              ),
              SizedBox(height: 8),
              SizedBox(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: months.length,
                  itemBuilder: (context, index) {
                    return getContainer(
                      () => addFilter(months[index]),
                      months[index],
                    );
                  },
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Travel Day\'s',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: Fonts.medium,
                ),
              ),
              SizedBox(height: 8),
              SizedBox(
                height: 60,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: travelDays.length,
                  itemBuilder: (context, index) {
                    return getContainer(
                      () => addFilter(travelDays[index]),
                      travelDays[index],
                    );
                  },
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Persons',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: Fonts.medium,
                ),
              ),
              SizedBox(height: 8),
              SizedBox(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: persons.length,
                  itemBuilder: (context, index) {
                    return getContainer(
                      () => addFilter(persons[index]),
                      persons[index],
                    );
                  },
                ),
              ),
              Spacer(),
              CustomNavigationBar(),
            ],
          ),
        ),
      ),
    );
  }

  Widget getContainer(Function()? onTap, String data) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: 100,

          padding: EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 8,
          ), //Add padding to container
          decoration: BoxDecoration(
            color:
                selectedFilters.contains(data)
                    ? AppColors.orange
                    : AppColors.cardBackground,

            borderRadius: BorderRadius.circular(14),
          ),
          child: Center(
            child: Text(
              data,
              style: TextStyle(
                color:
                    selectedFilters.contains(data)
                        ? AppColors.white
                        : AppColors.black,
                fontFamily: Fonts.medium,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
