import 'package:flutter/material.dart';
import 'package:tasktrek/styles/styles.dart';
import 'package:tasktrek/widgets/mediaSize.dart';
import 'package:tasktrek/widgets/textFieldRow.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _taskTitleController = TextEditingController();
  final TextEditingController _taskDescriptionController =
      TextEditingController();
  final TextEditingController _taskDueDateController = TextEditingController();
  final TextEditingController _taskTimeController = TextEditingController();
  final TextEditingController _taskLocationController = TextEditingController();

  int? selectedDayIndex;
  int? weekIndex;
  String? dayName;
  int? day;

  int _dayToWeekIndex(String char) {
    const days = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];
    return days.indexOf(char.toUpperCase());
  }

  String _weekIndexToName(int weekIndex) {
    switch (weekIndex) {
      case 0:
        return 'Sunday';
      case 1:
        return 'Monday';
      case 2:
        return 'Tuesday';
      case 3:
        return 'Wednesday';
      case 4:
        return 'Thursday';
      case 5:
        return 'Friday';
      case 6:
        return 'Saturday';
      default:
        return '';
    }
  }

  void _handleDayTap(String weekDayChar, int selectedDay, int index) {
    final weekIdx = _dayToWeekIndex(weekDayChar);
    final name = _weekIndexToName(weekIdx);
    setState(() {
      weekIndex = weekIdx;
      dayName = name;
      day = selectedDay;
      selectedDayIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    // Sample task list
    final List<Map<String, dynamic>> taskList = [
      {
        'day': 1,
        'haveTask': true,
        'taskTitle': 'Kasal ni Ping',
        'taskTime': '1:00 AM - 4:00 AM',
      },
      {
        'day': 2,
        'haveTask': true,
        'taskTitle': 'Meeting',
        'taskTime': '10:00 AM - 11:00 AM',
      },
      {
        'day': 3,
        'haveTask': true,
        'taskTitle': 'Project Deadline',
        'taskTime': 'All Day',
      },
    ];

    final Map<String, dynamic>? selectedTask = taskList.firstWhere(
      (item) => item['day'] == day,
      orElse: () => {},
    );

    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(scrollbars: false),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: SizeConfig.screenHeight * 0.5,
              minWidth: SizeConfig.screenWidth,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: 400,
                child: Column(
                  children: [
                    SizedBox(
                      width: 400,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder:
                                    (context) => addTask(
                                      context,
                                      _taskTitleController,
                                      _taskDescriptionController,
                                      _taskDueDateController,
                                      _taskTimeController,
                                      _taskLocationController,
                                    ),
                              );
                            },

                            child: Icon(Icons.add, size: 30),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 400,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            Text(
                              'Calendar',
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: AppColors.accentColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 400,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 10,
                          right: 10,
                          top: 30,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '<',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: AppColors.accentColor,
                              ),
                            ),
                            Text(
                              'June 2025',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: AppColors.accentColor,
                              ),
                            ),
                            Text(
                              '>',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: AppColors.accentColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: 400,
                        height: SizeConfig.screenWidth * 0.76,
                        child: GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 7,
                              ),
                          itemCount: 37,
                          itemBuilder: (context, index) {
                            return calendarChar(
                              index: index,
                              isSelected: selectedDayIndex == index,
                              onPressed:
                                  (weekDay, day) =>
                                      _handleDayTap(weekDay, day, index),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: SizeConfig.screenWidth * 0.02),
                    if ((dayName ?? '').isNotEmpty &&
                        (day ?? '').toString().isNotEmpty)
                      Row(
                        children: [
                          Text(
                            '$dayName,',
                            style: TextStyle(
                              fontSize: 32,
                              color: AppColors.accentColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            day.toString(),
                            style: TextStyle(
                              fontSize: 32,
                              color: AppColors.accentColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )
                    else
                      SizedBox(height: 40),
                    SizedBox(height: SizeConfig.screenWidth * 0.05),
                    if (selectedTask!.isNotEmpty &&
                        selectedTask['haveTask'] == true)
                      task(
                        haveTask: true,
                        title: selectedTask['taskTitle'],
                        time: selectedTask['taskTime'],
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget addTask(
  BuildContext context,
  TextEditingController taskTitleController,
  TextEditingController taskDescriptionController,
  TextEditingController taskDueDateController,
  TextEditingController taskTimeController,
  TextEditingController taskLocationController,
) {
  return Dialog(
    backgroundColor: AppColors.primaryColor,
    child: ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 600),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        width: 318,
        child: SingleChildScrollView(
          child: IntrinsicHeight(
            child: Column(
              children: [
                Text(
                  'Please input new Task Info',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.accentColor,
                  ),
                ),
                SizedBox(height: 20),

                // Task Title
                PasswordTextFieldRow(
                  width: 220,
                  hint: 'Enter task title',
                  controller: taskTitleController,
                ),
                PasswordTextFieldRow(
                  hint: 'Enter task description',
                  width: 220,
                  controller: taskTitleController,
                ),
                PasswordTextFieldRow(
                  width: 220,
                  hint: 'Enter due date',
                  controller: taskTitleController,
                ),
                PasswordTextFieldRow(
                  width: 220,
                  hint: 'Enter task time',
                  controller: taskTitleController,
                ),
                PasswordTextFieldRow(
                  width: 220,
                  hint: 'Enter location',
                  controller: taskTitleController,
                ),

                SizedBox(height: 15),

                // Task Description
                SizedBox(height: 25),

                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Add'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.accentColor,
                    foregroundColor: AppColors.primaryColor,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

Widget task({
  required bool haveTask,
  required String title,
  required String time,
}) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      width: 311,
      height: 96,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(25),
        boxShadow: [BoxShadow(blurRadius: 6, color: Colors.black12)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.accentColor,
            ),
          ),
          SizedBox(height: 6),
          Text(
            time,
            style: TextStyle(fontSize: 20, color: AppColors.accentColor),
          ),
        ],
      ),
    ),
  );
}

Widget calendarChar({
  required int index,
  required bool isSelected,
  required void Function(String weekDay, int day) onPressed,
}) {
  final List<String> weekDays = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];

  if (index < 7) {
    return SizedBox(
      width: 40,
      height: 40,
      child: Center(
        child: Text(
          weekDays[index],
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  final int dayNumber = index - 6;
  final int dayOfWeekIndex = index % 7;
  final String dayOfWeek = weekDays[dayOfWeekIndex];

  return GestureDetector(
    behavior: HitTestBehavior.opaque,
    onTap: () => onPressed(dayOfWeek, dayNumber),
    child: SizedBox.expand(
      child: Container(
        alignment: Alignment.center,
        color: isSelected ? AppColors.accentColor.withOpacity(0.5) : null,
        child: Text('$dayNumber', style: TextStyle(fontSize: 16)),
      ),
    ),
  );
}
