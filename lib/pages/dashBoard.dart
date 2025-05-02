import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class DatabaseHelper {
  static Database? _database; // Singleton pattern
  static const String _dbName = "app_db.db"; // Database name
  static const int _dbVersion = 1; // Database version

  // Table and columns
  static const String _tableName = 'students';
  static const String columnId = 'id';
  static const String columnName = 'name';
  static const String columnEmail = 'email';
  static const String columnPassword = 'password';

  // Open the database
  static Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _initDatabase();
      return _database!;
    }
  }

  // Initialize the database
  static Future<Database> _initDatabase() async {
    final path = join(await getDatabasesPath(), _dbName);
    return await openDatabase(
      path,
      version: _dbVersion,
      onCreate: (db, version) async {
        // Create the table when the database is created
        await db.execute('''
          CREATE TABLE $_tableName (
            $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
            $columnName TEXT NOT NULL,
            $columnEmail TEXT NOT NULL,
            $columnPassword TEXT NOT NULL
          )
        ''');
      },
    );
  }

  // Insert a new user into the database
  static Future<void> insertUser(
    String name,
    String email,
    String password,
  ) async {
    final db = await database; // Get the database instance

    // Prepare the user data to insert
    Map<String, dynamic> user = {
      columnName: name,
      columnEmail: email,
      columnPassword: password,
    };

    // Insert the user data into the table
    await db.insert(
      _tableName, // Table name
      user, // Data to insert
      conflictAlgorithm: ConflictAlgorithm.replace, // Handle conflict if needed
    );
  }
}

void addUser() async {
  // Example: Adding a user with name and email
  await DatabaseHelper.insertUser(
    'John Doe',
    'johndoe@example.com',
    'user@user.com',
  );
  print('User added!');
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> tasks = [
      {'title': 'Task 1', 'description': 'Finish flutter proj'},
      {'title': 'Task 2', 'description': 'Update UI design'},
      {'title': 'Task 3', 'description': 'Fix login bug'},
      {'title': 'Task 4', 'description': 'Push to GitHub'},
      {'title': 'Task 5', 'description': 'Write documentation'},
      {'title': 'Task 6', 'description': 'Test on emulator'},
    ];
    List<Widget> bottomNavTasks = [
      Text('Sphere:'),
      Text('In-Progress:'),
      Text('Account:'),
    ];

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFF018F81),
      appBar: AppBar(
        backgroundColor: const Color(0xFF018F81),
        title: const Text(
          'TASKTREK',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: const [
            DrawerHeader(child: Text('User')),
            ListTile(leading: Icon(Icons.dashboard), title: Text('Dashboard')),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_outline),
            label: 'In-Progress',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: 'Settings',
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: screenHeight * 0.4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Text(
                    'Welcome, Eric!',
                    style: TextStyle(
                      color: const Color(0xFF050A35),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, bottom: 25),
                  child: Container(
                    padding: EdgeInsets.only(left: 0, bottom: 5),
                    width: screenWidth * 1,
                    decoration: BoxDecoration(
                      color: const Color(0xFFA3D2CB),
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 13),
                          child: Container(
                            margin: EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Recent Announcement',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Here’s your recent announcements from your task.',
                                  style: TextStyle(fontSize: 12),
                                  softWrap: true,
                                ),
                              ],
                            ),
                          ),
                        ),

                        SizedBox(
                          height: screenHeight * 0.175,
                          width: screenWidth * 1,
                          child: ListView.builder(
                            controller: PageController(
                              viewportFraction: 0.75,
                              initialPage: 0,
                            ),
                            scrollDirection: Axis.horizontal,
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 10,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: const Color(0xFF018F81),
                                  ),
                                  color: Colors.white,
                                  image: const DecorationImage(
                                    image: AssetImage(
                                      'lib/assets/images/Frame 117.png',
                                    ),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            alignment: Alignment.center,
                                            width: screenWidth * 0.17,
                                            decoration: BoxDecoration(
                                              color: const Color(0xFF3E8F72),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(
                                                3.0,
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
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.person_outline_rounded,
                                              ),
                                              Text(
                                                'Eric',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            'MA JOGGING KITA SAAGA.',
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            'March 21, 2015',
                                            style: TextStyle(fontSize: 10),
                                          ),
                                          RotatedBox(
                                            quarterTurns: 2,
                                            child: Icon(Icons.arrow_back),
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
                          margin: const EdgeInsets.symmetric(vertical: 15),
                          child: Column(
                            children: [
                              Container(
                                height: screenHeight * 0.135,
                                decoration: const BoxDecoration(
                                  color: Color(0xFF3336AB),
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            tasks[index]['title'] ?? '',
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                            ),
                                          ),
                                          Text(
                                            tasks[index]['description'] ?? '',
                                            style: const TextStyle(
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
                                          padding: const EdgeInsets.all(8.0),
                                          child: Icon(
                                            Icons.more_horiz_rounded,
                                            color: Colors.white,
                                            size: screenWidth * 0.07,
                                          ),
                                        ),
                                        Image.asset(
                                          'lib/assets/images/Brgy. Sphere Card Illustration.png',
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
                                            children: const [
                                              Icon(
                                                Icons.campaign_outlined,
                                                color: Color(0xFF050A35),
                                              ),
                                              SizedBox(width: 5),
                                              Text(
                                                'New announcement',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Color(0xFF050A35),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.person_outline_rounded,
                                                color: const Color(0xFF050A35),
                                                size: screenWidth * 0.05,
                                              ),
                                              SizedBox(
                                                width: screenWidth * 0.01,
                                              ),
                                              const Text(
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
                                              // Action 1
                                            } else if (value == 2) {
                                              // Action 2
                                            } else if (value == 3) {
                                              // Action 3
                                            }
                                          },
                                          itemBuilder:
                                              (context) => [
                                                const PopupMenuItem(
                                                  value: 1,
                                                  child: Text('Data 1'),
                                                ),
                                                const PopupMenuItem(
                                                  value: 2,
                                                  child: Text('Data 2'),
                                                ),
                                                const PopupMenuItem(
                                                  value: 3,
                                                  child: Text('Data 3'),
                                                ),
                                              ],
                                          offset: const Offset(0, 50),
                                          child: Container(
                                            height: screenWidth * 0.1,
                                            decoration: BoxDecoration(
                                              color: const Color(0xFF3336AB),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: const Center(
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
                  Positioned(
                    bottom: 20,
                    child: IconButton.filled(
                      onPressed: () {},
                      icon: Icon(
                        Icons.add_rounded,

                        size: screenWidth * 0.15,
                        color: const Color(0xFF018F81),
                        weight: 1000,
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
