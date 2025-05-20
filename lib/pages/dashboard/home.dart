import 'package:flutter/material.dart';
import 'package:tasktrek/styles/styles.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> tasks = [
      {'title': 'Task 1', 'description': 'Finish flutter proj'},
    ];
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: screenHeight * 0.41,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(30),
                  child: Text('Welcome, Eric!', style: AppTextStyles.title),
                ),
                Container(
                  margin: EdgeInsets.only(left: 15),
                  padding: EdgeInsets.only(bottom: 10),
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
                                  fontSize: screenWidth * 0.045,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'Here’s your recent announcements from your task.',
                                style: TextStyle(
                                  fontSize: screenWidth * 0.03,
                                  color: Colors.white,
                                ),
                                softWrap: true,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.175,
                        width: screenWidth,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.025,
                                vertical: screenHeight * 0.01,
                              ),
                              width: screenWidth * 0.75,
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
                                padding: EdgeInsets.all(screenWidth * 0.025),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          alignment: Alignment.center,
                                          width: screenWidth * 0.17,
                                          decoration: BoxDecoration(
                                            color: const Color(0xFF3E8F72),
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(
                                              screenWidth * 0.01,
                                            ),
                                            child: Text(
                                              'Important',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: screenWidth * 0.025,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.person_outline_rounded,
                                              size: screenWidth * 0.04,
                                              color: AppColors.accentColor,
                                            ),
                                            Text(
                                              'Eric',
                                              style: TextStyle(
                                                fontSize: screenWidth * 0.035,
                                                fontWeight: FontWeight.bold,
                                                color: AppColors.accentColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          'MA JOGGING KITA SAAGA.',
                                          style: TextStyle(
                                            fontSize: screenWidth * 0.03,
                                            color: AppColors.accentColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          'March 21, 2015',
                                          style: TextStyle(
                                            fontSize: screenWidth * 0.025,
                                            color: AppColors.accentColor,
                                          ),
                                        ),
                                        RotatedBox(
                                          quarterTurns: 2,
                                          child: Icon(
                                            Icons.arrow_back,
                                            size: screenWidth * 0.05,
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
            height: screenHeight * 0.05,
            width: screenWidth * 0.8,
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
          Expanded(
            child: Center(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  SizedBox(
                    width: screenWidth * 0.7,
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
                                height: screenHeight * 0.135,
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
                                      padding: EdgeInsets.all(
                                        screenWidth * 0.025,
                                      ),
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
                                              fontSize: screenWidth * 0.04,
                                            ),
                                          ),
                                          Text(
                                            tasks[index]['description'] ?? '',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: screenWidth * 0.03,
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
                                          padding: EdgeInsets.all(
                                            screenWidth * 0.025,
                                          ),
                                          child: Icon(
                                            Icons.more_horiz_rounded,
                                            color: Colors.white,
                                            size: screenWidth * 0.07,
                                          ),
                                        ),
                                        Image.asset(
                                          'lib/assets/images/BrgySphere.png',
                                          width: screenWidth * 0.2,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: screenHeight * 0.08,
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
                                      padding: EdgeInsets.all(
                                        screenWidth * 0.025,
                                      ),
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
                                                size: screenWidth * 0.045,
                                              ),
                                              SizedBox(
                                                width: screenWidth * 0.02,
                                              ),
                                              Text(
                                                'New announcement',
                                                style: TextStyle(
                                                  fontSize: screenWidth * 0.03,
                                                  color: AppColors.accentColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.person_outline_rounded,
                                                color: AppColors.accentColor,
                                                size: screenWidth * 0.045,
                                              ),
                                              SizedBox(
                                                width: screenWidth * 0.02,
                                              ),
                                              Text(
                                                '99 people',
                                                style: TextStyle(
                                                  fontSize: screenWidth * 0.03,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(
                                        screenWidth * 0.025,
                                      ),
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: screenWidth * 0.24,
                                        child: PopupMenuButton<int>(
                                          padding: EdgeInsets.zero,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              6,
                                            ),
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
                                                          AppColors.accentColor,
                                                      fontSize:
                                                          screenWidth * 0.03,
                                                    ),
                                                  ),
                                                ),
                                                PopupMenuItem(
                                                  value: 2,
                                                  child: Text(
                                                    'Leave Barangay Space',
                                                    style: TextStyle(
                                                      color:
                                                          AppColors.accentColor,
                                                      fontSize:
                                                          screenWidth * 0.03,
                                                    ),
                                                  ),
                                                ),
                                                PopupMenuItem(
                                                  value: 3,
                                                  child: Text(
                                                    'View People',
                                                    style: TextStyle(
                                                      color:
                                                          AppColors.accentColor,
                                                      fontSize:
                                                          screenWidth * 0.03,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                          child: Container(
                                            alignment: Alignment.center,
                                            height: screenHeight * 0.045,
                                            width: screenWidth * 0.23,
                                            decoration: BoxDecoration(
                                              color: AppColors.itemContainer,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: const Text(
                                              'View',
                                              style: TextStyle(
                                                color: Colors.white,
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
                    child: IconButton.filled(
                      onPressed: () {},
                      icon: Icon(
                        Icons.add_rounded,
                        size: screenWidth * 0.15,
                        color: Colors.white,
                      ),
                      style: IconButton.styleFrom(
                        backgroundColor: Color(0xFF050A35),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
