import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tasktrek/styles/styles.dart';
import 'package:tasktrek/services/database.dart';
import 'package:tasktrek/widgets/mediaSize.dart';

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
      //final hasConnection = await hasInternetConnection();
      if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
        setState(() {
          incorrect = true;
          connection = true;
        });
        return;
      }

      final userId = await logInUser(
        email: _emailController.text,
        password: _passwordController.text,
      );
      if (userId) {
        setState(() {
          incorrect = false;
          connection = true;
        });
        Navigator.pushNamed(context, '/DashBoard');
      } else {
        setState(() {
          incorrect = true;
          connection = true;
        });
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
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context); // Initialize screen size data

    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(30),
              child: Column(
                children: [
                  SizedBox(height: SizeConfig.scaleHeight(100)),
                  Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Text(
                      'Welcome !',
                      style: TextStyle(
                        color: AppColors.textWelcome,
                        fontSize: 40,

                        fontWeight: FontWeight.bold,
                        fontFamily: 'Inter',
                      ),
                    ),
                  ),

                  // Login Box
                  Container(
                    constraints: BoxConstraints(
                      maxHeight: 342,
                      maxWidth: 333,
                      minHeight: 342,
                      minWidth: 333,
                    ),
                    padding: EdgeInsets.all(SizeConfig.scaleWidth(20)),
                    decoration: BoxDecoration(
                      color: AppColors.loginBackground,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.white),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Email
                        Text('Email', style: TextStyle(fontSize: 16)),
                        SizedBox(height: 10),
                        SizedBox(
                          height: SizeConfig.scaleHeight(40),
                          width: SizeConfig.scaleWidth(285),
                          child: TextField(
                            controller: _emailController,
                            cursorColor: Colors.black,
                            style: TextStyle(fontSize: 14, color: Colors.black),
                            decoration: _inputDecoration('johndoe@gmail.com'),
                          ),
                        ),

                        SizedBox(height: 20),

                        // Password
                        Text(
                          'Password',
                          style: TextStyle(fontSize: SizeConfig.scaleWidth(14)),
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                          height: SizeConfig.scaleHeight(40),
                          width: SizeConfig.scaleWidth(285),
                          child: TextField(
                            controller: _passwordController,
                            obscureText: obscureTextState,
                            cursorColor: Colors.black,
                            decoration: _inputDecoration(
                              'Enter your password',
                            ).copyWith(
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

                        SizedBox(height: 20),

                        // Sign In Button
                        SizedBox(
                          width: double.infinity,
                          height: SizeConfig.scaleHeight(40),
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
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: 20),

                        GestureDetector(
                          onTap: () => Navigator.pushNamed(context, '/Forgot'),
                          child: Text(
                            'Forgot password?',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 20),

                  SizedBox(
                    height: SizeConfig.scaleHeight(100),
                    child: Column(
                      children: [
                        (!connection || incorrect)
                            ? _buildErrorBox()
                            : SizedBox(height: SizeConfig.scaleHeight(100)),
                      ],
                    ),
                  ),

                  // Sign up prompt
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                        style: TextStyle(fontSize: SizeConfig.scaleWidth(13)),
                      ),
                      SizedBox(width: 5),
                      GestureDetector(
                        onTap:
                            () => Navigator.pushNamed(context, '/SignUpForm'),
                        child: Text(
                          'Create a new account.',
                          style: TextStyle(
                            fontSize: SizeConfig.scaleWidth(13),
                            color: Color(0xFF3336AB),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      filled: true,
      fillColor: Colors.white,
      hintText: hint,
      contentPadding: EdgeInsets.symmetric(
        vertical: SizeConfig.scaleHeight(10),
        horizontal: SizeConfig.scaleWidth(12),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.grey),
      ),
    );
  }

  Widget _buildErrorBox() {
    return Container(
      width: 319,
      height: 68,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.errorColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            incorrect ? Icons.close_sharp : Icons.wifi_off,
            color: Colors.white,
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  incorrect ? 'Cannot log in' : 'Lost Connection!',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: SizeConfig.scaleHeight(16),
                  ),
                ),
                Text(
                  incorrect
                      ? 'Username or Password is incorrect.'
                      : 'Please check your internet connection.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: SizeConfig.scaleHeight(13),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: clearErrors,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [Icon(Icons.close, color: Colors.white, size: 15)],
            ),
          ),
        ],
      ),
    );
  }
}
