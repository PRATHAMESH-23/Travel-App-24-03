import 'package:flutter/material.dart';
import 'package:travel_app/config/constants.dart';
import 'package:travel_app/widgets/custom_nevigationbar.dart';
import 'package:travel_app/widgets/custom_pricecontainer.dart';
import 'package:travel_app/widgets/textfield_widget.dart';

class ExplorelistPage extends StatelessWidget {
  ExplorelistPage({super.key});
  final List<Map<String, dynamic>> tours = [
    {
      'title': 'Winter in Portugal',
      'location': 'Lisbon',
      'price': '\$3 000',
      'duration': '7 day',
      'season': 'winter',
      'imageUrl':
          'https://www.visitdubai.com/-/media/images/leisure/detail-pages/plan-your-trip/4-0-plan-your-trip-t02/plan-your-trip-burj-al-arab-det.jpg?rev=f882f54fe3e94081a79124b5aeb67c2e&cx=0.77&cy=0.33&cw=397&ch=397',
    },
    {
      'title': 'Sesimbra e Arrabida',
      'location': 'Sesimbra, Lisbon',
      'price': '\$2 000',
      'duration': '3 day',
      'season': 'summer',
      'imageUrl':
          'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1d/ab/47/44/caption.jpg?w=500&h=400&s=1',
    },
    {
      'title': 'Japan Country',
      'location': 'Sesimbra, Lisbon',
      'price': '\$3 000',
      'duration': '3 day',
      'season': 'winter',
      'imageUrl':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQvrB_eEI3Ic_gYJQ8Aan3EkWD5krEiYkZmUQsskwhnyZz7ww7FOJn1ndbzRQyGu1LQJrY&usqp=CAU',
    },
  ];

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
          "Explore",
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
        padding: const EdgeInsets.all(12.0),
        child: Column(
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
                    color: AppColors.orange,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(child: Icon(Icons.search, color: Colors.white)),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: tours.length,
                itemBuilder: (context, index) {
                  return tourCard(index);
                },
              ),
            ),

            CustomNavigationBar(),
          ],
        ),
      ),
    );
  }

  Widget tourCard(int index) {
    return Card(
      color: AppColors.cardBackground,
      margin: EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                  image: NetworkImage(tours[index]['imageUrl']),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tours[index]['title'],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: Fonts.medium,
                      fontSize: WidgetSize.fontSize_18,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.location_on, color: AppColors.orange),
                      Text(
                        tours[index]['location'],
                        style: TextStyle(
                          fontFamily: Fonts.medium,
                          color: AppColors.subText,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 70,
                        height: 40,
                        child: Chip(
                          backgroundColor: AppColors.chipGrey,
                          label: Text(
                            tours[index]['duration'],
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
                            tours[index]['season'],
                            style: TextStyle(
                              color: AppColors.chipFont,
                              fontFamily: Fonts.medium,
                            ),
                          ),
                          padding: EdgeInsets.all(0),
                          side: BorderSide.none,
                        ),
                      ),
                      CustomPricecontainer(price: "\$2000"),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
