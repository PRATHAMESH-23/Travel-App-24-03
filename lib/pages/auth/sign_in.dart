import 'package:flutter/material.dart';
import 'package:travel_app/config/constants.dart';
import 'package:travel_app/widgets/textfield_widget.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              Image.asset(Images.logo),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              Text(
                "Log In",
                style: TextStyle(
                  fontFamily: Fonts.regular,
                  fontSize: WidgetSize.fontSize_28,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),

              TextfieldWidget(labelTitle: "Email"),
              SizedBox(height: 16.0),
              TextfieldWidget(
                labelTitle: "Password",
                icon: Icon(Icons.visibility),
              ),

              SizedBox(height: 8.0),
              Align(
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      fontFamily: Fonts.medium,
                      color: AppColors.orange,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8.0),
              InkWell(
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
                  child: Text(
                    'Log In',
                    style: TextStyle(
                      fontFamily: Fonts.semiBold,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Or',
                style: TextStyle(
                  fontFamily: Fonts.semiBold,
                  color: AppColors.subText,
                ),
              ),
              SizedBox(height: 16.0),
              InkWell(
                child: Material(
                  elevation: 3.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(WidgetSize.borderRadius_8),
                    ),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(Images.googleLogo, height: 24),
                        SizedBox(width: 5),
                        Text(
                          'Log In with Google',
                          style: TextStyle(
                            fontFamily: Fonts.semiBold,
                            color: AppColors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // ElevatedButton.icon(
              //   onPressed: () {},
              //   icon: Image.asset(Images.googleLogo, height: 24),
              //   label: Text(
              //     'Log In With Google',
              //     style: TextStyle(
              //       fontFamily: Fonts.semiBold,
              //       color: AppColors.black,
              //     ),
              //   ),
              //   style: ElevatedButton.styleFrom(
              //     minimumSize: Size(double.infinity, 50),
              //   ),
              // ),
              SizedBox(height: 16.0),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Sign Up Here',
                  style: TextStyle(
                    fontFamily: Fonts.medium,
                    color: AppColors.orange,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
