import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:tasktrek/widgets/styles.dart';

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
          backgroundColor: const Color(0xFF018F81),
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
                    'Information',
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

// Example Credentials form widget
class CredentialsForm extends StatelessWidget {
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Personal Information',
                  style: TextStyle(
                    color: AppColors.accentColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                
                SizedBox(
                  width: screenWidth * 0.6,
                  child: Opacity(
                    opacity: 0.5,
                    child: Text(
                      'This will be your account details when logging in to this app.',
                      softWrap: true,
                      style: TextStyle(
                        
                        color: AppColors.accentColor,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight * 0.04,),
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
                        'Username',
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
                        'Password',
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
                          obscureText: true,
                          textAlign: TextAlign.start,
                          cursorColor: AppColors.accentColor,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 10,
                            ),
                            hintText: 'Password',
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
                        'Confirm Password',
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
                          obscureText: true,
                          textAlign: TextAlign.start,
                          cursorColor: AppColors.accentColor,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 10,
                            ),
                            hintText: 'Confirm Password',
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
