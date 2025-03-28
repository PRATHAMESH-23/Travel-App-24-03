import 'package:flutter/material.dart';
import 'package:travel_app/config/constants.dart';
import 'package:travel_app/pages/auth/sign_up.dart';
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              Image.asset(Images.logo),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              Center(
                child: Text(
                  "Log In",
                  style: TextStyle(
                    fontFamily: Fonts.regular,
                    fontSize: WidgetSize.fontSize_28,
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Text(
                "Email",
                style: TextStyle(
                  fontFamily: Fonts.medium,
                  fontSize: WidgetSize.fontSize_16,
                  color: AppColors.textfieldLabel,
                ),
              ),
              TextfieldWidget(hintText: 'Enter Your Email'),
              SizedBox(height: 16.0),
              Text(
                "Password",
                style: TextStyle(
                  fontFamily: Fonts.medium,
                  fontSize: WidgetSize.fontSize_16,
                  color: AppColors.textfieldLabel,
                ),
              ),
              TextfieldWidget(
                hintText: '************',
                icon: Icon(Icons.visibility),
                isPassword: true,
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
              Center(
                child: Text(
                  'Or',
                  style: TextStyle(
                    fontFamily: Fonts.semiBold,
                    color: AppColors.subText,
                  ),
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
              SizedBox(height: 16.0),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const SignUpPage()),
                  ); // Replace MyHomePage
                },
                child: Center(
                  child: Text(
                    'Sign Up Here',
                    style: TextStyle(
                      fontFamily: Fonts.medium,
                      color: AppColors.orange,
                    ),
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
