import 'package:flutter/material.dart';
import 'package:tasktrek/styles/styles.dart';
import 'package:tasktrek/widgets/passwordTextfField.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.03),
            Text('Account Information', style: AppTextStyles.title),
            SizedBox(height: screenHeight * 0.02),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.047,
                horizontal: screenWidth * 0.05,
              ),
              width: 304,
              height: 342,
              decoration: BoxDecoration(
                color: AppColors.secondaryColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.person,
                            size: screenWidth * 0.05,
                            color: AppColors.accentColor,
                          ),
                          SizedBox(width: 5),
                          Text(
                            'Personal Information',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: AppColors.accentColor,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Edit',
                            style: TextStyle(
                              fontSize: 13,
                              color: Color(0xFF6CDAB3),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 5),
                          SizedBox(
                            width: screenWidth * 0.05,
                            child: Image.asset(
                              'lib/assets/images/Union.png',
                              color: Color(0xFF6CDAB3),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: screenWidth * 0.3,
                        child: Text(
                          'First name:',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.textColor,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: screenWidth * 0.3,
                        child: Text(
                          'John Kane',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.textColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: screenWidth * 0.3,
                        child: Text(
                          'Last name:',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.textColor,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: screenWidth * 0.3,
                        child: Text(
                          'Doe',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.textColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: screenWidth * 0.3,
                        child: Text(
                          'Birthdate:',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.textColor,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: screenWidth * 0.3,
                        child: Text(
                          'Jan 1, 2023',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.textColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.phone,
                        size: screenWidth * 0.05,
                        color: AppColors.accentColor,
                      ),
                      SizedBox(width: 5),
                      Text(
                        'Contact Information',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textColor,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: screenWidth * 0.3,
                        child: Text(
                          'Phone No.:',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.textColor,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: screenWidth * 0.3,
                        child: Text(
                          '0970 322 5561',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.textColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: screenWidth * 0.3,
                        child: Text(
                          'Email Address:',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.textColor,
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          width: screenWidth * 0.3,
                          child: Text(
                            'jdoe@gmail.com',
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.textColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: screenWidth * 0.05,
                        color: AppColors.accentColor,
                      ),
                      SizedBox(width: 5),
                      Text(
                        'Address',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textColor,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          child: Text(
                            'L-5, BLK-22, Spriteville San Felipe, Naga City, Camarines Sur',
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.textColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.15),
            GestureDetector(
              onTap: () {
                changePassword(context);
              },
              child: Container(
                alignment: Alignment.center,
                width: 304,
                height: 47,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Row(
                        children: [
                          Icon(
                            Icons.lock_outline,
                            size: 20,
                            color: AppColors.accentColor,
                          ),
                          const SizedBox(width: 10),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Change Password',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.accentColor,
                                ),
                              ),
                              Text(
                                'Manage your login credentials',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.accentColor.withOpacity(
                                    0.75,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Icon(
                        Icons.arrow_forward,
                        size: 20,
                        color: AppColors.accentColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.04),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
              child: Container(
                alignment: Alignment.center,
                width: 304,
                height: 47,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Row(
                        children: [
                          Icon(
                            Icons.lock_outline,
                            size: 20,
                            color: AppColors.accentColor,
                          ),
                          const SizedBox(width: 10),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Logout',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.accentColor,
                                ),
                              ),
                              Text(
                                'Sign-out and come back for news later!',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.accentColor.withOpacity(
                                    0.75,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Icon(
                        Icons.arrow_forward,
                        size: 20,
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
    );
  }
}

void changePassword(BuildContext context) {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
    ),
    builder:
        (context) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: SizedBox(
            height: 329,
            width: 441,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'New Password',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.accentColor,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Set the new password for your account so you can login and access all the features.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 10, color: AppColors.textColor),
                ),
                SizedBox(height: 20),

                // Password Field
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20, right: 8),
                      child: Icon(
                        Icons.lock_outline,
                        size: 20,
                        color: AppColors.accentColor,
                      ),
                    ),
                    Expanded(
                      child: PasswordTextField(
                        controller: passwordController,
                        label: 'Password',
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 10),

                // Confirm Password Field
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20, right: 8),
                      child: Icon(
                        Icons.lock_outline,
                        size: 20,
                        color: AppColors.accentColor,
                      ),
                    ),
                    Expanded(
                      child: PasswordTextField(
                        controller: confirmPasswordController,
                        label: 'Confirm Password',
                      ),
                    ),
                  ],
                ),

                Spacer(),

                // Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 100,
                        height: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 220,
                      height: 42,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Change Password'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.accentColor,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
  );
}
