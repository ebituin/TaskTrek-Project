import 'package:flutter/material.dart';
import 'package:tasktrek/styles/styles.dart';
import 'package:tasktrek/widgets/mediaSize.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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

  void _handleDayTap(String weekDayChar, int selectedDay) {
    final index = _dayToWeekIndex(weekDayChar);
    final name = _weekIndexToName(index);
    setState(() {
      weekIndex = index;
      dayName = name;
      day = selectedDay; // <- ADD THIS LINE
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
            width: 400,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [Icon(Icons.add, size: 30)],
                ),
                Padding(
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
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 30),
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
                Container(
                  alignment: Alignment.center,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: 325),
                    child: SizedBox(
                      width: 400,
                      height: SizeConfig.screenWidth * 0.75,
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 7,
                        ),
                        itemCount: 37,
                        itemBuilder: (context, index) {
                          return calendarChar(
                            index: index,
                            onPressed: _handleDayTap,
                          );
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget calendarChar({
  required int index,
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
    onTap: () => onPressed(dayOfWeek, dayNumber),
    child: SizedBox(
      width: 40,
      height: 40,
      child: Center(child: Text('$dayNumber', style: TextStyle(fontSize: 16))),
    ),
  );
}
