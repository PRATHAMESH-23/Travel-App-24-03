import 'package:flutter/material.dart';
import 'package:travel_app/config/constants.dart';
import 'package:travel_app/widgets/custom_nevigationbar.dart';

class DiscoverPage extends StatefulWidget {
  DiscoverPage({super.key});

  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  List<String> selectedFilters = [];
  final List<String> regionChoice = ['Asia', 'Africa', 'Europe', 'America'];
  final List<String> userChoice = [
    'Popular',
    'Best Choice',
    'Last Trip\'s',
    '5 Star',
  ];

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
          'Discover',
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 50,
              width: double.infinity, // Adjust height as needed
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
              'By Region',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: Fonts.medium,
              ),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                itemContainer(
                  regionChoice[0],
                  () => addFilter(regionChoice[0]),
                ),
                itemContainer(
                  regionChoice[1],
                  () => addFilter(regionChoice[1]),
                ),
              ],
            ),
            Row(
              children: [
                itemContainer(
                  regionChoice[2],
                  () => addFilter(regionChoice[2]),
                ),
                itemContainer(
                  regionChoice[3],
                  () => addFilter(regionChoice[3]),
                ),
              ],
            ),
            SizedBox(height: 24),
            Text(
              'By User',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: Fonts.medium,
              ),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                itemContainer(userChoice[0], () => addFilter(userChoice[0])),
                itemContainer(userChoice[1], () => addFilter(userChoice[1])),
              ],
            ),
            Row(
              children: [
                itemContainer(userChoice[2], () => addFilter(userChoice[2])),
                itemContainer(userChoice[3], () => addFilter(userChoice[3])),
              ],
            ),
            Spacer(),
            CustomNavigationBar(),
          ],
        ),
      ),
    );
  }

  Widget itemContainer(String data, Function()? ontap) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: InkWell(
          onTap: ontap,
          child: Container(
            height: 90,
            decoration: BoxDecoration(
              color:
                  selectedFilters.contains(data)
                      ? AppColors.orange
                      : AppColors.cardBackground,

              borderRadius: BorderRadius.circular(14),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
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
        ),
      ),
    );
  }
}
