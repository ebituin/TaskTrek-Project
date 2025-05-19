/* 
  Authored by: Prince Albert P. San Juan
  Company: Stark Industries
  Project: Task Trek
  Feature: [SI-004] OTP verification
  Description: This page is where the user will input the otp
 */

import 'package:flutter/material.dart';
import 'package:tasktrek/pages/home/reset_password/resetPassword.dart';

class forgot_page_2 extends StatefulWidget {
  const forgot_page_2({super.key});



  @override
  State<forgot_page_2> createState() => _forgot_pagePageState();
}

class _forgot_pagePageState extends State<forgot_page_2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF6C96B5),
      appBar: AppBar(
        backgroundColor:Color(0xFF6C96B5),
      ),
      body: Center(
        
        child: 
          Padding(
            padding: const EdgeInsets.only(bottom: 200.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'OTP Verification',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 25,),
                SizedBox(
                  width: 240,
                  child: Text(
                    'Enter the OTP code you received in your phone number',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black54
                    ),
                    textAlign: TextAlign.center,
                ),
                ),
                SizedBox(height: 60),
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          child: SizedBox(
                            height: 38.0,
                            width: 39.0,
                            child: TextFormField(
                              style: TextStyle(
                                fontSize: 14.0,
                                ),
                                textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: '0',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6)
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  
                                  vertical: 10.0,
                                  horizontal: 15.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),

                          child: SizedBox(
                            height: 38.0,
                            width: 39.0,
                            child: TextFormField(
                              style: TextStyle(fontSize: 14.0),
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: '0',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6)
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.0,
                                  horizontal: 12.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: SizedBox(
                            height: 38.0,
                            width: 39.0,
                            child: TextFormField(
                              style: TextStyle(fontSize: 14.0),
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: '0',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6)

                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.0,
                                  horizontal: 12.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: SizedBox(
                            height: 38.0,
                            width: 39.0,
                            child: TextFormField(
                              style: TextStyle(fontSize: 14.0),
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: '0',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6)
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.0,
                                  horizontal: 12.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                      'Didn\’t receive an OTP code?',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                      ),
                      TextButton(
                        onPressed:() {
                          
                        },
                        child: Text(
                          'Resend OTP',
                          style: TextStyle(
                            fontSize:12,
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            decorationThickness: 1.4
                          ),
                          )
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  SizedBox(
                    height: 44,
                    width: 286,
                    child: ElevatedButton(
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => forgot_Reset(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        iconColor: Colors.black,
                        minimumSize: Size(double.infinity, 20),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                        backgroundColor: Colors.black,
                      ),
                      child: Text(
                        'Verify',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                      
              ],
            ),
          ),
      ),
    );
  }
}
