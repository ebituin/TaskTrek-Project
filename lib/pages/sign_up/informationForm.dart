import 'package:flutter/material.dart';
import 'package:tasktrek/pages/sign_up/signUpForm.dart';
import 'package:tasktrek/styles/styles.dart';
import 'package:tasktrek/widgets/textFieldRow.dart';

class InformationForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Container(
            width: screenWidth * 0.7,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                Opacity(
                  opacity: 0.5,
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: <TextSpan>[
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
                            color: AppColors.accentColor,
                            fontWeight: FontWeight.bold,
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
                buildTextFieldRow('First Name', 'NIWANG', screenHeight),
                buildTextFieldRow('Last Name', 'ARIZALA', screenHeight),
                buildTextFieldRow(
                  'Contact Number',
                  '09704412399',
                  screenHeight,
                ),
                buildTextFieldRow(
                  'Address',
                  'Naga City, Camarines Sur',
                  screenHeight,
                ),
                buildTextFieldRow('Birth Day', '1999-01-23', screenHeight),
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
