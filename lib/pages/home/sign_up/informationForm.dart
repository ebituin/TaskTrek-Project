import 'package:flutter/material.dart';
import 'package:tasktrek/styles/styles.dart';
import 'package:tasktrek/widgets/mediaSize.dart';
import 'package:tasktrek/widgets/textFieldRow.dart';

class InformationForm extends StatefulWidget {
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController contactNumberController;
  final TextEditingController addressController;
  final TextEditingController birthDateController;
  final VoidCallback buttonPressed;
  InformationForm({
    required this.firstNameController,
    required this.lastNameController,
    required this.contactNumberController,
    required this.addressController,
    required this.birthDateController,
    required this.buttonPressed,
  }) {
    print('InformationForm: ${firstNameController.text}');
  }

  @override
  State<InformationForm> createState() => _InformationFormState();
}

class _InformationFormState extends State<InformationForm> {
  // @override
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
              width: SizeConfig.scaleWidth(350),
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
              constraints: BoxConstraints(maxHeight: 35),
              alignment: Alignment.centerLeft,
              width: 350,
              height: (SizeConfig.scaleHeight(55)),
              child: Text(
                'Personal Information',
                style: TextStyle(
                  color: AppColors.accentColor,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Column(
              children: [
                PasswordTextFieldRow(
                  filled: true,
                  width: 258,
                  height: 38,
                  label: 'First Name',
                  hint: 'NIWANG',
                  isPasswordVisible: true,
                  controller: widget.firstNameController,
                  icon: Icon(Icons.circle, color: AppColors.accentColor),
                ),

                PasswordTextFieldRow(
                  filled: true,
                  width: 258,
                  height: 38,
                  label: 'Last Name',
                  hint: 'ARIZALA',
                  isPasswordVisible: true,
                  controller: widget.lastNameController,
                  icon: Icon(Icons.circle, color: AppColors.accentColor),
                ),
                PasswordTextFieldRow(
                  filled: true,
                  width: 258,
                  height: 38,
                  label: 'Contact Number',
                  hint: '09123456789',
                  isPasswordVisible: true,
                  controller: widget.contactNumberController,
                  icon: Icon(Icons.circle, color: AppColors.accentColor),
                ),
                PasswordTextFieldRow(
                  filled: true,
                  width: 258,
                  height: 38,
                  label: 'Address',
                  hint: 'Naga City, Camarines Sur',
                  isPasswordVisible: true,
                  controller: widget.addressController,
                  icon: Icon(Icons.circle, color: AppColors.accentColor),
                ),
                PasswordTextFieldRow(
                  filled: true,
                  width: 258,
                  height: 38,
                  label: 'Birth Day',
                  hint: '1999-01-23',
                  isPasswordVisible: true,
                  controller: widget.birthDateController,
                  icon: Icon(Icons.circle, color: AppColors.accentColor),
                ),

                ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 10),
                  child: SizedBox(height: SizeConfig.screenHeight * 0.005),
                ),
                GestureDetector(
                  onTap: () {
                    widget.firstNameController.clear();
                    widget.lastNameController.clear();
                    widget.contactNumberController.clear();
                    widget.addressController.clear();
                    widget.birthDateController.clear();
                  },
                  child: Container(
                    width: 258,
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      child: Text(
                        'Clear Information',
                        style: TextStyle(
                          color: Color(0xFFF64040),
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),

                ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 40),
                  child: SizedBox(height: SizeConfig.screenHeight * 0.02),
                ),
                SizedBox(
                  width: 280,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            if (widget.firstNameController.text.isNotEmpty &&
                                widget.lastNameController.text.isNotEmpty &&
                                widget.addressController.text.isNotEmpty &&
                                widget.birthDateController.text.isNotEmpty &&
                                widget
                                    .contactNumberController
                                    .text
                                    .isNotEmpty) {
                              widget.buttonPressed();
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
                          });
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
                          'Next',
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
          ],
        ),
      ),
    );
  }
}
