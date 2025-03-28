import 'package:flutter/material.dart';
import 'package:travel_app/config/constants.dart';
import 'package:travel_app/widgets/custom_nevigationbar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: () {}),
        title: Text(
          'Profile',
          style: TextStyle(
            fontSize: WidgetSize.fontSize_24,
            fontFamily: Fonts.regular,
          ),
        ),
        centerTitle: true,
        actions: [IconButton(icon: Icon(Icons.settings), onPressed: () {})],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProfileHeader(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Prathamesh Dabhole',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: Fonts.medium,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Hello, I\'m Professional Expert UI/UX Designer. I love create a App Design, Landing page, Web Design. I am over 3 years experience in UI/UX Design.',
                      style: TextStyle(
                        fontFamily: Fonts.medium,
                        fontSize: WidgetSize.fontSize_12,
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Icon(Icons.location_on, color: AppColors.orange),
                        SizedBox(width: 4),
                        Text(
                          'Thailand',
                          style: TextStyle(
                            fontFamily: Fonts.medium,
                            color: AppColors.subText,
                            fontSize: WidgetSize.fontSize_12,
                          ),
                        ),
                        SizedBox(width: 16),
                        Icon(Icons.calendar_today, color: AppColors.orange),
                        SizedBox(width: 4),
                        Text(
                          'December 2019',
                          style: TextStyle(
                            fontFamily: Fonts.medium,
                            color: AppColors.subText,
                            fontSize: WidgetSize.fontSize_12,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildStatColumn("30 Post"),
                        _buildStatColumn("209 Follower"),
                        _buildStatColumn("344 Following"),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildIconTextButton(Icons.grid_on, 'Post'),
                        _buildIconTextButton(Icons.play_arrow, 'Video'),
                        _buildIconTextButton(Icons.bookmark_border, 'Save'),
                      ],
                    ),
                  ],
                ),
              ),
              _buildImageGrid(),
              CustomNavigationBar(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return SizedBox(
      height: 200,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                'https://c4.wallpaperflare.com/wallpaper/527/198/566/sea-beach-evening-sun-wallpaper-preview.jpg',
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 30,
            child: CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage(Images.profile),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 20,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(10),

                backgroundColor: AppColors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Edit Profile',
                style: TextStyle(
                  color: AppColors.white,
                  fontFamily: Fonts.medium,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatColumn(String text) {
    return Row(
      children: [
        Text(
          text,
          style: TextStyle(
            fontFamily: Fonts.medium,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildIconTextButton(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: Colors.grey),
        SizedBox(width: 5),
        Text(
          text,
          style: TextStyle(fontFamily: Fonts.medium, color: AppColors.subText),
        ),
      ],
    );
  }

  Widget _buildImageGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 8,
      ),
      itemCount: 6, // Number of images
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              image: NetworkImage(
                "https://www.rjtravelagency.com/wp-content/uploads/2023/10/Thailand-2.jpg",
              ),
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}
