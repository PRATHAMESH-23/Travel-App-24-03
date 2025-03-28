import 'package:flutter/material.dart';
import 'package:travel_app/config/constants.dart';

class CustomLocationCard extends StatelessWidget {
  final String title;
  final String location;
  final String description;
  final String imageUrl;
  const CustomLocationCard({
    super.key,
    this.title = '',
    this.location = '',
    this.description = '',
    this.imageUrl = '',
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.cardBackground,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 20,
            child: Icon(Icons.bookmark, color: AppColors.orange, size: 30),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(imageUrl, fit: BoxFit.cover),
                      ),
                    ),

                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontFamily: Fonts.medium,
                            fontWeight: FontWeight.bold,
                            fontSize: WidgetSize.fontSize_20,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              size: 16,
                              color: AppColors.orange,
                            ),
                            SizedBox(width: 5),
                            Text(
                              location,
                              style: TextStyle(
                                color: AppColors.subText,
                                fontFamily: Fonts.medium,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Text(
                  description,
                  style: TextStyle(
                    color: AppColors.subText,
                    fontFamily: Fonts.medium,
                    fontSize: WidgetSize.fontSize_14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
