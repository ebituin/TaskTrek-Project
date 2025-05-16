import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tasktrek/styles/styles.dart';

Widget buildTextFieldRow(String label, String hint, double screenHeight) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 25),
          child: Icon(Icons.circle, color: AppColors.accentColor),
        ),
        SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  color: AppColors.accentColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 4),
              SizedBox(
                height: 38,
                width: 258,
                child: TextFormField(
                  textAlign: TextAlign.start,
                  cursorColor: AppColors.accentColor,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    hintText: hint,
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
            SizedBox(height: screenHeight * 0.02),
            ],
          ),
        ),
        
      ],
    );
  }