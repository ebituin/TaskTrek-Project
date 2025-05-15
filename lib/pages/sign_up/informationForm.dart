import 'package:flutter/material.dart';
import 'package:tasktrek/pages/sign_up/signUpForm.dart';
import 'package:tasktrek/styles/styles.dart';

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
          Container(
            width: screenWidth * 0.65,
            child: Row(
              crossAxisAlignment:
                  CrossAxisAlignment.center, // Align top of icon and column
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 25,
                  ), // Align icon with TextFormField
                  child: Icon(Icons.circle, color: AppColors.accentColor),
                ),
                SizedBox(width: 12), // spacing between icon and input
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'First Name',
                        style: TextStyle(
                          color: AppColors.accentColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 4),
                      SizedBox(
                        height: screenHeight * 0.04,
                        child: TextFormField(
                          textAlign: TextAlign.start,
                          cursorColor: AppColors.accentColor,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 10,
                            ),
                            hintText: 'NIWANG',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(
                                color: AppColors.accentColor,
                                width: 2,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(
                                color: AppColors.accentColor,
                                width: 2,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(
                                color: AppColors.accentColor,
                                width: 2.5,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight * 0.02),
          Container(
            width: screenWidth * 0.65,
            child: Row(
              crossAxisAlignment:
                  CrossAxisAlignment.center, // Align top of icon and column
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 25,
                  ), // Align icon with TextFormField
                  child: Icon(Icons.circle, color: AppColors.accentColor),
                ),
                SizedBox(width: 12), // spacing between icon and input
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Last Name',
                        style: TextStyle(
                          color: AppColors.accentColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 4),
                      SizedBox(
                        height: screenHeight * 0.04,
                        child: TextFormField(
                          textAlign: TextAlign.start,
                          cursorColor: AppColors.accentColor,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 10,
                            ),
                            hintText: 'ARIZALA',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(
                                color: AppColors.accentColor,
                                width: 2,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(
                                color: AppColors.accentColor,
                                width: 2,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(
                                color: AppColors.accentColor,
                                width: 2.5,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight * 0.02),
          Container(
            width: screenWidth * 0.65,
            child: Row(
              crossAxisAlignment:
                  CrossAxisAlignment.center, // Align top of icon and column
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 25,
                  ), // Align icon with TextFormField
                  child: Icon(Icons.circle, color: AppColors.accentColor),
                ),
                SizedBox(width: 12), // spacing between icon and input
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Contact Number',
                        style: TextStyle(
                          color: AppColors.accentColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 4),
                      SizedBox(
                        height: screenHeight * 0.04,
                        child: TextFormField(
                          textAlign: TextAlign.start,
                          cursorColor: AppColors.accentColor,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 10,
                            ),
                            hintText: '09704412399',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(
                                color: AppColors.accentColor,
                                width: 2,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(
                                color: AppColors.accentColor,
                                width: 2,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(
                                color: AppColors.accentColor,
                                width: 2.5,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight * 0.02),
          Container(
            width: screenWidth * 0.65,
            child: Row(
              crossAxisAlignment:
                  CrossAxisAlignment.center, // Align top of icon and column
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 25,
                  ), // Align icon with TextFormField
                  child: Icon(Icons.circle, color: AppColors.accentColor),
                ),
                SizedBox(width: 12), // spacing between icon and input
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Address',
                        style: TextStyle(
                          color: AppColors.accentColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 4),
                      SizedBox(
                        height: screenHeight * 0.04,
                        child: TextFormField(
                          textAlign: TextAlign.start,
                          cursorColor: AppColors.accentColor,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 10,
                            ),
                            hintText: 'Naga City, Camarines Sur',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(
                                color: AppColors.accentColor,
                                width: 2,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(
                                color: AppColors.accentColor,
                                width: 2,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(
                                color: AppColors.accentColor,
                                width: 2.5,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight * 0.02),
          Container(
            width: screenWidth * 0.65,
            child: Row(
              crossAxisAlignment:
                  CrossAxisAlignment.center, // Align top of icon and column
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 25,
                  ), // Align icon with TextFormField
                  child: Icon(Icons.circle, color: AppColors.accentColor),
                ),
                SizedBox(width: 12), // spacing between icon and input
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Birth Day',
                        style: TextStyle(
                          color: AppColors.accentColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 4),
                      SizedBox(
                        height: screenHeight * 0.04,
                        child: TextFormField(
                          textAlign: TextAlign.start,
                          cursorColor: AppColors.accentColor,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 10,
                            ),
                            hintText: '1999-01-23',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(
                                color: AppColors.accentColor,
                                width: 2,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(
                                color: AppColors.accentColor,
                                width: 2,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(
                                color: AppColors.accentColor,
                                width: 2.5,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight * 0.02),
          Container(
            width: screenWidth * 0.65,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
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
