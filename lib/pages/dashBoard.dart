import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> tasks = [
      {'title': 'Task 1', 'description': 'Finish flutter proj'},
      {'title': 'Task 1', 'description': 'Finish flutter proj'},
      {'title': 'Task 1', 'description': 'Finish flutter proj'},
      {'title': 'Task 1', 'description': 'Finish flutter proj'},
      {'title': 'Task 1', 'description': 'Finish flutter proj'},
      {'title': 'Task 1', 'description': 'Finish flutter proj'},
    ];

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xFF018F81),
      appBar: AppBar(
        backgroundColor: Color(0xFF018F81),
        title: Text('TASKTREK', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: Text('User')),
            ListTile(leading: Icon(Icons.dashboard), title: Text('Dashboard')),
          ],
        ),
      ),
      body: Column(
        // <-- Start Column directly
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            color: Colors.amber,
            height: screenHeight * 0.35,
            width: double.infinity,
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  color: Colors.amberAccent,
                  height: screenHeight * 0.1,
                  child: Text('Welcome, Name'),
                ),
              ],
            ),
          ),
          Container(
            height: screenHeight * 0.05,
            color: Colors.amber[200],
            width: screenWidth * 0.8,
            alignment: Alignment.centerLeft,
            child: Text(
              'Task Trek Sphere',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            // <-- Expanded for the ListView part
            child: Center(
              child: Container(
                width: screenWidth * 0.7,
                child: ListView.builder(
                  itemCount: tasks.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 15),
                      child: Column(
                        children: [
                          Container(
                            height: screenHeight * 0.135,
                            decoration: BoxDecoration(
                              color: const Color(0xFF3336AB),
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        'JOGGIN ROUTINE',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                        ),
                                      ),
                                      Text(
                                        '02343',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(
                                        Icons.more_horiz_rounded,
                                        color: Colors.white,
                                        size: screenWidth * 0.07,
                                      ),
                                    ),
                                    Image.asset('lib/assets/images/Brgy. Sphere Card Illustration.png')
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: screenHeight * 0.08,
                            decoration: BoxDecoration(
                              color: const Color(0xFFCCCCEA),
                              borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(20),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(Icons.campaign_outlined),
                                          Text(
                                            'New announcement',
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.person_outline_rounded,
                                            size: screenWidth * 0.05,
                                          ),
                                          SizedBox(width: screenWidth * 0.01),
                                          Text(
                                            '99 people',
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: screenWidth * 0.24,
                                    child: PopupMenuButton<int>(
                                      onSelected: (value) {
                                        if (value == 1) {
                                          // Handle action
                                        } else if (value == 2) {
                                          // Handle action
                                        } else if (value == 3) {
                                          // Handle action
                                        }
                                      },
                                      itemBuilder:
                                          (context) => [
                                            PopupMenuItem(
                                              value: 1,
                                              child: Text('Data 1'),
                                            ),
                                            PopupMenuItem(
                                              value: 2,
                                              child: Text('Data 2'),
                                            ),
                                            PopupMenuItem(
                                              value: 3,
                                              child: Text('Data 3'),
                                            ),
                                          ],
                                      offset: Offset(
                                        0,
                                        50,
                                      ), // Makes it pop lower
                                      child: Container(
                                        height: screenWidth * 0.1,
                                        decoration: BoxDecoration(
                                          color: Color(0xFF3336AB),
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'View',
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.white,
                                            ),
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
            ),
          ),
        ],
      ),
    );
  }
}
