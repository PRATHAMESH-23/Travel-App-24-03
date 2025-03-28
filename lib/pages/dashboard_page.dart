import 'package:flutter/material.dart';
import 'package:travel_app/config/constants.dart';
import 'package:travel_app/pages/explore_page.dart';
import 'package:travel_app/pages/map_page.dart';
import 'package:travel_app/widgets/custom_locationcard.dart';
import 'package:travel_app/widgets/custom_nevigationbar.dart';
import 'package:travel_app/widgets/custom_pricecontainer.dart';
import 'package:travel_app/widgets/textfield_widget.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.black),
          onPressed: () {},
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
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
        ],
      ),
      body: Column(
        children: [
          Expanded(
            // Use Expanded to make the SingleChildScrollView scrollable
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Get Ready For\nThe Travel Trip!',
                      style: TextStyle(
                        fontSize: WidgetSize.fontSize_28,
                        fontFamily: Fonts.regular,
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: TextfieldWidget(
                            hintText: "Find your Location..",
                          ),
                        ),
                        SizedBox(width: 18),
                        Container(
                          width: 48, // Adjust width as needed
                          height: 48, // Adjust height as needed
                          decoration: BoxDecoration(
                            color: AppColors.orange, // Orange background color
                            borderRadius: BorderRadius.circular(
                              8,
                            ), // Rounded corners
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
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => MapPage()),
                        );
                      },
                      child: CustomLocationCard(
                        title: 'Winter in Portugal',
                        location: 'Lisbon',
                        description:
                            'Portugal there\'s so much more to discover. Read about the Azores new wave of eco-travel.',
                        imageUrl:
                            'https://www.excelia-group.com/sites/excelia-group.fr/files/styles/style_660_x_260/public/2020-03/campus-excelia-tours.jpg?itok=Ye7dFWve',
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Best Place',
                          style: TextStyle(
                            fontSize: WidgetSize.fontSize_18,
                            fontWeight: FontWeight.bold,
                            fontFamily: Fonts.medium,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ExplorePage(),
                              ),
                            );
                          },
                          child: Text(
                            'See All',
                            style: TextStyle(
                              color: AppColors.subText,
                              fontFamily: Fonts.medium,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          buildPlaceCard(
                            'Sesimbra e Arrabida',
                            'Sesimbra, Lisbon',
                            '\$3 000',
                            'https://a.storyblok.com/f/53624/1600x720/09ff7f14ac/eur_venice_italy_grand_canal.jpg/m/560x373',
                            context,
                          ),
                          SizedBox(width: 10),
                          buildPlaceCard(
                            'Another Place',
                            'Location',
                            '\$2 500',
                            'https://fortunetours.in/wp-content/uploads/2023/11/Andaman.jpg',
                            context,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: CustomNavigationBar(),
          ), // Place it outside the Expanded and SingleChildScrollView
        ],
      ),
    );
  }

  Widget buildPlaceCard(
    String title,
    String location,
    String price,
    String imageUrl,
    BuildContext context,
  ) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.25,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(imageUrl, fit: BoxFit.cover),
            ),
            Positioned(
              bottom: 20,
              right: 10,
              child: CustomPricecontainer(price: price),
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                      fontFamily: Fonts.medium,
                      fontSize: WidgetSize.fontSize_18,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.location_on, size: 16, color: AppColors.white),
                      SizedBox(width: 5),
                      Text(
                        location,
                        style: TextStyle(
                          color: AppColors.white,
                          fontFamily: Fonts.medium,
                          fontSize: WidgetSize.fontSize_16,
                        ),
                      ),
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
