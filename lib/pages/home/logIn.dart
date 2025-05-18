import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tasktrek/styles/styles.dart';
import 'package:tasktrek/services/database.dart';
import 'package:connectivity/connectivity.dart';

class logIn extends StatefulWidget {
  const logIn({super.key});

  @override
  State<logIn> createState() => _logInState();
}

class _logInState extends State<logIn> {
  bool connection = true;
  bool incorrect = false;
  bool obscureTextState = true;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Future<bool> hasInternetConnection() async {
  //   final connectivityResult = await Connectivity().checkConnectivity();

  //   if (connectivityResult == ConnectivityResult.none) {
  //     return false; // No connection
  //   }

  //   return true; // Either mobile or wifi
  // }

  Future<void> validationState() async {
    try {
      final hasConnection = await hasInternetConnection();
      if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
        setState(() {
          incorrect = true;
          connection = hasConnection;
        });
        return;
      }

      final userId = await logInUser(
        email: _emailController.text,
        password: _passwordController.text,
      );
      if (userId.isNotEmpty) {
        setState(() {
          incorrect = false;
          connection = hasConnection;
        });
        Navigator.pushNamed(context, '/DashBoard');
      }
    } catch (e) {
      print('Error during log in: $e');
    }
  }

  void clearErrors() {
    setState(() {
      incorrect = false;
      connection = true;
    });
  }

  void hideText() {
    setState(() {
      obscureTextState = !obscureTextState;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: screenHeight * 0.05),
            child: Text(
              'Welcome !',
              style: TextStyle(
                color: AppColors.textWelcome,
                fontSize: 48,
                fontWeight: FontWeight.bold,
                fontFamily: 'Inter',
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: 342,
            width: 333,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.loginBackground,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.white),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Email',
                      style: TextStyle(fontSize: screenWidth * 0.035),
                    ),
                    SizedBox(height: screenHeight * 0.005),
                    SizedBox(
                      width: 285,
                      height: 40,
                      child: TextField(
                        controller: _emailController,
                        cursorColor: Colors.black,
                        style: TextStyle(
                          fontSize: screenWidth * 0.035,
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 14,
                            horizontal: 12,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 0.8,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 0.8,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          hintText: 'johndoe@gmail.com',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: screenWidth * 0.035,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Password',
                      style: TextStyle(fontSize: screenWidth * 0.035),
                    ),
                    SizedBox(height: screenHeight * 0.005),
                    SizedBox(
                      width: 285,
                      height: 40,
                      child: TextField(
                        obscureText: obscureTextState,
                        controller: _passwordController,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          contentPadding: EdgeInsets.symmetric(
                            vertical: screenWidth * 0.01,
                            horizontal: screenWidth * 0.02,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: const Color.fromARGB(131, 158, 158, 158),
                              width: 0.8,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),

                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 0.8,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          isDense: true,
                          hintText: 'Enter your password',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: screenWidth * 0.035,
                          ),

                          suffixIcon: GestureDetector(
                            onTap: hideText,
                            child: Icon(
                              obscureTextState
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 285,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: validationState,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.blackButton,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Sign In',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/Forgot');
                    },
                    child: Text(
                      'Forgot password?',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        decoration: TextDecoration.underline,
                        decorationThickness: 2,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            //signup
            alignment: Alignment.center,
            height: screenHeight * 0.25,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (!connection)
                  Container(
                    width: screenWidth * 0.73,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: AppColors.errorColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          'lib/assets/images/Group_187.png',
                          width: 40,
                          height: 40,
                        ),

                        Container(
                          width: screenWidth * 0.5,
                          height: screenHeight * 0.08,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Lost Connection!',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenHeight * 0.018,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Please check your internet connection.',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenHeight * 0.015,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: screenWidth * 0.08,
                          alignment: Alignment.topCenter,
                          child: GestureDetector(
                            onTap: clearErrors,
                            child: Icon(
                              Icons.close,
                              color: Colors.white,
                              size: screenHeight * 0.02,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                else if (incorrect)
                  Container(
                    width: screenWidth * 0.73,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: const Color(0xFF050A35),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.close_sharp,
                          color: const Color.fromARGB(255, 200, 51, 40),
                          size: screenHeight * 0.07,
                        ),
                        Container(
                          width: screenWidth * 0.5,
                          height: screenHeight * 0.08,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Cannot log in',
                                style: TextStyle(
                                  color: const Color(0xFFF64040),
                                  fontSize: screenHeight * 0.018,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Username or Password is incorrect.',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenHeight * 0.015,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: screenWidth * 0.08,
                          alignment: Alignment.topCenter,
                          child: GestureDetector(
                            onTap: clearErrors,
                            child: Icon(
                              Icons.close,
                              color: Colors.white,
                              size: screenHeight * 0.02,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Don\'t have an account?',
                style: TextStyle(fontSize: screenWidth * 0.035),
              ),
              SizedBox(width: screenWidth * 0.01),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/SignUpForm');
                },
                child: Text(
                  'Create a new account.',
                  style: TextStyle(
                    fontSize: screenWidth * 0.035,
                    color: Color(0xFF3336AB),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
