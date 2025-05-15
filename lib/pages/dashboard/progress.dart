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
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40),
          Text('Hi, Name!', style: AppTextStyles.title),
          SizedBox(height: 10),
          Text('Here is your current task/s', style: AppTextStyles.subtitle),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                      bottom: 20, left: 40, right: 40),
                  child: Container(
                    height: 95,
                    width: 250,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: AppColors.backgroundColor,
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
                            Text('Task time', style: AppTextStyles.time),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('View', style: AppTextStyles.body_button),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.accentColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
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
