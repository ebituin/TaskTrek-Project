import 'package:flutter/material.dart';
import 'package:tasktrek/pages/signUpAccountType.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
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

  void validationState() {
    setState(() {
      if (_emailController.text.isEmpty && _passwordController.text.isEmpty) {
        incorrect = true;
        connection = false;//internet
      } else if (_emailController.text == 'user@user.com' && _passwordController.text == '123') {
        incorrect = false;
        connection = true;//internet
        if (connection) {
          Navigator.pushNamed(context, '/DashBoard');
        }
      } else {
        incorrect = true;
        connection = false;//internet
      }
    });
  }

  

  void clearErrors() {
    setState(() {
      incorrect = false;
      connection = true;
    });
  }


  void hideText(){
    setState(() {
      obscureTextState = !obscureTextState;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(

      backgroundColor: Color(0xFF018F81),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(//logo
              alignment: Alignment.center,
              height: screenHeight * 0.25,
              child: Text(
                'Welcome !',
                style: TextStyle(
                  fontSize: screenWidth * 0.19,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Title Hero',
                  shadows: [
                    Shadow(
                      color: Colors.black54,
                      offset: Offset(2, 2),
                      blurRadius: 10
                    )
                  ]
                ),
              )
            ),
            Container(//form
              alignment: Alignment.center,
              height: screenHeight * 0.40,
              child: Container(
                padding: EdgeInsets.all(screenWidth * 0.04),
                height: screenHeight * 0.4,
                width: screenWidth * 0.73,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Email',
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.035
                                  ),
                                ),
                                SizedBox(height: screenHeight * 0.005),
                                TextField(
                                  controller: _emailController,
                                  cursorColor: Colors.black,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(vertical:  screenWidth * 0.01 ,horizontal: screenWidth * 0.02),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.grey,
                                        width: 0.8
                                      ),
                                      borderRadius: BorderRadius.circular(6)
                                      ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                        width: 0.8
                                      ),
                                      borderRadius: BorderRadius.circular(6)
                          
                                    ),
                                    isDense: true,
                                    hintText: 'email',
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: screenWidth * 0.035
                                      
                                    )
                                  ),
                                  
                                )
                              ],
                            ) 
                          ),
                          SizedBox(height: screenHeight * 0.025),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Password',
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.035
                                  ),
                                ),
                                SizedBox(height: screenHeight * 0.005),
                                TextField(
                                  obscureText: obscureTextState,
                                  controller: _passwordController,
                                  cursorColor: Colors.black,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(vertical:  screenWidth * 0.01 ,horizontal: screenWidth * 0.02),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: const Color.fromARGB(131, 158, 158, 158),
                                        width: 0.8
                                      ),
                                      borderRadius: BorderRadius.circular(6)
                          
                                      ),
                                      
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                        width: 0.8
                                      ),
                                      borderRadius: BorderRadius.circular(6)
                          
                                    ),
                                    isDense: true,
                                    hintText: 'Enter your password',
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: screenWidth * 0.035
                                    ),
                                    
                                    suffixIcon: GestureDetector(
                                      onTap:hideText,
                                      child: Icon(obscureTextState ? Icons.visibility_off_outlined : Icons.visibility_outlined ),
                                    )
                                    
                                  ),
                                  
                                )
                              ],
                            ) 
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: screenHeight * 0.045,
                      alignment: Alignment.centerLeft,
                      child: ElevatedButton(
                        onPressed: validationState,
                        style: ElevatedButton.styleFrom(
                          iconColor: Colors.black,
                          minimumSize: Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                          backgroundColor: const Color.fromARGB(255, 53, 53, 53),
                        ),
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                            color: Colors.white
                          ),
                          )
                        )
                    ),
                    Container(
                      height: screenHeight * 0.06,
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/Forgot');
                        },
                        child: Text(
                          'Forgot password?',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationThickness: 2
                            
                          ),
                        ),
                      )
                      
                    ),
                  ],
                ),
              )
            ),
            Container(//signup
              alignment: Alignment.center,
              height: screenHeight * 0.25,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if(!connection) 
                  Container(
                    width: screenWidth * 0.73,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: const Color(0xFF050A35)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.wifi_off,
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
                                'Lost Connection!',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenHeight * 0.018,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              Text(
                                'Please check your internet connection.',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenHeight * 0.015
                                ),
                              ),
                              
                            ],

                          )
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
                            )
                          )
                        )
                      ],
                      
                    ),
                  )
                  else if (incorrect)
                  Container(
                    width: screenWidth * 0.73,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: const Color(0xFF050A35)
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
                                'Can not log in',
                                style: TextStyle(
                                  color: const Color(0xFFF64040),
                                  fontSize: screenHeight * 0.018,
                                  fontWeight: FontWeight.bold

                                ),
                              ),
                              Text(
                                'Username or Password is incorrect.',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenHeight * 0.015
                                ),
                              ),
                              
                            ],

                          )
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
                            )
                          )
                        )
                      ],
                      
                    ),
                  ),
                  Container(
                    height: screenHeight * 0.07,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t have an account?',
                          style: TextStyle(
                            fontSize: screenWidth * 0.035,
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.01),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/SignUp');
                          },
                          child: Text(
                          'Create a new account.',
                            style: TextStyle(
                              fontSize: screenWidth * 0.035,
                              color: const Color(0xFF3336AB),
                              fontWeight: FontWeight.bold,
                              
                            ),
                          ),
                        ),
                      ],
                    ),
                  ) 
                ],
              ) 
            )
          ],
        )
      ),
    );
  }
}