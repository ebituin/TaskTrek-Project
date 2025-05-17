import 'package:flutter/material.dart';
import 'package:tasktrek/pages/home/sign_up/signUpForm.dart';
import 'package:tasktrek/styles/styles.dart';
import 'package:tasktrek/widgets/textFieldRow.dart';

class InformationForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          SizedBox(
            width: screenWidth * 0.7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Be part of a Trek!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.accentColor,
                  ),
                ),
                SizedBox(height: 10),
                Opacity(
                  opacity: 0.5,
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Register as a ',
                          style: TextStyle(
                            fontSize: 15,
                            color: AppColors.accentColor,
                          ),
                        ),
                        TextSpan(
                          text: 'Teacher',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: AppColors.accentColor,
                          ),
                        ),
                        TextSpan(
                          text: '. Fill in your information to get started.',
                          style: TextStyle(
                            fontSize: 15,
                            color: AppColors.accentColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            height: screenHeight * 0.08,
            child: Text(
              'Personal Information',
              style: TextStyle(
                color: AppColors.accentColor,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                buildTextFieldRow('First Name', 'NIWANG'),
                buildTextFieldRow('Last Name', 'ARIZALA'),
                buildTextFieldRow('Contact Number', '09704412399'),
                buildTextFieldRow('Address', 'Naga City, Camarines Sur'),
                buildTextFieldRow('Birth Day', '1999-01-23'),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    'Clear Information',
                    style: TextStyle(
                      color: Color(0xFFF64040),
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
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
