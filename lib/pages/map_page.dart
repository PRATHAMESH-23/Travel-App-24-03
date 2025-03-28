import 'package:flutter/material.dart';
import 'package:travel_app/config/constants.dart';
import 'package:travel_app/widgets/custom_locationcard.dart';
import 'package:travel_app/widgets/custom_nevigationbar.dart';
import 'package:travel_app/widgets/textfield_widget.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(
            left: 12.0,
            right: 8,
            top: 8,
            bottom: 8,
          ),
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: AppColors.profileBackground,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(Images.profile),
          ),
        ),
        title: Text(
          "Map",
          style: TextStyle(
            fontSize: WidgetSize.fontSize_24,
            fontFamily: Fonts.regular,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: Icon(Icons.notifications_none),
              onPressed: () {
                // Handle notification icon press
              },
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextfieldWidget(hintText: "Find your Location.."),
                ),
                SizedBox(width: 18),
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: AppColors.orange, // Orange background color
                    borderRadius: BorderRadius.circular(8), // Rounded corners
                  ),
                  child: Center(
                    child: Icon(
                      Icons.search,
                      color: Colors.white, // White search icon
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),
            Text(
              'My Location',
              style: TextStyle(
                fontSize: WidgetSize.fontSize_18,
                fontWeight: FontWeight.bold,
                fontFamily: Fonts.medium,
              ),
            ),
            SizedBox(height: 10),
            CustomLocationCard(
              title: 'Winter in Portugal',
              location: 'Lisbon',
              description:
                  'Portugal there\'s so much more to discover. Read about the Azores new wave of eco-travel.',
              imageUrl:
                  'https://www.excelia-group.com/sites/excelia-group.fr/files/styles/style_660_x_260/public/2020-03/campus-excelia-tours.jpg?itok=Ye7dFWve',
            ),
            Spacer(),
            CustomNavigationBar(),
          ],
        ),
      ),
    );
  }
}
