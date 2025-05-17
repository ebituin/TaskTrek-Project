import 'package:flutter/material.dart';
import 'package:tasktrek/styles/styles.dart';

class Progress extends StatefulWidget {
  const Progress({super.key});

  @override
  State<Progress> createState() => _ProgressState();
}

class _ProgressState extends State<Progress> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40),
          Text('Hi, Name!', style: AppTextStyles.title),
          SizedBox(height: 10),
          Text(
            'Here is your current task/s',
            style: TextStyle(fontSize: 24, color: AppColors.accentColor),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                    bottom: 20,
                    left: 30,
                    right: 30,
                  ),
                  child: Container(
                    height: 95,
                    width: 306,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: AppColors.secondaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Task title', style: AppTextStyles.body_title),
                            Opacity(
                              opacity: 0.5,
                              child: Text(
                                'April 20, 2025',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: AppColors.accentColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            alignment: Alignment.center,
                            width: 72,
                            height: 39,
                            decoration: BoxDecoration(
                              color: AppColors.accentColor,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Text(
                              'View',
                              style: AppTextStyles.body_button,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
