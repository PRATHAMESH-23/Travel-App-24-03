import 'package:flutter/material.dart';
import 'package:travel_app/config/constants.dart';

class CustomPricecontainer extends StatelessWidget {
  final String price;
  const CustomPricecontainer({super.key, this.price = ''});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 35,
      decoration: BoxDecoration(
        color: AppColors.orange,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          price,
          style: TextStyle(
            fontSize: 16,
            color: AppColors.white,
            fontFamily: Fonts.medium,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
