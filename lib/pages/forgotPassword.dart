/* 
  Authored by: Aleisha M. Arindaeng
  Company: Stark Industries
  Project: Task Trek
  Feature: [SI-002] Forgot Password
  Description: This page is where the user will input their username in order to get otp.
 */


import 'package:flutter/material.dart';
import 'package:tasktrek/pages/verifyOTP.dart';

class forgot_page extends StatefulWidget {
  const forgot_page({super.key});



  @override
  State<forgot_page> createState() => _forgot_pagePageState();
}

class _forgot_pagePageState extends State<forgot_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF6C96B5),
      appBar: AppBar(
        backgroundColor: Color(0xFF6C96B5),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 200),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      SizedBox(
                      height: 15,
                      width: 15,
                      child: Opacity(
                        opacity: 0.8,
                        child: Image.asset(
                        'lib/assets/images/user.png',
                      ),
                      ),
                    ),
                      SizedBox(height: 10,)
                    ],
                    
                  ),
                  SizedBox(width: 5,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'USERNAME',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5,),
                      SizedBox(
                        height: 44,
                        width: 272,
                        child: TextFormField(
                          style: TextStyle(fontSize: 14.0),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Natataenako@email.com',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0,
                              horizontal: 12.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
            
                      SizedBox(
                        width: 260,
                        child: Text(
                          'This account will receive an OTP code on their phone number.',
                          style: TextStyle(
                            fontSize: 11,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: 30),
              SizedBox(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 5),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40,
                        width: 130,
                        child: ElevatedButton(
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => forgot_page_2(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            iconColor: Color(0xFF262629),
                            minimumSize: Size(double.infinity, 20),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                            backgroundColor:Colors.black,
                          ),
                          child: Text(
                            'Send OTP',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )
                        )
                      )
                    ],
                  ),
                ),
              )
            ]
          )
        )
      )
    );
  }
}