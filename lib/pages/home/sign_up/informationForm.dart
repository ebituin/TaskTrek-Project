import 'package:flutter/material.dart';
import 'package:tasktrek/pages/home/sign_up/signUpForm.dart';
import 'package:tasktrek/styles/styles.dart';
import 'package:tasktrek/widgets/mediaSize.dart';
import 'package:tasktrek/widgets/textFieldRow.dart';

class InformationForm extends StatelessWidget {
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController contactNumberController;
  final TextEditingController addressController;
  final TextEditingController birthDateController;

  InformationForm({
    required this.firstNameController,
    required this.lastNameController,
    required this.contactNumberController,
    required this.addressController,
    required this.birthDateController,
  }) {
    print('InformationForm: ${firstNameController.text}');
  }
  // @override
  // void dispose() {
  //   _firstNameController.dispose();
  //   _lastNameController.dispose();
  //   _contactNumberController.dispose();
  //   _addressController.dispose();
  //   _birthDateController.dispose();
  //   super.dispose();
  // }

  // void _clearInformation() {
  //   _firstNameController.clear();
  //   _lastNameController.clear();
  //   _contactNumberController.clear();
  //   _addressController.clear();
  //   _birthDateController.clear();
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {

    return Container(
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
            alignment: Alignment.centerLeft,
            height: SizeConfig.scaleHeight(55),
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
                buildTextFieldRow('First Name', 'NIWANG', firstNameController, Icon(Icons.circle, color: AppColors.accentColor)),
                buildTextFieldRow('Last Name', 'ARIZALA', lastNameController, Icon(Icons.circle, color: AppColors.accentColor)),
                buildTextFieldRow(
                  'Contact Number',
                  '09704412399',
                  contactNumberController,
                  Icon(Icons.circle, color: AppColors.accentColor)
                ),
                buildTextFieldRow(
                  'Address',
                  'Naga City, Camarines Sur',
                  addressController,
                  Icon(Icons.circle, color: AppColors.accentColor)
                ),
                buildTextFieldRow(
                  'Birth Day',
                  '1999-01-23',
                  birthDateController,
                  Icon(Icons.circle, color: AppColors.accentColor)
                ),
                GestureDetector(
                  //onTap: _clearInformation,
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
