import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tasktrek/styles/styles.dart';

Widget buildTextFieldRow(
  String label,
  String hint,
  TextEditingController controller,
) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(width: 50),
            Text(
              label,
              style: TextStyle(
                color: AppColors.accentColor,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ],
        ),
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.circle, color: AppColors.accentColor),
            SizedBox(width: 10),
            SizedBox(
              height: 38,
              width: 258,
              child: TextFormField(
                controller: controller,
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
          ],
        ),
        SizedBox(height: 20),
      ],
    ),
  );
}
