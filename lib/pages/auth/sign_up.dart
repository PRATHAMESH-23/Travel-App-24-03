import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/config/constants.dart';
import 'package:travel_app/pages/auth/sign_in.dart';
import 'package:travel_app/widgets/textfield_widget.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _termsAccepted = false;
  String? _selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    Image.asset(Images.logo),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                    Text(
                      "Sign Up",
                      style: TextStyle(
                        fontFamily: Fonts.regular,
                        fontSize: WidgetSize.fontSize_28,
                      ),
                    ),
                  ],
                ),
              ),
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
              Row(
                // Center the row
                children: <Widget>[
                  _buildGenderButton('Male'),
                  Spacer(), // Add some spacing between the buttons
                  _buildGenderButton('Female'),
                ],
              ),
              SizedBox(height: 8.0),
              Text(
                "Password",
                style: TextStyle(
                  fontFamily: Fonts.medium,
                  fontSize: WidgetSize.fontSize_16,
                  color: AppColors.textfieldLabel,
                ),
              ),
              TextfieldWidget(
                icon: Icon(Icons.visibility),
                isPassword: true,
                hintText: '************',
              ),
              SizedBox(height: 12.0),
              Text(
                "Confirm Password",
                style: TextStyle(
                  fontFamily: Fonts.medium,
                  fontSize: WidgetSize.fontSize_16,
                  color: AppColors.textfieldLabel,
                ),
              ),
              TextfieldWidget(
                icon: Icon(Icons.visibility),
                isPassword: true,
                hintText: '************',
              ),
              SizedBox(height: 8.0),
              Row(
                children: [
                  _checkBox(),
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'I agree and accept the ',
                          style: TextStyle(
                            color: AppColors.black,
                            fontFamily: Fonts.medium,
                          ),
                        ),
                        TextSpan(
                          text: 'terms of use.',
                          style: TextStyle(
                            color: AppColors.orange,
                            fontFamily: Fonts.medium,
                          ),
                          // recognizer: TapGestureRecognizer()..onTap = () {
                          //   // Navigate to terms and conditions page
                          // },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
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
                    'Sign Up',
                    style: TextStyle(
                      fontFamily: Fonts.semiBold,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        const TextSpan(
                          text: 'Already have an account ? ',
                          style: TextStyle(
                            fontFamily: Fonts.medium,
                            color: AppColors.black,
                            fontSize: WidgetSize.fontSize_14,
                          ),
                        ),
                        TextSpan(
                          text: 'Sign in',
                          style: const TextStyle(
                            fontFamily: Fonts.medium,
                            color: AppColors.orange,
                            fontSize: WidgetSize.fontSize_14,
                          ),
                          recognizer:
                              TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const SignInPage(),
                                    ),
                                  );
                                },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGenderButton(String gender) {
    bool isSelected = _selectedGender == gender;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedGender = gender;
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.4,
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          // Light grey background
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.textFieldBorder),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min, // Make the row fit its content
          children: <Widget>[
            Text(
              gender,
              style: TextStyle(
                fontFamily: Fonts.medium,
                color: AppColors.textfieldLabel,
              ),
            ),
            Spacer(),
            if (isSelected) ...[
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 12, maxHeight: 12),
                child: Checkbox(
                  checkColor: AppColors.orange,
                  fillColor: WidgetStateProperty.resolveWith<Color?>((
                    Set<WidgetState> states,
                  ) {
                    return Colors.orange[100];
                  }),
                  value: isSelected,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      5.0,
                    ), // Add radius to checkbox
                  ),
                  onChanged: (bool? value) {},
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _checkBox() {
    return Checkbox(
      checkColor: AppColors.orange,
      fillColor: WidgetStateProperty.resolveWith<Color?>((
        Set<WidgetState> states,
      ) {
        return Colors.orange[100];
      }),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0), // Add radius to checkbox
      ),
      side: BorderSide.none, // Remove border
      value: _termsAccepted,
      onChanged: (bool? value) {
        setState(() {
          _termsAccepted = value ?? false;
        });
      },
    );
  }
}
