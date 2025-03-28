import 'package:flutter/material.dart';
import 'package:travel_app/config/constants.dart';
import 'package:travel_app/pages/tourdetails_page.dart';
import 'package:travel_app/widgets/custom_nevigationbar.dart';
import 'package:travel_app/widgets/custom_pricecontainer.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 60, // Adjust height as needed
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildImageCard(
                    'https://www.imagetours.com/__media/tours/HE/cover.jpg',
                  ),
                  _buildImageCard(
                    'https://plutotours.in/wp-content/uploads/2023/03/ezgif.com-gif-maker-9-820x520.webp',
                  ),
                  _buildImageCard(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVr2CTWphvtvc0skxQA81cZN2o7QSwp5ETyQ&s',
                  ),
                  _buildImageCard(
                    'https://www.flamingotravels.co.in/_next/image?url=https%3A%2F%2Fimgcdn.flamingotravels.co.in%2FImages%2FCity%2F3-island-tour-phu-quoc.jpg&w=640&q=90',
                  ),
                  _buildImageCard(
                    'https://d3r8gwkgo0io6y.cloudfront.net/upload/U2/statue-of-liberty-2.jpg',
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Text(
              'My Location',
              style: TextStyle(
                fontSize: WidgetSize.fontSize_18,
                fontWeight: FontWeight.bold,
                fontFamily: Fonts.medium,
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildLocationCard(
                    'Sesimbra e Arrabida',
                    'Portugal there\'s so much more to discover. Read about the Azores\' new wave of eco-travel.',
                    'Sesimbra, Lisbon',
                    '\$3 000',
                    'https://gtholidays-in-files.s3.ap-south-1.amazonaws.com/wp-content/uploads/2021/02/16131029/America-Tour-Packages-by-GT-Holidays-370x375.jpg',
                    context,
                    ontap:
                        () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => TourdetailsPage(),
                          ),
                        ),
                  ),
                  SizedBox(width: 16),
                  _buildLocationCard(
                    'Ses',
                    'Port',
                    'abo',
                    '\$4 000',
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQLxGONThhZ1Ku6Vp8X9SlGVDtZbI8Eay4jJiJLpgDAfrVGUsD-IFyKA8P0zdWG4d5aoB0&usqp=CAU',
                    context, // Replace with actual image URL
                  ),
                ],
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: CustomNavigationBar(),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildImageCard(String imageUrl) {
  return Container(
    width: 65,
    margin: EdgeInsets.only(right: 12),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(14),
      image: DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover),
    ),
  );
}

Widget _buildLocationCard(
  String title,
  String description,
  String location,
  String price,
  String imageUrl,
  BuildContext context, {
  Function()? ontap,
}) {
  return InkWell(
    onTap: ontap,
    child: Container(
      width: MediaQuery.of(context).size.width * 0.75,

      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
            Positioned(
              bottom: 10,
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
    ),
  );
}
