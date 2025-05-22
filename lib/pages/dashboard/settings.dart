import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tasktrek/services/database.dart';
import 'package:tasktrek/styles/styles.dart';
import 'package:tasktrek/widgets/mediaSize.dart';
import 'package:tasktrek/widgets/passwordTextfField.dart';
import 'package:tasktrek/widgets/textFieldRow.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    try {
      final data = await UserCache.getUserData();
      setState(() {
        firstName = data['firstName']!;
        lastName = data['lastName']!;
        birthDate = data['birthDate']!;
        contactNumber = data['contactNumber']!;
        address = data['address']!;
        email = data['email']!;
      });
    } catch (e) {
      print(e);
      // Optionally show an error dialog/snackbar
    }
  }

  @override
  String firstName = '';
  String lastName = '';
  String birthDate = '';
  String contactNumber = '';
  String address = '';
  String email = '';

  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: SizedBox(
            height: 590,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    SizedBox(height: SizeConfig.scaleHeight(25)),
                    Text('Account Information', style: AppTextStyles.title),
                    SizedBox(height: SizeConfig.scaleHeight(15)),
                    Container(
                      constraints: BoxConstraints(
                        maxHeight: 342,
                        minHeight: 342,
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 40,
                        horizontal: 20,
                      ),
                      width: 304,
                      height: 342,
                      decoration: BoxDecoration(
                        color: AppColors.secondaryColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buildInfoHeader(
                            'Personal Information',
                            icon: Icons.person,
                          ),
                          buildInfoRow('First name:', firstName),
                          buildInfoRow('Last name:', lastName),
                          buildInfoRow('Birthdate:', birthDate),
                          buildInfoHeader(
                            'Contact Information',
                            icon: Icons.phone,
                          ),
                          buildInfoRow('Phone No.:', contactNumber),
                          buildInfoRow('Email Address:', email, expand: true),
                          buildInfoHeader('Address', icon: Icons.location_on),

                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  address,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: AppColors.textColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    buildBottomButton(
                      icon: Icons.lock_outline,
                      title: 'Change Password',
                      subtitle: 'Manage your login credentials',
                      onTap: () => changePassword(context),
                    ),
                    SizedBox(height: SizeConfig.scaleHeight(15)),
                    buildBottomButton(
                      icon: Icons.lock_outline,
                      title: 'Logout',
                      subtitle: 'Sign-out and come back for news later!',

                      onTap: () {
                        logOutUser();
                        
                        Navigator.pushReplacementNamed(context, '/');
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildInfoHeader(String title, {IconData? icon}) {
    return Row(
      children: [
        if (icon != null) Icon(icon, size: 20, color: AppColors.accentColor),
        if (icon != null) const SizedBox(width: 5),
        Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
            color: AppColors.accentColor,
          ),
        ),
        const Spacer(),
        if (title == 'Personal Information')
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
              const SizedBox(width: 5),
              SizedBox(
                width: 20,
                child: Image.asset(
                  'lib/assets/images/Union.png',
                  color: Color(0xFF6CDAB3),
                ),
              ),
            ],
          ),
      ],
    );
  }

  Widget buildInfoRow(String label, String value, {bool expand = false}) {
    return Row(
      children: [
        SizedBox(
          width: 120,
          child: Text(
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            label,
            style: TextStyle(fontSize: 14, color: AppColors.textColor),
          ),
        ),
        if (expand)
          Expanded(
            child: Text(
              value,
              style: TextStyle(fontSize: 14, color: AppColors.textColor),
            ),
          )
        else
          SizedBox(
            width: 100,
            child: Text(
              value,
              style: TextStyle(fontSize: 14, color: AppColors.textColor),
            ),
          ),
      ],
    );
  }

  Widget buildBottomButton({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        constraints: BoxConstraints(
          maxHeight: 47,
          minHeight: 47,
          maxWidth: 304,
          minWidth: 304,
        ),
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
                  Icon(icon, size: 20, color: AppColors.accentColor),
                  const SizedBox(width: 10),
                  SizedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: AppColors.accentColor,
                          ),
                        ),
                        Text(
                          subtitle,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: AppColors.accentColor.withOpacity(0.75),
                          ),
                        ),
                      ],
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
            height: 265,
            width: 335,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'New Password',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.accentColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Set the new password for your account so you can login and access all the features.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 10, color: AppColors.textColor),
                ),
                const SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: PasswordTextFieldRow(
                        height: 32,
                        width: 259,
                        controller: passwordController,
                        label: 'Password',
                        isPasswordVisible: true,
                        isPassword: true,
                        hint: 'Enter your password',
                        icon: Icon(Icons.lock_outline),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: PasswordTextFieldRow(
                        height: 32,
                        width: 259,
                        controller: confirmPasswordController,
                        label: 'Confirm Password',
                        isPasswordVisible: true,
                        isPassword: true,
                        hint: 'Enter your password',
                        icon: Icon(Icons.lock_outline),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                SizedBox(
                  width: 250,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 140.25,
                        height: 25,
                        child: ElevatedButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text(
                            textAlign: TextAlign.center,
                            'Change Password',
                            style: TextStyle(fontSize: 13),
                          ),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
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
                ),
              ],
            ),
          ),
        ),
  );
}
