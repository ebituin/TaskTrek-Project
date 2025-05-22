import 'package:flutter/material.dart';
import 'package:tasktrek/pages/dashboard/dashBoard.dart';
import 'package:tasktrek/styles/styles.dart';
import 'package:tasktrek/widgets/mediaSize.dart';
import 'package:tasktrek/widgets/textFieldRow.dart';

class CredentialsForm extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final Future<void> Function() insertUser;

  CredentialsForm({
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.insertUser,
  });

  @override
  State<CredentialsForm> createState() => _CredentialsFormState();
}

class _CredentialsFormState extends State<CredentialsForm> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    bool passwordMatched = false;
    return SingleChildScrollView(
      child: Container(
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
                ],
              ),
            ),
            Container(
              width: 400,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                PasswordTextFieldRow(
                  isPasswordVisible: true,
                  label: 'Email',
                  hint: 'example@gmail.com',
                  controller: widget.emailController,
                  icon: Icon(Icons.circle, color: AppColors.accentColor),
                ),
                PasswordTextFieldRow(
                  label: 'Password',
                  hint: 'enter password',
                  controller: widget.passwordController,
                  icon: Icon(Icons.circle, color: AppColors.accentColor),
                  isPassword: true,
                ),
                PasswordTextFieldRow(
                  label: 'Confirm Password',
                  hint: 'enter password',
                  controller: widget.confirmPasswordController,
                  icon: Icon(Icons.circle, color: AppColors.accentColor),
                  isPassword: true,
                ),
              ],
            ),
            ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 40),
              child: SizedBox(height: SizeConfig.screenHeight * 0.05),
            ),
            Column(
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
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, '/logIn');
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: AppColors.itemContainer,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 40),
              child: SizedBox(height: SizeConfig.screenHeight * 0.05),
            ),
            SizedBox(
              width: 280,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (widget.emailController.text.isNotEmpty &&
                          widget.confirmPasswordController.text.isNotEmpty &&
                          widget.passwordController.text.isNotEmpty) {
                        if (widget.confirmPasswordController.text ==
                            widget.passwordController.text) {
                          widget.insertUser();
                          Navigator.pushReplacementNamed(context, '/');
                        } else {
                          showDialog(
                            context: context,
                            builder:
                                (context) => AlertDialog(
                                  backgroundColor: AppColors.primaryColor,
                                  title: Text(
                                    'Error',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.accentColor,
                                    ),
                                  ),
                                  content: Text(
                                    'Password do not matched',
                                    style: TextStyle(
                                      color: AppColors.accentColor,
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        'OK',
                                        style: TextStyle(
                                          color: AppColors.accentColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                          );
                        }
                      } else {
                        showDialog(
                          context: context,
                          builder:
                              (context) => AlertDialog(
                                backgroundColor: AppColors.primaryColor,
                                title: Text(
                                  'Error',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.accentColor,
                                  ),
                                ),
                                content: Text(
                                  'Please fill in all fields',
                                  style: TextStyle(
                                    color: AppColors.accentColor,
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      'OK',
                                      style: TextStyle(
                                        color: AppColors.accentColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(
                          color: AppColors.accentColor,
                          width: 1,
                        ),
                      ),
                    ),
                    child: Text(
                      'Confirm',
                      style: TextStyle(
                        color: AppColors.accentColor,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
