import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:tasktrek/pages/dashboard/progress.dart';
import 'package:tasktrek/pages/dashboard/settings.dart';
import 'package:tasktrek/styles/styles.dart';
import 'home.dart';

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
  int _selectedPage = 0;
@override
Widget build(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;
  final screenHeight = MediaQuery.of(context).size.height;

  return Scaffold(
    backgroundColor: AppColors.primaryColor,
    appBar: AppBar(
      backgroundColor: AppColors.primaryColor,
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

    body: Center(
      child: Column(
        children: [
          Expanded(child: _getSelectedPage(_selectedPage)),
          SizedBox(height: screenHeight * 0.02),
          Container(
            width: screenWidth * 0.75, // was 280
            height: screenHeight * 0.06, // was 44
            margin: EdgeInsets.all(screenWidth * 0.05), // was 20
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _bottomTabItem(
                  index: 0,
                  icon: Icons.home,
                  label: 'Home',
                  screenWidth: screenWidth,
                ),
                _bottomTabItem(
                  index: 1,
                  icon: Icons.people_outline,
                  label: 'In-Progress',
                  screenWidth: screenWidth,
                ),
                _bottomTabItem(
                  index: 2,
                  icon: Icons.settings_outlined,
                  label: 'Settings',
                  screenWidth: screenWidth,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _bottomTabItem({
  required int index,
  required IconData icon,
  required String label,
  required double screenWidth,
}) {
  return GestureDetector(
    onTap: () {
      setState(() {
        _selectedPage = index;
      });
    },
    child: Container(
      width: screenWidth * 0.22, // was 90
      height: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Opacity(
        opacity: _selectedPage == index ? 1 : 0.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: AppColors.accentColor),
            Text(label, style: AppTextStyles.body_subtitle),
          ],
        ),
      ),
    ),
  );
}


  Widget _getSelectedPage(int index) {
    switch (2) {
      case 0:
        return SpherePage();
      case 1:
        return Progress();
      case 2:
        return Settings();
      default:
        return SpherePage();
    }
  }
}
