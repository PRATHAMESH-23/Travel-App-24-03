import 'package:flutter/material.dart';
import 'package:travel_app/config/constants.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.06,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.cardBackground,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.swap_vert, color: Colors.orange),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.notifications_none,
              color: Colors.grey,
            ), // Grey icon
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.chat_bubble_outline,
              color: Colors.grey,
            ), // Grey icon
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.location_on_outlined, color: Colors.grey),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.person_outline, color: Colors.grey),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
