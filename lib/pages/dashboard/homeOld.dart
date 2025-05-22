import 'package:flutter/material.dart';
import 'package:tasktrek/styles/styles.dart';
import 'package:tasktrek/widgets/mediaSize.dart';

class homeOld extends StatefulWidget {
  const homeOld({super.key});

  @override
  State<homeOld> createState() => _homeOldState();
}

class _homeOldState extends State<homeOld> {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    List<Map<String, String>> tasks = [
      {'title': 'Task 1', 'description': 'Finish flutter proj'},
      {'title': 'Task 1', 'description': 'Finish flutter proj'},
      {'title': 'Task 1', 'description': 'Finish flutter proj'},
      {'title': 'Task 1', 'description': 'Finish flutter proj'},
    ];
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 347,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Text('Welcome, Eric!', style: AppTextStyles.title),
                  ),
                  Container(
                    height: 204,
                    margin: EdgeInsets.only(left: 15),
                    alignment: Alignment.center,
                    width: screenWidth,
                    decoration: BoxDecoration(
                      color: AppColors.itemContainer,
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Container(
                            margin: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Recent Announcement',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: 241,
                                  child: Text(
                                    'Here’s your recent announcements from your task.',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                    ),
                                    softWrap: true,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 108,
                          width: screenWidth,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                width: 233,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: const Color(0xFF018F81),
                                  ),
                                  color: Colors.white,
                                  image: const DecorationImage(
                                    image: AssetImage(
                                      'lib/assets/images/Frame_117.png',
                                    ),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 5,
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.zero,
                                            alignment: Alignment.center,
                                            width: 58,
                                            height: 15,
                                            decoration: BoxDecoration(
                                              color: const Color(0xFF3E8F72),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Text(
                                              'Important',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 8,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            'March 21, 2015',
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: AppColors.accentColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 58,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.person_outline_rounded,
                                                  size: 16,
                                                  color: AppColors.accentColor,
                                                ),
                                                Text(
                                                  'Eric',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold,
                                                    color:
                                                        AppColors.accentColor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              'MA JOGGING KITA SAAGA.',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: AppColors.accentColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          RotatedBox(
                                            quarterTurns: 2,
                                            child: Icon(
                                              Icons.arrow_back,
                                              size: 16,
                                              color: AppColors.accentColor,
                                            ),
                                          ),
                                        ],
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
                ],
              ),
            ),
            Container(
              height: 40,
              width: 260,
              alignment: Alignment.centerLeft,
              child: const Text(
                'Task Trek Sphere',
                style: TextStyle(
                  color: Color(0xFF050A35),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.screenHeight * 0.305,
              child: Center(
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    SizedBox(
                      width: 298,
                      child: ListView.builder(
                        itemCount: tasks.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.symmetric(
                              vertical: screenHeight * 0.02,
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: 109,
                                  decoration: const BoxDecoration(
                                    color: AppColors.itemContainer,
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(20),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(5),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(
                                              tasks[index]['title'] ?? '',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                              ),
                                            ),
                                            Text(
                                              tasks[index]['description'] ?? '',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.all(10),
                                            child: Icon(
                                              Icons.more_horiz_rounded,
                                              color: Colors.white,
                                              size: 20,
                                            ),
                                          ),
                                          Image.asset(
                                            'lib/assets/images/BrgySphere.png',
                                            width: 110,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 67,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFCCCCEA),
                                    borderRadius: BorderRadius.vertical(
                                      bottom: Radius.circular(20),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.campaign_outlined,
                                                  color: AppColors.accentColor,
                                                  size: 15,
                                                ),
                                                SizedBox(width: 5),
                                                Text(
                                                  'New announcement',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color:
                                                        AppColors.accentColor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.person_outline_rounded,
                                                  color: AppColors.accentColor,
                                                  size: 15,
                                                ),
                                                SizedBox(width: 5),
                                                Text(
                                                  '99 people',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Container(
                                          alignment: Alignment.center,
                                          width: 97,
                                          height: 39,
                                          child: PopupMenuButton<int>(
                                            padding: EdgeInsets.zero,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                            ),
                                            onSelected: (value) {
                                              // Action handling
                                            },
                                            itemBuilder:
                                                (context) => [
                                                  PopupMenuItem(
                                                    value: 1,
                                                    child: Text(
                                                      'Copy Code',
                                                      style: TextStyle(
                                                        color:
                                                            AppColors
                                                                .accentColor,
                                                        fontSize: 10,
                                                      ),
                                                    ),
                                                  ),
                                                  PopupMenuItem(
                                                    value: 2,
                                                    child: Text(
                                                      'Leave Barangay Space',
                                                      style: TextStyle(
                                                        color:
                                                            AppColors
                                                                .accentColor,
                                                        fontSize: 10,
                                                      ),
                                                    ),
                                                  ),
                                                  PopupMenuItem(
                                                    value: 3,
                                                    child: Text(
                                                      'View People',
                                                      style: TextStyle(
                                                        color:
                                                            AppColors
                                                                .accentColor,
                                                        fontSize: 10,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                            child: Container(
                                              alignment: Alignment.center,
                                              height: 38,
                                              width: 97,
                                              decoration: BoxDecoration(
                                                color: AppColors.itemContainer,
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: const Text(
                                                'View',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFF050A35),
                            borderRadius: BorderRadius.circular(80),
                          ),
                          child: Icon(
                            Icons.add_rounded,
                            size: 75,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(width: 212, height: 31, child: Column()),
        ElevatedButton(
          onPressed: () {},
          child: Text('Add Task', style: TextStyle(fontSize: 15)),
        ),
      ],
    );
  }
}
