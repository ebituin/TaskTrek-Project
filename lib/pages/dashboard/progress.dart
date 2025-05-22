import 'package:flutter/material.dart';
import 'package:tasktrek/services/database.dart';
import 'package:tasktrek/styles/styles.dart';
import 'package:tasktrek/widgets/mediaSize.dart';

class Progress extends StatefulWidget {
  final bool isAdd;

  Progress({this.isAdd = false, super.key});

  @override
  State<Progress> createState() => _ProgressState();
}

class _ProgressState extends State<Progress> {
  bool _isAdd = false;
  String firstName = '';

  @override
  void initState() {
    super.initState();
    _isAdd = widget.isAdd;
    _loadUserData();
  }

  void toggleAddState() {
    setState(() {
      _isAdd = !_isAdd;
    });
  }

  Future<void> _loadUserData() async {
    try {
      final data = await UserCache.getUserData();
      if (!mounted) return;
      setState(() {
        firstName = data['firstName']!;
      });
    } catch (e) {
      print("Error fetching user data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return !_isAdd
        ? progressPage(isAdd: toggleAddState, firstName: firstName)
        : addTask(isAdd: toggleAddState);
  }
}

Widget progressPage({required VoidCallback isAdd, required String firstName}) {
  return SingleChildScrollView(
    scrollDirection: Axis.vertical,
    child: Center(
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            Text('Hi, $firstName!', style: AppTextStyles.title),
            SizedBox(height: 10),
            Text(
              'Here is your current task/s',
              style: TextStyle(fontSize: 24, color: AppColors.accentColor),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 655,
              width: 306,
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
                              Text(
                                'Task title',
                                style: AppTextStyles.body_title,
                              ),
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
                            onTap: isAdd,
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
      ),
    ),
  );
}

Widget addTask({required VoidCallback isAdd}) {
  return Container(
    color: AppColors.primaryColor,
    padding: EdgeInsets.only(
      top: SizeConfig.scaleHeight(35),
      left: SizeConfig.scaleWidth(40),
      right: SizeConfig.scaleWidth(40),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Kasal ni Ping',
          style: TextStyle(
            fontSize: 32,
            color: AppColors.accentColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: SizeConfig.screenHeight * 0.45,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.calendar_today_outlined,
                    color: AppColors.accentColor,
                    size: 35,
                  ),
                  SizedBox(width: SizeConfig.scaleWidth(15)),
                  Text(
                    'June 2, 2025',
                    style: TextStyle(
                      fontSize: 24,
                      color: AppColors.accentColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.access_time,
                    color: AppColors.accentColor,
                    size: 35,
                  ),
                  SizedBox(width: SizeConfig.scaleWidth(15)),
                  Text(
                    '1:00 AM - 4:00 AM',
                    style: TextStyle(
                      fontSize: 24,
                      color: AppColors.accentColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    color: AppColors.accentColor,
                    size: 35,
                  ),
                  SizedBox(width: SizeConfig.scaleWidth(15)),
                  SizedBox(
                    width: SizeConfig.screenWidth * 0.6,
                    child: Text(
                      'Balatas Road, Naga City, Camarines Sur',
                      style: TextStyle(
                        fontSize: 15,
                        color: AppColors.accentColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.menu, color: AppColors.accentColor, size: 35),
                  SizedBox(width: SizeConfig.scaleWidth(15)),
                  SizedBox(
                    width: SizeConfig.screenWidth * 0.6,
                    child: Text(
                      'Prepare all the things that must be done. Coordinate with the wedding planner.',
                      style: TextStyle(
                        fontSize: 15,
                        color: AppColors.accentColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        Expanded(
          //button
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: SizeConfig.screenWidth * 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: SizeConfig.scaleHeight(49),
                      width: 250,
                      child: ElevatedButton(
                        onPressed: isAdd,
                        child: Text(
                          'MARK AS DONE',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.accentColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
