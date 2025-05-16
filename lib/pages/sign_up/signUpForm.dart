import 'package:flutter/material.dart';
import 'package:tasktrek/pages/sign_up/credentialsForm.dart';
import 'package:tasktrek/pages/sign_up/informationForm.dart';
import 'package:tasktrek/styles/styles.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  bool isInformationForm = true; // Tracks which form is currently active

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async {
        if (!isInformationForm) {
          setState(() {
            isInformationForm = true;
          });
          return false; // prevent popping when on the Credentials form
        }
        return true; // allow pop if already on the Information form
      },
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        appBar: AppBar(
          title: Text(
            'Register',
            style: TextStyle(
              color: AppColors.accentColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: AppColors.primaryColor,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: AppColors.accentColor),
            onPressed: () {
              if (!isInformationForm) {
                setState(() {
                  isInformationForm = true;
                });
              } else {
                Navigator.pop(context);
              }
            },
          ),
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.center,
                  width: screenWidth * 0.5,
                  decoration:
                      isInformationForm
                          ? BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: AppColors.accentColor,
                                width: 2,
                              ),
                            ),
                          )
                          : null,
                  padding: EdgeInsets.all(8),
                  child: Text(
                    'Information',
                    style: TextStyle(
                      color: AppColors.accentColor,
                      fontSize: 16,
                      fontWeight:
                          isInformationForm
                              ? FontWeight.bold
                              : FontWeight.normal,
                    ),
                  ),
                ),

                Container(
                  alignment: Alignment.center,
                  width: screenWidth * 0.5,
                  decoration:
                      !isInformationForm
                          ? BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: AppColors.accentColor,
                                width: 2,
                              ),
                            ),
                          )
                          : null,
                  padding: EdgeInsets.all(8),
                  child: Text(
                    'Credentials',
                    style: TextStyle(
                      color: AppColors.accentColor,
                      fontSize: 16,
                      fontWeight:
                          !isInformationForm
                              ? FontWeight.bold
                              : FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            // Show either the Information or Credentials form
            Expanded(
              child: isInformationForm ? InformationForm() : CredentialsForm(),
            ),
            // Button to move to the next form
            Padding(
              padding: const EdgeInsets.all(35.0),
              child: Column(
                children: [
                  Container(
                    width: screenWidth * 0.65,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: screenHeight * 0.04,
                            child: ElevatedButton(
                              onPressed: () {
                                if (isInformationForm) {
                                  setState(() {
                                    isInformationForm =
                                        false; // Move to Credentials form
                                  });
                                } else {
                                  Navigator.pushNamed(context, '/DashBoard');
                                  // Perform signup logic or navigate elsewhere
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
                                isInformationForm ? 'Next' : 'Submit',
                                style: TextStyle(
                                  color: AppColors.accentColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: screenHeight * 0.015,
                        width: screenHeight * 0.08,
                        decoration: BoxDecoration(
                          color:
                              isInformationForm
                                  ? AppColors.accentColor
                                  : const Color.fromARGB(124, 5, 10, 53),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        height: screenHeight * 0.015,
                        width: screenHeight * 0.08,
                        decoration: BoxDecoration(
                          color:
                              !isInformationForm
                                  ? AppColors.accentColor
                                  : const Color.fromARGB(124, 5, 10, 53),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ],
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

// Example Information form widget
