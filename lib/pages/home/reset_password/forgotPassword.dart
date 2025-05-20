/*
  Authored by: Aleisha M. Arindaeng
  Company: Stark Industries
  Project: Task Trek
  Feature: [SI-002] Forgot Password
  Description: This page is where the user will input their username in order to get OTP.
*/

import 'package:flutter/material.dart';
import 'package:tasktrek/pages/home/reset_password/resetPassword.dart';
import 'package:tasktrek/pages/home/reset_password/verifyOTP.dart';
import 'package:tasktrek/styles/styles.dart';
import 'package:tasktrek/widgets/passwordTextfField.dart';
import 'package:tasktrek/widgets/textFieldRow.dart';

class ForgotPage extends StatefulWidget {
  const ForgotPage({super.key});

  @override
  State<ForgotPage> createState() => _ForgotPageState();
}

class _ForgotPageState extends State<ForgotPage> {
  final TextEditingController _usernameController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFF6C96B5),
      appBar: AppBar(
        backgroundColor: const Color(0xFF6C96B5),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          PasswordTextFieldRow(
            label: 'USERNAME',
            hint: 'johndoe@gmail.com',
            controller: _usernameController,
            icon: Icon(Icons.person_outline_sharp, color: AppColors.accentColor),
          ),
          Row(
            children: [
              SizedBox(width: 90,),
              SizedBox(
                width: screenWidth * 0.65,
                child: Text('This account will receive an OTP code on their phone number.',
                style: TextStyle(
                  color: AppColors.accentColor.withOpacity(0.5),
                  fontSize: 12,
                  fontWeight: FontWeight.bold
                ),),
              ),
            ],
          ),
          SizedBox(height: 20),
          
          SizedBox(
            width: 130,
            height: 40,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => forgot_page_2()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                'Send OTP',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
