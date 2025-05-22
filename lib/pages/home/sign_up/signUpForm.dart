import 'package:flutter/material.dart';
import 'package:tasktrek/pages/home/sign_up/credentialsForm.dart';
import 'package:tasktrek/pages/home/sign_up/informationForm.dart';
import 'package:tasktrek/services/database.dart';
import 'package:tasktrek/styles/styles.dart';
import 'package:tasktrek/widgets/mediaSize.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  bool isInformationForm = true;
  final bool clear = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _contactNumberController =
      TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();

  Future<void> insertNewUser() async {
    try {
      print(_emailController.text);
      print(_passwordController.text);
      print(_firstNameController.text);
      print(_lastNameController.text);
      print(_contactNumberController.text);
      print(_addressController.text);
      if (_emailController.text.isEmpty ||
          _passwordController.text.isEmpty ||
          _firstNameController.text.isEmpty ||
          _lastNameController.text.isEmpty ||
          _contactNumberController.text.isEmpty ||
          _addressController.text.isEmpty ||
          _birthDateController.text.isEmpty) {
        throw Exception('All fields are required');
      } else if (_passwordController.text != _confirmPasswordController.text) {
        throw Exception('Passwords do not match');
      }
      final success = await signUpAndInsertUser(
        email: _emailController.text,
        password: _passwordController.text,
        firstName: _firstNameController.text,
        lastName: _lastNameController.text,
        contactNumber: _contactNumberController.text,
        address: _addressController.text,
        birthDate: _birthDateController.text,
      );
      if (success) {
        Navigator.pushNamed(context, '/DashBoard');
      } else {
        throw Exception('Failed to insert user');
      }
    } catch (e) {
      print(e);
    }
  }

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
              child:
                  isInformationForm
                      ? InformationForm(
                        buttonPressed: () {
                          setState(() {
                            isInformationForm = false;
                          });
                        },
                        firstNameController: _firstNameController,
                        lastNameController: _lastNameController,
                        contactNumberController: _contactNumberController,
                        addressController: _addressController,
                        birthDateController: _birthDateController,
                      )
                      : CredentialsForm(
                        insertUser: insertNewUser,
                        emailController: _emailController,
                        passwordController: _passwordController,
                        confirmPasswordController: _confirmPasswordController,
                      ),
            ),

            // Button to move to the next form
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 10,
                        width: 70,
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
                        height: 10,
                        width: 70,
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
