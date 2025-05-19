import 'package:flutter/material.dart';
import 'package:tasktrek/styles/styles.dart';
import 'package:tasktrek/widgets/textFieldRow.dart';

class CredentialsForm extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  CredentialsForm({
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
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
                SizedBox(height: 20),
              ],
            ),
          ),
          Container(
            width: screenWidth * 0.9,
            padding: EdgeInsets.only(right: screenWidth * 0.3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Login Credentials',
                  style: TextStyle(
                    color: AppColors.accentColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'This will be your account details when logging in to this app.',
                  style: TextStyle(
                    color: AppColors.accentColor.withOpacity(0.5),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildTextFieldRow(
                  'Email',
                  'example@gmail.com',
                  emailController,
                  Icon(Icons.circle, color: AppColors.accentColor)
                  
                ),
                buildTextFieldRow(
                  'Password',
                  'enter password',
                  passwordController,
                  Icon(Icons.circle, color: AppColors.accentColor)
                ),
                buildTextFieldRow(
                  'Confirm Password',
                  'enter password',
                  confirmPasswordController,
                  Icon(Icons.circle, color: AppColors.accentColor)
                ),
              ],
            ),
          ),

          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: TextStyle(
                        color: AppColors.accentColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Login',
                      style: TextStyle(
                        color: AppColors.itemContainer,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
