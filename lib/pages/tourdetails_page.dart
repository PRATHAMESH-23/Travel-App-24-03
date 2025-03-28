import 'package:flutter/material.dart';
import 'package:travel_app/config/constants.dart';
import 'package:travel_app/widgets/custom_nevigationbar.dart';
import 'package:travel_app/widgets/custom_pricecontainer.dart';

class TourdetailsPage extends StatelessWidget {
  const TourdetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            // Handle back button press
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none),
            onPressed: () {
              // Handle notification icon press
            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              // Handle more icon press
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Section
            Container(
              height: 200, // Adjust height as needed
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(
                    'https://d3iso9mq9tb10q.cloudfront.net/citylandingherocomp/image/Big-Bus-Tours_Los_Angeles_Big-Bus_at_Santa_Monica_desktop_11.jpg',
                  ), // Replace with your image URL
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 16),

            // Dots Indicator (You'll need a package for this)
            SizedBox(height: 16),
            // Title and Location
            Text(
              'Capital of Thailand',
              style: TextStyle(
                fontSize: WidgetSize.fontSize_20,
                fontWeight: FontWeight.bold,
                fontFamily: Fonts.medium,
              ),
            ),
            Row(
              children: [
                Icon(Icons.location_on, color: AppColors.orange),
                SizedBox(width: 5),
                Text(
                  'Bangkok, Thailand',
                  style: TextStyle(
                    color: AppColors.subText,
                    fontFamily: Fonts.medium,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            // Price
            CustomPricecontainer(price: "\$ 4000"),
            SizedBox(height: 16),
            // Service Section
            Text(
              'Service',
              style: TextStyle(
                fontSize: WidgetSize.fontSize_20,
                fontWeight: FontWeight.bold,
                fontFamily: Fonts.medium,
              ),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                serviceIconList(Icons.wb_sunny),
                serviceIconList(Icons.add),
                serviceIconList(Icons.airplanemode_active),
                serviceIconList(Icons.directions_bus),
                serviceIconList(Icons.motorcycle),
              ],
            ),
            SizedBox(height: 16),
            // Description
            Text(
              'Bangkok, Thailand\'s capital, is a large city known for ornate shrines and vibrant street life. The boat-filled Chao Phraya River feeds its network of canals, flowing past the Rattanakosin royal district, home to opulent Grand Palace and its sacred Wat Phra Kaew Temple. Nearby is Wat Pho Temple with an enormous reclining Buddha and, on the opposite shore.',
              style: TextStyle(
                fontFamily: Fonts.medium,
                color: AppColors.detailText,
              ),
            ),
            Spacer(),
            CustomNavigationBar(),
          ],
        ),
      ),
    );
  }

  Widget serviceIconList(IconData? icon) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(color: AppColors.cardBackground),
      child: Icon(icon, color: AppColors.subText),
    );
  }
}
