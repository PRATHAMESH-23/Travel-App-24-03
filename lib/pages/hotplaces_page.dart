import 'package:flutter/material.dart';
import 'package:travel_app/config/constants.dart';
import 'package:travel_app/widgets/custom_nevigationbar.dart';
import 'package:travel_app/widgets/custom_pricecontainer.dart';

class HotplacesPage extends StatelessWidget {
  HotplacesPage({super.key});
  final List<String> imageUrls = [
    'https://agent.dookinternational.com/uploads/holiday/dookImages/1730890016766_US-11.jpg',
    'https://www.flamingotravels.co.in/_next/image?url=https%3A%2F%2Fimgcdn.flamingotravels.co.in%2FImages%2FCity%2Fsan-franciso-image.jpg&w=640&q=90',
    'https://images.unsplash.com/photo-1528181304800-259b08848526?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dGhhaWxhbmR8ZW58MHx8MHx8fDA%3D',
    'https://static.toiimg.com/photo/107256233.cms',
    'https://www.rjtravelagency.com/wp-content/uploads/2023/10/Thailand-2.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQr5MOgIzPIy1qOJNsdIcrbYXyHdVH3OxZPSQ&s',
  ];

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
            Row(
              children: [
                SizedBox(
                  width: 70,
                  height: 40,
                  child: Chip(
                    backgroundColor: AppColors.chipGrey,
                    label: Text(
                      "7 Days",
                      style: TextStyle(
                        color: AppColors.chipFont,
                        fontFamily: Fonts.medium,
                      ),
                    ),
                    padding: EdgeInsets.all(0),
                    elevation: 0,
                    side: BorderSide.none,
                  ),
                ),
                SizedBox(
                  width: 70,
                  height: 40,
                  child: Chip(
                    backgroundColor: AppColors.chipGrey,
                    label: Text(
                      "Summer",
                      style: TextStyle(
                        color: AppColors.chipFont,
                        fontFamily: Fonts.medium,
                      ),
                    ),
                    padding: EdgeInsets.all(0),
                    side: BorderSide.none,
                  ),
                ),
                Spacer(),
                CustomPricecontainer(price: "\$3 000"),
              ],
            ),
            SizedBox(height: 16),
            // Service Section
            Text(
              'Hot Place',
              style: TextStyle(
                fontSize: WidgetSize.fontSize_20,
                fontWeight: FontWeight.bold,
                fontFamily: Fonts.medium,
              ),
            ),
            SizedBox(height: 12),
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: imageUrls.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                        image: NetworkImage(imageUrls[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
            CustomNavigationBar(),
          ],
        ),
      ),
    );
  }
}
