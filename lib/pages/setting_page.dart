import 'package:flutter/material.dart';
import 'package:travel_app/config/constants.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {},
        ),
        title: Text(
          'Settings',
          style: TextStyle(
            fontSize: WidgetSize.fontSize_24,
            fontFamily: Fonts.regular,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProfileSection(),
            SizedBox(height: 30),
            _buildSections(
              "Preference",
              Icons.notifications,
              Icons.language,
              Icons.attach_money,
              "Notification",
              "Language",
              'Currency',
            ),
            SizedBox(height: 30),
            _buildSections(
              "Banking and Payment",
              Icons.payment,
              Icons.privacy_tip,
              Icons.description,
              "Payment Method",
              "Privacy Policy",
              'Terms of Use',
            ),
            Spacer(),
            _buildLogoutButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileSection() {
    return Container(
      decoration: BoxDecoration(color: AppColors.cardBackground),
      child: ListTile(
        leading: CircleAvatar(backgroundImage: AssetImage(Images.profile)),
        title: Text(
          'Prathamesh Dabhole',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: Fonts.medium,
          ),
        ),
        subtitle: Text(
          'sample@gmail.com',
          style: TextStyle(fontFamily: Fonts.medium, color: AppColors.subText),
        ),
        trailing: Icon(Icons.arrow_forward_ios, size: 20),
      ),
    );
  }

  Widget _buildSections(
    String title,
    IconData icon1,
    IconData icon2,
    IconData icon3,
    String cardName1,
    String cardName2,
    String cardName3,
  ) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.textFieldBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 8),
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                fontFamily: Fonts.medium,
              ),
            ),
          ),
          Column(
            children: [
              _buildPreferenceItem(icon1, cardName1),
              Divider(height: 1, color: Colors.grey.shade300),
              _buildPreferenceItem(icon2, cardName2),
              Divider(height: 1, color: Colors.grey.shade300),
              _buildPreferenceItem(icon3, cardName3),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPreferenceItem(IconData icon, String text) {
    return SizedBox(
      height: 50,
      child: ListTile(
        leading: Icon(icon),
        title: Text(text, style: TextStyle(fontFamily: Fonts.medium)),
        trailing: Icon(Icons.arrow_forward_ios, size: 20),
      ),
    );
  }

  Widget _buildLogoutButton() {
    return InkWell(
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: AppColors.orange,
          borderRadius: BorderRadius.all(
            Radius.circular(WidgetSize.borderRadius_8),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.logout, color: AppColors.white),
            SizedBox(width: 5),
            Text(
              'Log Out',
              style: TextStyle(
                fontFamily: Fonts.semiBold,
                color: AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
